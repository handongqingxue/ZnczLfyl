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
	height:32px;
}
.tab1_div .toolbar .ddh_span{
	margin-left: 13px;
}
.tab1_div .toolbar .ddh_inp{
	width: 120px;height: 25px;
}
.tab1_div .toolbar .search_but{
	margin-left: 13px;
}

.preview_bdxx_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	/*
	display:none;
	*/
}
.preview_bdxx_div{
	width: 1000px;
	height: 570px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
</style>
<title>Insert title here</title>
<%@include file="../../inc/js.jsp"%>
<script type="text/javascript">
var path='<%=basePath %>';
var gbglPath=path+'gbgl/';
var dialogTop=10;
var dialogLeft=20;
var pbdxxdNum=0;
$(function(){
	initSearchLB();
	initAddLB();
	initTab1();
	initPreviewBDXXDialog();//0
	
	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	var pbdxxdpw=$("body").find(".panel.window").eq(pbdxxdNum);
	var pbdxxdws=$("body").find(".window-shadow").eq(pbdxxdNum);

	var pbdxxdDiv=$("#preview_bdxx_div");
	pbdxxdDiv.append(pbdxxdpw);
	pbdxxdDiv.append(pbdxxdws);
}

function initPreviewBDXXDialog(){
	dialogTop+=20;
	$("#preview_bdxx_dialog_div").dialog({
		title:"订单信息",
		width:setFitWidthInParent("#preview_bdxx_div","preview_bdxx_dialog_div"),
		height:480,
		top:dialogTop,
		left:dialogLeft,
		buttons:[
           {text:"通过",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   checkById();
           }},
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openPreviewBDXXDialog(false,null);
           }}
        ]
	});

	/*
	$("#preview_bdxx_dialog_div table").css("width",(setFitWidthInParent("#preview_bdxx_div","preview_bdxx_dialog_div"))+"px");
	$("#preview_bdxx_dialog_div table").css("magin","-100px");
	$("#preview_bdxx_dialog_div table td").css("padding-left","40px");
	$("#preview_bdxx_dialog_div table td").css("padding-right","20px");
	$("#preview_bdxx_dialog_div table td").css("font-size","15px");
	$("#preview_bdxx_dialog_div table .td1").css("width","15%");
	$("#preview_bdxx_dialog_div table .td2").css("width","30%");
	$("#preview_bdxx_dialog_div table tr").css("border-bottom","#CAD9EA solid 1px");
	$("#preview_bdxx_dialog_div table tr").each(function(i){
		$(this).css("height","45px");
	});
	*/

	$(".panel.window").eq(pbdxxdNum).css("margin-top","20px");
	$(".panel.window .panel-title").eq(pbdxxdNum).css("color","#000");
	$(".panel.window .panel-title").eq(pbdxxdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(pbdxxdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(pbdxxdNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(pbdxxdNum).css("border-color","#ddd");

	$("#preview_bdxx_dialog_div #ok_but").css("left","30%");
	$("#preview_bdxx_dialog_div #ok_but").css("position","absolute");

	$("#preview_bdxx_dialog_div #cancel_but").css("left","45%");
	$("#preview_bdxx_dialog_div #cancel_but").css("position","absolute");
	
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
}

function initSearchLB(){
	$("#search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var ddh=$("#toolbar #ddh").val();
			tab1.datagrid("load",{ddh:ddh});
		}
	});
}

function initAddLB(){
	$("#add_but").linkbutton({
		iconCls:"icon-add",
		onClick:function(){
			location.href=gbglPath+"bdjl/new";
		}
	});
}

