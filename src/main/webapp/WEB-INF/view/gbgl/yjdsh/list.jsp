<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
.tab1_div{
	margin-top:80px;
	margin-left: 220px;
}
.tab1_div .toolbar{
	height:64px;
}
.tab1_div .toolbar .row_div{
	height:32px;
}
.tab1_div .toolbar .row_div .ddh_span,
.tab1_div .toolbar .row_div .sjxm_span,
.tab1_div .toolbar .row_div .sjsfzh_span,
.tab1_div .toolbar .row_div .cph_span,
.tab1_div .toolbar .row_div .yss_span,
.tab1_div .toolbar .row_div .fhdw_span,
.tab1_div .toolbar .row_div .gbsj_span,
.tab1_div .toolbar .row_div .shbm_span,
.tab1_div .toolbar .row_div .search_but{
	margin-left: 13px;
}
.tab1_div .toolbar .row_div .ddh_inp,
.tab1_div .toolbar .row_div .sjxm_inp,
.tab1_div .toolbar .row_div .sjsfzh_inp,
.tab1_div .toolbar .row_div .cph_inp,
.tab1_div .toolbar .row_div .yssMc_inp,
.tab1_div .toolbar .row_div .fhdwMc_inp,
.tab1_div .toolbar .row_div .shbmMc_inp{
	width: 120px;
	height: 25px;
}
</style>
<title>Insert title here</title>
<%@include file="../../inc/js.jsp"%>
<script type="text/javascript">
var path='<%=basePath %>';
var gbglPath=path+'gbgl/';
var ddglPath=path+'ddgl/';
var exportExcelPath=path+'exportExcel/';
var ddztMc='${requestScope.yjdshDdztMc}';
var gblx='${requestScope.gblx}';
$(function(){
	initGBSJKSDTB();
	initGBSJJSDTB();
	initSearchLB();
	initCheckLB();
	initSHBTGLB();
	initTab1();
});

function initGBSJKSDTB(){
	gbsjksDTB=$("#gbsjks_dtb").datetimebox({
        required:false
    });
}

function initGBSJJSDTB(){
	gbsjjsDTB=$("#gbsjjs_dtb").datetimebox({
        required:false
    });
}

function initSearchLB(){
	$("#search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var ddh=$("#toolbar #ddh").val();
			var sjxm=$("#toolbar #sjxm").val();
			var sjsfzh=$("#toolbar #sjsfzh").val();
			var cph=$("#toolbar #cph").val();
			var yssMc=$("#toolbar #yssMc").val();
			var fhdwMc=$("#toolbar #fhdwMc").val();
			var shbmMc=$("#toolbar #shbmMc").val();
			var gbsjks=gbsjksDTB.datetimebox("getValue");
			var gbsjjs=gbsjjsDTB.datetimebox("getValue");
			tab1.datagrid("load",{ddztMc:ddztMc,ddh:ddh,sjxm:sjxm,sjsfzh:sjsfzh,cph:cph,yssMc:yssMc,fhdwMc:fhdwMc,shbmMc:shbmMc,gbsjks:gbsjks,gbsjjs:gbsjjs,gblx:gblx});
		}
	});
}

function initCheckLB(){
	$("#check_but").linkbutton({
		iconCls:"icon-ok",
		onClick:function(){
			checkByIds(true);
		}
	});
}

function initSHBTGLB(){
	$("#shbtg_but").linkbutton({
		iconCls:"icon-remove",
		onClick:function(){
			checkByIds(false);
		}
	});
}

function checkByIds(shjg) {
	var rows=tab1.datagrid("getSelections");
	if (rows.length == 0) {
		$.messager.alert("??????","??????????????????????????????","warning");
		return false;
	}
	
	var ddIds = "";
	for (var i = 0; i < rows.length; i++) {
		ddIds += "," + rows[i].ddId;
	}
	ddIds=ddIds.substring(1);
	
	var ddztMc='${requestScope.drkDdztMc}';
	var shlx='${requestScope.shlx}';
	var shrId='${sessionScope.yongHu.id}';
	$.post(ddglPath + "checkDingDanByIds",
		{ids:ddIds,ddztMc:ddztMc,shlx:shlx,shjg:shjg,shrId:shrId,jyFlag:1},
		function(result){
			if(result.status==1){
				alert(result.msg);
				tab1.datagrid("load");
			}
			else{
				alert(result.msg);
			}
		}
	,"json");
}

function initTab1(){
	tab1=$("#tab1").datagrid({
		title:"?????????????????????",
		url:gbglPath+"queryDJYList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("body"),
		queryParams:{ddztMc:ddztMc,gblx:gblx},
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"ddh",title:"?????????",width:150},
			{field:"sjxm",title:"????????????",width:100},
			{field:"sjsfzh",title:"??????????????????",width:200},
			{field:"cph",title:"?????????",width:150},
			{field:"yssMc",title:"?????????",width:150},
			{field:"fhdwMc",title:"????????????",width:150},
			{field:"shbmMc",title:"????????????",width:150},
            {field:"lxlx",title:"????????????",width:100,formatter:function(value,row){
            	var str;
            	switch (value) {
				case 1:
					str="??????";
					break;
				case 2:
					str="??????";
					break;
				}
            	return str;
            }},
			{field:"gbzl",title:"????????????",width:200},
			{field:"gbzt",title:"????????????",width:100,formatter:function(value,row){
				return value==1?"??????":"??????";
			}},
            {field:"gbsj",title:"????????????",width:150},
            {field:"id",title:"??????",width:50,formatter:function(value,row){
            	//var str="<a href=\"detail?id="+value+"\">??????</a>";
            	//return str;
            	return "";
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{ddh:"<div style=\"text-align:center;\">????????????<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"ddh",colspan:12});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");
		}
	});
}

function setFitWidthInParent(o){
	var width=$(o).css("width");
	return width.substring(0,width.length-2)-250;
}
</script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
	<%@include file="../../inc/side.jsp"%>
	<div class="tab1_div" id="tab1_div">
		<div class="toolbar" id="toolbar">
			<div class="row_div">
				<span class="ddh_span">????????????</span>
				<input type="text" class="ddh_inp" id="ddh" placeholder="??????????????????"/>
				<span class="sjxm_span">???????????????</span>
				<input type="text" class="sjxm_inp" id="sjxm" placeholder="?????????????????????"/>
				<span class="sjsfzh_span">?????????????????????</span>
				<input type="text" class="sjsfzh_inp" id="sjsfzh" placeholder="???????????????????????????"/>
				<span class="cph_span">????????????</span>
				<input type="text" class="cph_inp" id="cph" placeholder="??????????????????"/>
			</div>
			<div class="row_div">
				<span class="yss_span">????????????</span>
				<input type="text" class="yssMc_inp" id="yssMc" placeholder="??????????????????"/>
				<span class="fhdw_span">???????????????</span>
				<input type="text" class="fhdwMc_inp" id="fhdwMc" placeholder="?????????????????????"/>
				<span class="shbm_span">???????????????</span>
				<input type="text" class="shbmMc_inp" id="shbmMc" placeholder="?????????????????????"/>
				<span class="gbsj_span">???????????????</span>
				<input id="gbsjks_dtb"/>-
				<input id="gbsjjs_dtb"/>
				<a class="search_but" id="search_but">??????</a>
				<a id="check_but">??????</a>
				<a id="shbtg_but">???????????????</a>
			</div>
		</div>
		<table id="tab1">
		</table>
	</div>
	<%@include file="../../inc/foot.jsp"%>
</div>
</body>
</html>