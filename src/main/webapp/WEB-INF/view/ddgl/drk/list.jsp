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
	position: fixed;
}
.tab1_div .toolbar{
	height:64px;
}
.tab1_div .toolbar .row_div{
	height:32px;
}
.tab1_div .toolbar .row_div .ddh_span,
.tab1_div .toolbar .row_div .cph_span,
.tab1_div .toolbar .row_div .yss_span,
.tab1_div .toolbar .row_div .wzmc_span,
.tab1_div .toolbar .row_div .fhdw_span,
.tab1_div .toolbar .row_div .shbm_span,
.tab1_div .toolbar .row_div .sjxm_span,
.tab1_div .toolbar .row_div .sjsfzh_span,
.tab1_div .toolbar .row_div .search_but{
	margin-left: 13px;
}
.tab1_div .toolbar .row_div .ddh_inp,
.tab1_div .toolbar .row_div .cph_inp,
.tab1_div .toolbar .row_div .yssMc_inp,
.tab1_div .toolbar .row_div .wzMc_inp,
.tab1_div .toolbar .row_div .fhdwMc_inp,
.tab1_div .toolbar .row_div .shbmMc_inp,
.tab1_div .toolbar .row_div .sjxm_inp,
.tab1_div .toolbar .row_div .sjsfzh_inp{
	width: 120px;
	height: 25px;
}
</style>
<title>Insert title here</title>
<%@include file="../../inc/js.jsp"%>
<script type="text/javascript">
var path='<%=basePath %>';
var ddglPath=path+'ddgl/';
var ddztMc='${requestScope.ddztMc}';
$(function(){
	initSearchLB();
	initCheckLB();
	initTab1();
});

function initSearchLB(){
	$("#search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var ddh=$("#toolbar #ddh").val();
			var cph=$("#toolbar #cph").val();
			var yssMc=$("#toolbar #yssMc").val();
			var wzMc=$("#toolbar #wzMc").val();
			var fhdwMc=$("#toolbar #fhdwMc").val();
			var shbmMc=$("#toolbar #shbmMc").val();
			var sjxm=$("#toolbar #sjxm").val();
			var sjsfzh=$("#toolbar #sjsfzh").val();
			tab1.datagrid("load",{ddh:ddh,ddztMc:ddztMc,cph:cph,yssMc:yssMc,wzMc:wzMc,
				fhdwMc:fhdwMc,shbmMc:shbmMc,sjxm:sjxm,sjsfzh:sjsfzh});
		}
	});
}

function initCheckLB(){
	$("#check_but").linkbutton({
		iconCls:"icon-ok",
		onClick:function(){
			checkByIds();
		}
	});
}

function checkByIds() {
	var rows=tab1.datagrid("getSelections");
	if (rows.length == 0) {
		$.messager.alert("??????","??????????????????????????????","warning");
		return false;
	}
	
	var ids = "";
	for (var i = 0; i < rows.length; i++) {
		ids += "," + rows[i].id;
	}
	ids=ids.substring(1);

	var ddztMc='${requestScope.checkDdztMc}';
	var shlx='${requestScope.shlx}';
	var shrId='${sessionScope.yongHu.id}';
	$.post(ddglPath + "checkDingDanByIds",
		{ids:ids,ddztMc:ddztMc,shlx:shlx,shjg:true,shrId:shrId},
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
		title:"???????????????",
		url:ddglPath+"queryZHCXList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("body","tab1_div"),
		queryParams:{ddztMc:ddztMc},
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"ddh",title:"?????????",width:150},
			{field:"sjsfzh",title:"??????????????????",width:200},
			{field:"sjxm",title:"????????????",width:100},
			{field:"cph",title:"?????????",width:150},
			{field:"wzMc",title:"????????????",width:150},
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
            {field:"yzxzl",title:"???????????????",width:100},
            {field:"sjzl",title:"????????????",width:100},
            {field:"zlceb",title:"???????????????",width:100},
            {field:"bjsj",title:"????????????",width:150},
            {field:"id",title:"??????",width:50,formatter:function(value,row){
            	//var str="<a href=\"detail?id="+value+"\">??????</a>";
            	//return str;
            	return "";
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{ddh:"<div style=\"text-align:center;\">????????????<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"ddh",colspan:14});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");
		}
	});
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "center_con_div":
		space=205;
		break;
	case "tab1_div":
		space=250;
		break;
	case "check_ddxx_dialog_div":
		space=50;
		break;
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
	<div class="tab1_div" id="tab1_div">
		<div class="toolbar" id="toolbar">
			<div class="row_div">
				<span class="ddh_span">????????????</span>
				<input type="text" class="ddh_inp" id="ddh" placeholder="??????????????????"/>
				<span class="cph_span">????????????</span>
				<input type="text" class="cph_inp" id="cph" placeholder="??????????????????"/>
				<span class="yss_span">????????????</span>
				<input type="text" class="yssMc_inp" id="yssMc" placeholder="??????????????????"/>
				<span class="wzMc_span">???????????????</span>
				<input type="text" class="wzMc_inp" id="wzMc" placeholder="?????????????????????"/>
			</div>
			<div class="row_div">
				<span class="fhdw_span">???????????????</span>
				<input type="text" class="fhdwMc_inp" id="fhdwMc" placeholder="?????????????????????"/>
				<span class="shbm_span">???????????????</span>
				<input type="text" class="shbmMc_inp" id="shbmMc" placeholder="?????????????????????"/>
				<span class="sjxm_span">???????????????</span>
				<input type="text" class="sjxm_inp" id="sjxm" placeholder="?????????????????????"/>
				<span class="sjsfzh_span">?????????????????????</span>
				<input type="text" class="sjsfzh_inp" id="sjsfzh" placeholder="???????????????????????????"/>
				<a class="search_but" id="search_but">??????</a>
				<a id="check_but">??????</a>
			</div>
		</div>
		<table id="tab1">
		</table>
	</div>
	
	<%@include file="../../inc/foot.jsp"%>
</div>
</body>
</html>