function initTab1(){
	tab1=$("#tab1").datagrid({
		title:"磅单记录查询",
		url:gbglPath+"queryBDJLList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("body"),
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"ddh",title:"订单号",width:150},
			{field:"mz",title:"毛重",width:150},
			{field:"pz",title:"皮重",width:150},
			{field:"jz",title:"净重",width:150},
            {field:"rq",title:"日期",width:150},
            {field:"id",title:"操作",width:150,formatter:function(value,row){
       			var rowJson = JSON.stringify(row).replace(/"/g, '&quot;');
            	var str="<a href=\"edit?id="+value+"\">编辑</a>&nbsp;&nbsp;"
            		+"<a href=\"detail?id="+value+"\">详情</a>&nbsp;&nbsp;"
            		+"<a onclick=\"openPreviewBDXXDialog(true,"+rowJson+")\">预览</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{ddh:"<div style=\"text-align:center;\">暂无信息<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"ddh",colspan:6});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");
		}
	});
}

function openPreviewBDXXDialog(flag,row){
	if(flag){
		$("#preview_bdxx_bg_div").css("display","block");
		$("#check_ddxx_div #id").val(row.id);
		$("#check_ddxx_div #ddh_span").text(row.ddh);
		$("#check_ddxx_div #sjsfzh_span").text(row.sjsfzh);
		$("#check_ddxx_div #sjxm_span").text(row.sjxm);
		$("#check_ddxx_div #cph_span").text(row.cph);
		$("#check_ddxx_div #lxlxMc_span").text(row.lxlx==1?"送运":"取运");
		$("#check_ddxx_div #yzxzl_span").text(row.yzxzl);
		$("#check_ddxx_div #sjzl_span").text(row.sjzl);
		$("#check_ddxx_div #zlceb_span").text(row.zlceb);
		$("#check_ddxx_div #dj_span").text(row.dj);
		$("#check_ddxx_div #je_span").text(row.je);
		$("#check_ddxx_div #wzlxMc_span").text(row.wzlxMc);
		$("#check_ddxx_div #wzMc_span").text(row.wzMc);
		$("#check_ddxx_div #yssMc_span").text(row.yssMc);
		$("#check_ddxx_div #fhdwMc_span").text(row.fhdwMc);
		$("#check_ddxx_div #shbmMc_span").text(row.shbmMc);
	}
	else{
		$("#preview_bdxx_bg_div").css("display","none");
		$("#check_ddxx_div #id").val("");
		$("#check_ddxx_div #ddh_span").text("");
		$("#check_ddxx_div #sjsfzh_span").text("");
		$("#check_ddxx_div #sjxm_span").text("");
		$("#check_ddxx_div #cph_span").text("");
		$("#check_ddxx_div #lxlxMc_span").text("");
		$("#check_ddxx_div #yzxzl_span").text("");
		$("#check_ddxx_div #sjzl_span").text("");
		$("#check_ddxx_div #zlceb_span").text("");
		$("#check_ddxx_div #dj_span").text("");
		$("#check_ddxx_div #je_span").text("");
		$("#check_ddxx_div #wzlxMc_span").text("");
		$("#check_ddxx_div #wzMc_span").text("");
		$("#check_ddxx_div #yssMc_span").text("");
		$("#check_ddxx_div #fhdwMc_span").text("");
		$("#check_ddxx_div #shbmMc_span").text("");
	}
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "tab1_div":
		space=250;
		break;
	case "preview_bdxx_dialog_div":
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
			<span class="ddh_span">订单号：</span>
			<input type="text" class="ddh_inp" id="ddh" placeholder="请输入订单号"/>
			<a class="search_but" id="search_but">查询</a>
			<a id="add_but">添加</a>
		</div>
		<table id="tab1">
		</table>
	</div>
	
	<div class="preview_bdxx_bg_div" id="preview_bdxx_bg_div">
		<div class="preview_bdxx_div" id="preview_bdxx_div">
			<div class="preview_bdxx_dialog_div" id="preview_bdxx_dialog_div">
				<table border="1" bordercolor="red" style="width: 100%;">
				  <tr>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
				  </tr>
				  <tr>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
				  </tr>
				  <tr>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
				  </tr>
				  <tr>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
				  </tr>
				  <tr>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
				  </tr>
				  <tr>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
				  </tr>
				  <tr>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
	
	<%@include file="../../inc/foot.jsp"%>
</div>
</body>
</html>