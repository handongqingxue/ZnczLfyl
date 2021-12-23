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
.mc_inp,.px_inp{
	width: 150px;
	height:30px;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var wzglPath=path+'wzgl/';
var dialogTop=10;
var dialogLeft=20;
var edNum=0;
$(function(){
	initEditDialog();//0

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var edpw=$("body").find(".panel.window").eq(edNum);
	var edws=$("body").find(".window-shadow").eq(edNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(edpw);
	ccDiv.append(edws);
	ccDiv.css("width",setFitWidthInParent("body","center_con_div")+"px");
}

function initEditDialog(){
	dialogTop+=20;
	$("#edit_div").dialog({
		title:"用户信息",
		width:setFitWidthInParent("body","edit_div"),
		height:330,
		top:dialogTop,
		left:dialogLeft,
		buttons:[
           {text:"保存",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   checkEdit();
           }}
        ]
	});

	$("#edit_div table").css("width",(setFitWidthInParent("body","edit_div_table"))+"px");
	$("#edit_div table").css("magin","-100px");
	$("#edit_div table td").css("padding-left","50px");
	$("#edit_div table td").css("padding-right","20px");
	$("#edit_div table td").css("font-size","15px");
	$("#edit_div table .td1").css("width","15%");
	$("#edit_div table .td2").css("width","30%");
	$("#edit_div table tr").css("border-bottom","#CAD9EA solid 1px");
	$("#edit_div table tr").each(function(i){
		$(this).css("height",(i==3?90:45)+"px");
	});

	$(".panel.window").eq(edNum).css("margin-top","20px");
	$(".panel.window .panel-title").eq(edNum).css("color","#000");
	$(".panel.window .panel-title").eq(edNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(edNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(edNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(edNum).css("border-color","#ddd");

	$("#edit_div #ok_but").css("left","45%");
	$("#edit_div #ok_but").css("position","absolute");
	
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");

	initZTCBB();
}

function initZTCBB(){
	var data=[];
	data.push({"value":"","text":"请选择状态"});
	data.push({"value":0,"text":"待审核"});
	data.push({"value":1,"text":"审核通过"});
	data.push({"value":2,"text":"审核未通过"});
	
	ztCBB=$("#edit_div #zt_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:data,
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.yh.zt }');
		}
	});
}

function checkEdit(){
	if(checkMC()){
		editWuZiLeiXing();
	}
}

function editWuZiLeiXing(){
	var formData = new FormData($("#form1")[0]);
	$.ajax({
		type:"post",
		url:wzglPath+"editWuZiLeiXing",
		dataType: "json",
		data:formData,
		cache: false,
		processData: false,
		contentType: false,
		success: function (data){
			if(data.message=="ok"){
				alert(data.info);
				history.go(-1);
			}
			else{
				alert(data.info);
			}
		}
	});
}

function focusMC(){
	var mc = $("#mc").val();
	if(mc=="类名不能为空"){
		$("#mc").val("");
		$("#mc").css("color", "#555555");
	}
}

//验证类名
function checkMC(){
	var mc = $("#mc").val();
	if(mc==null||mc==""||mc=="类名不能为空"){
		$("#mc").css("color","#E15748");
    	$("#mc").val("类名不能为空");
    	return false;
	}
	else
		return true;
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "center_con_div":
		space=205;
		break;
	case "edit_div":
		space=340;
		break;
	case "edit_div_table":
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
		<div class="page_location_div">用户-编辑</div>
		
		<div id="edit_div">
			<form id="form1" name="form1" method="post" action="" enctype="multipart/form-data">
			<input type="hidden" id="id" name="id" value="${requestScope.yh.id }"/>
			<table>
			  <tr>
				<td class="td1" align="right">
					用户名
				</td>
				<td class="td2">
					${requestScope.yh.yhm }
				</td>
				<td class="td1" align="right">
					真实姓名
				</td>
				<td class="td2">
					${requestScope.yh.zsxm }
				</td>
			  </tr>
			  <tr>
				<td class="td1" align="right">
					创建时间
				</td>
				<td class="td2">
					${requestScope.yh.cjsj }
				</td>
				<td class="td1" align="right">
					状态
				</td>
				<td class="td2">
					<input id="zt_cbb"/>
					<input type="hidden" id="zt" name="zt" value="${requestScope.yh.zt }"/>
				</td>
			  </tr>
			  <tr>
				<td class="td1" align="right">
					简述
				</td>
				<td class="td2">
					${requestScope.yh.js }
				</td>
				<td class="td1" align="right">
				</td>
				<td class="td2">
				</td>
			  </tr>
			  <tr>
				<td class="td1" align="right">
					未通过原因
				</td>
				<td class="td2">
					<textarea id="bz" name="bz" rows="3" cols="30" placeholder="请输入未通过原因"></textarea>
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