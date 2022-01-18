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
	margin-top: 60px;
	margin-left: 20px;
	font-size: 18px;
}
.ddh_inp,.sjsfzh_inp,.cph_inp{
	width: 180px;
	height:30px;
}
.sjxm_inp,.yzxzl_inp,.sjzl_inp,.zlceb_inp,.dj_inp,.je_inp{
	width: 150px;
	height:30px;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var ddglPath=path+'ddgl/';
var wzglPath=path+'wzgl/';
var dwglPath=path+'dwgl/';
var dialogTop=70;
var dialogLeft=20;
var ndNum=0;
$(function(){
	initNewDialog();//0

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var ndpw=$("body").find(".panel.window").eq(ndNum);
	var ndws=$("body").find(".window-shadow").eq(ndNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(ndpw);
	ccDiv.append(ndws);
	ccDiv.css("width",setFitWidthInParent("body","center_con_div")+"px");
}

function initNewDialog(){
	dialogTop+=20;
	$("#new_div").dialog({
		title:"订单信息",
		width:setFitWidthInParent("body","new_div"),
		height:460,
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
	initWZLXCBB();
	initWZCBB();
	initYSSCBB();
	initFHDWCBB();
	initSHBMCBB();
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

function initWZLXCBB(){
	var data=[];
	data.push({"value":"","text":"请选择物资类型"});
	$.post(wzglPath+"queryWuZiLeiXingCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			wzlxCBB=$("#new_div #wzlx_cbb").combobox({
				valueField:"value",
				textField:"text",
				data:data,
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
	wzCBB=$("#new_div #wz_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:data
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

function initYSSCBB(){
	var data=[];
	data.push({"value":"","text":"请选择运输商"});
	$.post(dwglPath+"queryYunShuShangCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			yssCBB=$("#new_div #yss_cbb").combobox({
				valueField:"value",
				textField:"text",
				data:data
			});
		}
	,"json");
}

function initFHDWCBB(){
	var data=[];
	data.push({"value":"","text":"请选择发货单位"});
	$.post(dwglPath+"queryFaHuoDanWeiCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			fhdwCBB=$("#new_div #fhdw_cbb").combobox({
				valueField:"value",
				textField:"text",
				data:data
			});
		}
	,"json");
}

function initSHBMCBB(){
	var data=[];
	data.push({"value":"","text":"请选择收货部门"});
	$.post(dwglPath+"queryShouHuoBuMenCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			shbmCBB=$("#new_div #shbm_cbb").combobox({
				valueField:"value",
				textField:"text",
				data:data
			});
		}
	,"json");
}

