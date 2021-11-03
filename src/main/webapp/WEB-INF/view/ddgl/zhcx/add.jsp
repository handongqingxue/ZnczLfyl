<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@include file="../../inc/js.jsp"%>
<style type="text/css">
.center_con_div{
	height: 90vh;
	margin-left:205px;
	position: absolute;
}
.page_location_div{
	height: 50px;
	line-height: 50px;
	margin-left: 20px;
	font-size: 18px;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var dialogTop=10;
var dialogLeft=20;
var ndNum=0;
$(function(){
	initNewDialog();
	
	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var ndpw=$("body").find(".panel.window").eq(ndNum);
	var ndws=$("body").find(".window-shadow").eq(ndNum);
	
	//var abssdmdpw=$("body").find(".panel.window").eq(abssdmdNum);
	//var abssdmdws=$("body").find(".window-shadow").eq(abssdmdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(ndpw);
	ccDiv.append(ndws);
	ccDiv.css("width",setFitWidthInParent("body","center_con_div")+"px");
	
	//var abssdmdDiv=$("#add_bs_canvas_dialog_div");
	//abssdmdDiv.append(abssdmdpw);
	//abssdmdDiv.append(abssdmdws);
}

function initNewDialog(){
	dialogTop+=20;
	$("#new_div").dialog({
		title:"站点信息",
		width:setFitWidthInParent("body","new_div"),
		height:730,
		top:dialogTop,
		left:dialogLeft,
		buttons:[
           {text:"保存",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   checkAdd();
           }}
        ]
	});

	$("#new_div table").css("width",(setFitWidthInParent("body","new_div_table"))+"px");
	$("#new_div table").css("magin","-100px");
	$("#new_div table td").css("padding-left","30px");
	$("#new_div table td").css("padding-right","20px");
	$("#new_div table td").css("font-size","15px");
	$("#new_div table .td1").css("width","10%");
	$("#new_div table .td2").css("width","35%");
	$("#new_div table tr").css("border-bottom","#CAD9EA solid 1px");
	$("#new_div table tr").each(function(i){
		if(i==2)
			$(this).css("height","250px");
		else
			$(this).css("height","45px");
	});

	$(".panel.window").eq(ndNum).css("margin-top","20px");
	$(".panel.window .panel-title").eq(ndNum).css("color","#000");
	$(".panel.window .panel-title").eq(ndNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ndNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(ndNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(ndNum).css("border-color","#ddd");

	$("#new_div #ok_but").css("left","45%");
	$("#new_div #ok_but").css("position","absolute");
	
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "center_con_div":
		space=205;
		break;
	case "new_div":
		space=340;
		break;
	case "add_bs_sd_map_dialog_div":
		space=170;
		break;
	case "new_div_table":
	case "panel_window":
		space=355;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}
</script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
	<%@include file="../../inc/side.jsp"%>
	<div class="center_con_div" id="center_con_div">
		<div class="page_location_div">添加订单</div>
		
		<div id="new_div">
			<form id="form1" name="form1" method="post" action="" enctype="multipart/form-data">
			<table>
			  <tr>
				<td class="td1" align="right">
					站点名
				</td>
				<td class="td2">
					<input type="text" class="name_inp" id="name" name="name" placeholder="请输入站点名" onfocus="focusName()" onblur="checkName()"/>
				</td>
				<td class="td1" align="right">
					排序
				</td>
				<td class="td2">
					<input type="number" class="sort_inp" id="sort" name="sort" placeholder="请输入排序"/>
				</td>
			  </tr>
			  <tr>
				<td class="td1" align="right">
					x轴坐标
				</td>
				<td class="td2">
					<span id="x_span"></span>
					<input type="hidden" id="x_inp" name="x"/>
				</td>
				<td class="td1" align="right">
					y轴坐标
				</td>
				<td class="td2">
					<span id="y_span"></span>
					<input type="hidden" id="y_inp" name="y"/>
				</td>
			  </tr>
			  <tr>
				<td class="td1" align="right">
					景区地图
				</td>
				<td class="td2">
					<div class="upBut_div showMapBut_div" onclick="openAddBsDialog(1);">显示地图</div>
					<img class="sceDis_img" id="sceDis_img" alt="" src="${sessionScope.user.scenicDistrict.mapUrl }"/>
				</td>
				<td class="td1" align="right">
					站点车辆
				</td>
				<td class="td2">
					<select id="busNoIds_cbb"></select>
					<input type="hidden" id="busNoIds" name="busNoIds"/>
				</td>
			  </tr>
			  <tr>
				<td class="td1" align="right">
					站点范围
				</td>
				<td class="td2">
					<input type="number" class="arroundScope_inp" id="arroundScope" name="arroundScope" placeholder="请输入站点范围"/>
				</td>
				<td class="td1" align="right">
				</td>
				<td class="td2">
				</td>
			  </tr>
			</table>
			</form>
		</div>
		<%@include file="../../inc/foot.jsp"%>
	</div>
</div>
</body>
</html>