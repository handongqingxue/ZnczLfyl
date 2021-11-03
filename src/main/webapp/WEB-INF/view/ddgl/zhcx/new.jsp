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
.ddh_inp,.sjsfzh_inp,.cph_inp{
	width: 180px;
	height:30px;
}
.sjxm_inp,.yzxzl_inp,.sjzl_inp,.zlceb_inp{
	width: 150px;
	height:30px;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var ddglPath=path+'ddgl/';
var dialogTop=10;
var dialogLeft=20;
var ndNum=0;
var wlxxdNum=1;
$(function(){
	initNewDialog();//0

	initWLXXDialog();//1.物料信息窗口
	
	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initWLXXDialog(){
	dialogTop+=330;//460
	wlxxDialog=$("#wlxx_div").dialog({
		title:"物料信息",
		width:setFitWidthInParent("body","wlxx_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(wlxxdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(wlxxdNum).css("margin-top","20px");
	$(".panel.window").eq(wlxxdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(wlxxdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(wlxxdNum).css("color","#000");
	$(".panel.window .panel-title").eq(wlxxdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(wlxxdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(wlxxdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(wlxxdNum).css("width","1000px");
	$(".window-shadow").eq(wlxxdNum).css("margin-top","20px");
	$(".window-shadow").eq(wlxxdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(wlxxdNum).css("border-color","#ddd");

	initWLXXTab();
}

function initWLXXTab(){
	wlxxChooseLB=$("#wlxx_div #choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openSelectWLXXDialog(1);
		}
	});
	
	wlxxTab=$("#wlxx_tab").datagrid({
		toolbar:"#wlxx_toolbar",
		width:setFitWidthInParent("body","wlxx_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="运输物资";
					break;
				}
				return str;
			}},
            {field:"mc",title:"名称",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"editWLXXTabRow()\">编辑</a>"
            	+"&nbsp;|&nbsp;<a onclick=\"deleteWLXXTabRow()\">删除</a>";
            	//var str="<a onclick=\"deleteYSSTabRow()\">删除</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:3});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
	//var obj = {"total":2,"rows":[{mc:"mc",bz:"一"},{mc:"2",bz:"二"}]};
	loadWLXXTabData([]);
}

function initDialogPosition(){
	//基本属性组
	var ndpw=$("body").find(".panel.window").eq(ndNum);
	var ndws=$("body").find(".window-shadow").eq(ndNum);

	//物料信息
	var wlxxdpw=$("body").find(".panel.window").eq(wlxxdNum);
	var wlxxdws=$("body").find(".window-shadow").eq(wlxxdNum);
	
	//var abssdmdpw=$("body").find(".panel.window").eq(abssdmdNum);
	//var abssdmdws=$("body").find(".window-shadow").eq(abssdmdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(ndpw);
	ccDiv.append(ndws);
	ccDiv.css("width",setFitWidthInParent("body","center_con_div")+"px");

	ccDiv.append(wlxxdpw);
	ccDiv.append(wlxxdws);
	
	//var abssdmdDiv=$("#add_bs_canvas_dialog_div");
	//abssdmdDiv.append(abssdmdpw);
	//abssdmdDiv.append(abssdmdws);
}

function initNewDialog(){
	dialogTop+=20;
	$("#new_div").dialog({
		title:"基本信息",
		width:setFitWidthInParent("body","new_div"),
		height:300,
		top:dialogTop,
		left:dialogLeft,
		buttons:[
           {text:"保存",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   checkNew();
           }}
        ]
	});

	$("#new_div table").css("width",(setFitWidthInParent("body","new_div_table"))+"px");
	$("#new_div table").css("magin","-100px");
	$("#new_div table td").css("padding-left","50px");
	$("#new_div table td").css("padding-right","20px");
	$("#new_div table td").css("font-size","15px");
	$("#new_div table .td1").css("width","15%");
	$("#new_div table .td2").css("width","30%");
	$("#new_div table tr").css("border-bottom","#CAD9EA solid 1px");
	$("#new_div table tr").each(function(i){
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
	
	initLXLXCBB();
}

function initLXLXCBB(){
	lxlxCBB=$("#lxlx_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[
			{"value":"","text":"请选择流向类型"},{"value":"1","text":"送运"},{"value":"2","text":"取运"}
		],
		onSelect:function(){
			$("#lxlx").val($(this).combobox("getValue"));
		}
	});
}

function loadWLXXTabData(rows){
	var rowsLength=rows.length;
	if(rowsLength>0)
		wlxxChooseLB.linkbutton("disable");
	else
		wlxxChooseLB.linkbutton("enable");
	var obj = {"total":rowsLength,"rows":rows};
	wlxxTab.datagrid('loadData',obj);
}

function checkNew(){
	if(checkYZXZL()){
		newDingDanZongHeChaXun();
	}
}

function newDingDanZongHeChaXun(){
	var formData = new FormData($("#form1")[0]);
	$.ajax({
		type:"post",
		url:ddglPath+"newDingDanZongHeChaXun",
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

//验证预装卸重量
function checkYZXZL(){
	var yzxzl = $("#new_div #yzxzl").val();
	if(yzxzl==null||yzxzl==""){
	  	alert("请输入预装卸重量");
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
	case "new_div":
	case "wlxx_div":
		space=340;
		break;
	case "add_bs_sd_map_dialog_div":
		space=170;
		break;
	case "new_div_table":
	case "panel_window":
	case "wlxx_tab":
		space=355;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}

function initWindowMarginLeft(){
	var editDivWidth=$("#wlxx_div").css("width");
	editDivWidth=editDivWidth.substring(0,editDivWidth.length-2);
	var pwWidth=$(".panel.window").css("width");
	pwWidth=pwWidth.substring(0,pwWidth.length-2);
	return ((editDivWidth-pwWidth)/2)+"px";
}
</script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
	<%@include file="../../inc/side.jsp"%>
	<div class="center_con_div" id="center_con_div">
		<div class="page_location_div">综合查询-添加订单</div>
		
		<div id="new_div">
			<form id="form1" name="form1" method="post" action="" enctype="multipart/form-data">
			<table>
			  <tr>
				<td class="td1" align="right">
					订单号
				</td>
				<td class="td2">
					<input type="text" class="ddh_inp" id="ddh" name="ddh" placeholder="请输入订单号" onfocus="focusName()" onblur="checkName()"/>
				</td>
				<td class="td1" align="right">
					司机身份证号
				</td>
				<td class="td2">
					<input type="text" class="sjsfzh_inp" id="sjsfzh" name="sjsfzh" placeholder="请输入司机身份证号" style=""/>
				</td>
			  </tr>
			  <tr>
				<td class="td1" align="right">
					司机姓名
				</td>
				<td class="td2">
					<input type="text" class="sjxm_inp" id="sjxm" name="sjxm" placeholder="请输入司机姓名" />
				</td>
				<td class="td1" align="right">
					车牌号
				</td>
				<td class="td2">
					<input type="text" class="cph_inp" id="cph" name="cph" placeholder="请输入车牌号" />
				</td>
			  </tr>
			  <tr>
				<td class="td1" align="right">
					流向类型
				</td>
				<td class="td2">
					<input id="lxlx_cbb"/>
					<input type="hidden" id="lxlx" name="lxlx"/>
				</td>
				<td class="td1" align="right">
					预装卸重量
				</td>
				<td class="td2">
					<input type="number" class="yzxzl_inp" id="yzxzl" name="yzxzl" placeholder="请输入预装卸重量"/>
				</td>
			  </tr>
			  <tr>
				<td class="td1" align="right">
					实际重量
				</td>
				<td class="td2">
					<input type="number" class="sjzl_inp" id="sjzl" name="sjzl" placeholder="请输入实际重量"/>
				</td>
				<td class="td1" align="right">
					重量差额比
				</td>
				<td class="td2">
					<input type="number" class="zlceb_inp" id="zlceb" name="zlceb" placeholder="无需输入" disabled="disabled"/>
				</td>
			  </tr>
			</table>
			</form>
		</div>

		<div id="wlxx_div">
			<div id="wlxx_toolbar" style="height:32px;line-height:32px;">
				<a id="choose_but" style="margin-left: 13px;">选择</a>
			</div>
			<table id="wlxx_tab"></table>
		</div>
		<%@include file="../../inc/foot.jsp"%>
	</div>
</div>
</body>
</html>