function checkNew(){
	if(checkDdh()){
		if(checkLXLXId()){
			if(checkYZXZL()){
				if(checkDJ()){
					if(checkJE()){
						if(checkWZLXId()){
							if(checkWZId()){
								if(checkYSSId()){
									if(checkFHDWId()){
										if(checkSHBMId()){
											newDingDanZongHeChaXun();
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

function newDingDanZongHeChaXun(){
	var wzlxId=wzlxCBB.combobox("getValue");
	$("#new_div #wzlxId").val(wzlxId);
	var wzId=wzCBB.combobox("getValue");
	$("#new_div #wzId").val(wzId);
	var yssId=yssCBB.combobox("getValue");
	$("#new_div #yssId").val(yssId);
	var fhdwId=fhdwCBB.combobox("getValue");
	$("#new_div #fhdwId").val(fhdwId);
	var shbmId=shbmCBB.combobox("getValue");
	$("#new_div #shbmId").val(shbmId);
	
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

function focusDdh(){
	var ddh = $("#ddh").val();
	if(ddh=="订单号不能为空"||ddh=="订单号已存在"){
		$("#ddh").val("");
		$("#ddh").css("color", "#555555");
	}
}

//验证订单号
function checkDdh(){
	var flag=false;
	var ddh = $("#ddh").val();
	if(ddh==null||ddh==""||ddh=="订单号不能为空"){
		$("#ddh").css("color","#E15748");
    	$("#ddh").val("订单号不能为空");
    	flag=false;
	}
	else if(ddh=="订单号已存在"){
		$("#ddh").css("color","#E15748");
    	$("#ddh").val("订单号已存在");
    	flag=false;
	}
	else{
		$.ajaxSetup({async:false});
		$.post(ddglPath+"checkDdhIfExist",
			{ddh:ddh},
			function(data){
				if(data.status==1)
			    	flag=true;
				else{
					$("#ddh").css("color","#E15748");
			    	$("#ddh").val(data.msg);
			    	flag=false;
				}
			}
		,"json");
	}
	return flag;
}

//验证流向类型
function checkLXLXId(){
	var lxlx=lxlxCBB.combobox("getValue");
	if(lxlx==null||lxlx==""){
	  	alert("请选择流向类型");
	  	return false;
	}
	else
		return true;
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

//验证单价
function checkDJ(){
	var dj = $("#new_div #dj").val();
	if(dj==null||dj==""){
	  	alert("请输入单价");
	  	return false;
	}
	else
		return true;
}

//验证金额
function checkJE(){
	var je = $("#new_div #je").val();
	if(je==null||je==""){
	  	alert("请输入金额");
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

//验证运输商
function checkYSSId(){
	var yssId=yssCBB.combobox("getValue");
	if(yssId==null||yssId==""){
	  	alert("请选择运输商");
	  	return false;
	}
	else
		return true;
}

//验证发货单位
function checkFHDWId(){
	var fhdwId=fhdwCBB.combobox("getValue");
	if(fhdwId==null||fhdwId==""){
	  	alert("请选择发货单位");
	  	return false;
	}
	else
		return true;
}

//验证收货部门
function checkSHBMId(){
	var shbmId=shbmCBB.combobox("getValue");
	if(shbmId==null||shbmId==""){
	  	alert("请选择收货部门");
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
		space=340;
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
		<div class="page_location_div">综合查询-添加订单</div>
		
		<div id="new_div">
			<form id="form1" name="form1" method="post" action="" enctype="multipart/form-data">
			<table>
			  <tr>
				<td class="td1" align="right">
					订单号
				</td>
				<td class="td2">
					<input type="text" class="ddh_inp" id="ddh" name="ddh" placeholder="请输入订单号" onfocus="focusDdh()" onblur="checkDdh()"/>
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
			  <tr>
				<td class="td1" align="right">
					单价
				</td>
				<td class="td2">
					<input type="number" class="dj_inp" id="dj" name="dj" placeholder="请输入单价"/>
				</td>
				<td class="td1" align="right">
					金额
				</td>
				<td class="td2">
					<input type="number" class="je_inp" id="je" name="je" placeholder="请输入金额"/>
				</td>
			  </tr>
			  <tr>
				<td class="td1" align="right">
					物资类型
				</td>
				<td class="td2">
					<input id="wzlx_cbb"/>
					<input type="hidden" id="wzlxId" name="wzlxId"/>
				</td>
				<td class="td1" align="right">
					物资名称
				</td>
				<td class="td2">
					<input id="wz_cbb"/>
					<input type="hidden" id="wzId" name="wzId"/>
				</td>
			  </tr>
			  <tr>
				<td class="td1" align="right">
					运输商
				</td>
				<td class="td2">
					<input id="yss_cbb"/>
					<input type="hidden" id="yssId" name="yssId"/>
				</td>
				<td class="td1" align="right">
					发货单位
				</td>
				<td class="td2">
					<input id="fhdw_cbb"/>
					<input type="hidden" id="fhdwId" name="fhdwId"/>
				</td>
			  </tr>
			  <tr>
				<td class="td1" align="right">
					收货部门
				</td>
				<td class="td2">
					<input id="shbm_cbb"/>
					<input type="hidden" id="shbmId" name="shbmId"/>
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