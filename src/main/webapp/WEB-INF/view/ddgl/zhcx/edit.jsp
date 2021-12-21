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
		title:"订单信息",
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
		$(this).css("height","45px");
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
	
	initLXLXCBB();
	initWZLXCBB();
	initWZCBB();
	setTimeout(function(){
		loadWZCBBData();
	},"1000");
}

function initLXLXCBB(){
	lxlxCBB=$("#lxlx_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[
			{"value":"","text":"请选择流向类型"},{"value":"1","text":"送运"},{"value":"2","text":"取运"}
		],
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.dd.lxlx }');
		},
		onSelect:function(){
			$("#lxlx").val($(this).combobox("getValue"));
		}
	});
}

function initWZLXCBB(){
	var data=[];
	data.push({"value":"","text":"请选择物资类型"});
	$.post(wzglPath+"queryWuZiLeiXingCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			wzlxCBB=$("#edit_div #wzlx_cbb").combobox({
				valueField:"value",
				textField:"text",
				data:data,
				onLoadSuccess:function(){
					$(this).combobox("setValue",'${requestScope.dd.wzlxId }');
				},
				onSelect:function(){
					loadWZCBBData();
				}
			});
		}
	,"json");
}

function initWZCBB(){
	var data=[];
	data.push({"value":"","text":"请选择物资名称"});
	wzCBB=$("#edit_div #wz_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:data,
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.dd.wzId }');
		}
	});
}

function loadWZCBBData(){
	var data=[];
	data.push({"value":"","text":"请选择物资名称"});
	var wzlxId=wzlxCBB.combobox("getValue");
	$.post(wzglPath+"queryWuZiCBBList",
		{wzlxId:wzlxId},
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			wzCBB.combobox("loadData",data);
		}
	,"json");
}

function checkEdit(){
	if(checkYZXZL()){
		if(checkWZLXId()){
			if(checkWZId()){
				editDingDanZongHeChaXun();
			}
		}
	}
}

function editDingDanZongHeChaXun(){
	var wzlxId=wzlxCBB.combobox("getValue");
	$("#edit_div #wzlxId").val(wzlxId);
	var wzId=wzCBB.combobox("getValue");
	$("#edit_div #wzId").val(wzId);
	
	var formData = new FormData($("#form1")[0]);
	$.ajax({
		type:"post",
		url:ddglPath+"editDingDanZongHeChaXun",
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
	var yzxzl = $("#edit_div #yzxzl").val();
	if(yzxzl==null||yzxzl==""){
	  	alert("请输入预装卸重量");
	  	return false;
	}
	else
		return true;
}

//验证物资类型
function checkWZLXId(){
	var wzlxId=wzlxCBB.combobox("getValue");
	if(wzlxId==null||wzlxId==""){
	  	alert("请选择物资类型");
	  	return false;
	}
	else
		return true;
}

//验证物资
function checkWZId(){
	var wzId=wzCBB.combobox("getValue");
	if(wzId==null||wzId==""){
	  	alert("请选择物资");
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
		<div class="page_location_div">综合查询-编辑订单</div>
		
		<div id="edit_div">
			<form id="form1" name="form1" method="post" action="" enctype="multipart/form-data">
			<input type="hidden" id="id" name="id" value="${requestScope.dd.id }"/>
			<table>
			  <tr>
				<td class="td1" align="right">
					订单号
				</td>
				<td class="td2">
					<input type="text" class="ddh_inp" id="ddh" name="ddh" value="${requestScope.dd.ddh }" placeholder="请输入订单号" onfocus="focusName()" onblur="checkName()"/>
				</td>
				<td class="td1" align="right">
					司机身份证号
				</td>
				<td class="td2">
					<input type="text" class="sjsfzh_inp" id="sjsfzh" name="sjsfzh" value="${requestScope.dd.sjsfzh }" placeholder="请输入司机身份证号"/>
				</td>
			  </tr>
			  <tr>
				<td class="td1" align="right">
					司机姓名
				</td>
				<td class="td2">
					<input type="text" class="sjxm_inp" id="sjxm" name="sjxm" value="${requestScope.dd.sjxm }" placeholder="请输入司机姓名" />
				</td>
				<td class="td1" align="right">
					车牌号
				</td>
				<td class="td2">
					<input type="text" class="cph_inp" id="cph" name="cph" value="${requestScope.dd.cph }" placeholder="请输入车牌号" />
				</td>
			  </tr>
			  <tr>
				<td class="td1" align="right">
					流向类型
				</td>
				<td class="td2">
					<input id="lxlx_cbb"/>
					<input type="hidden" id="lxlx" name="lxlx" value="${requestScope.dd.cph }"/>
				</td>
				<td class="td1" align="right">
					预装卸重量
				</td>
				<td class="td2">
					<input type="number" class="yzxzl_inp" id="yzxzl" name="yzxzl" value="${requestScope.dd.yzxzl }" placeholder="请输入预装卸重量"/>
				</td>
			  </tr>
			  <tr>
				<td class="td1" align="right">
					实际重量
				</td>
				<td class="td2">
					<input type="number" class="sjzl_inp" id="sjzl" name="sjzl" value="${requestScope.dd.sjzl }" placeholder="请输入实际重量"/>
				</td>
				<td class="td1" align="right">
					重量差额比
				</td>
				<td class="td2">
					<input type="number" class="zlceb_inp" id="zlceb" name="zlceb" value="${requestScope.dd.zlceb }" placeholder="无需输入" disabled="disabled"/>
				</td>
			  </tr>
			  <tr>
				<td class="td1" align="right">
					物资类型
				</td>
				<td class="td2">
					<input id="wzlx_cbb"/>
					<input type="hidden" id="wzlxId" name="wzlxId" value="${requestScope.dd.wzlxId }"/>
				</td>
				<td class="td1" align="right">
					物资名称
				</td>
				<td class="td2">
					<input id="wz_cbb"/>
					<input type="hidden" id="wzId" name="wzId" value="${requestScope.dd.wzId }"/>
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