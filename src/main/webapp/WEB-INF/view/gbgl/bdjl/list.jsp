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
	display:none;
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
.preview_bdxx_dialog_div .title_div{
	width: 100%;
	height:50px;
	line-height:50px;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}
.preview_bdxx_dialog_div .tab_header_div{
	width: 90%;
	height:30px;
	line-height:30px;
	margin:auto;
}
.preview_bdxx_dialog_div .tab_header_div .xh_key_span{
	margin-left: 10px;
}
.preview_bdxx_dialog_div .tab_header_div .xh_val_span{
	margin-left: 27px;
}
.preview_bdxx_dialog_div .tab_header_div .rq_key_span{
	margin-left: 170px;
}
.preview_bdxx_dialog_div .tab_header_div .rq_val_span{
	margin-left: 15px;
}
.preview_bdxx_dialog_div .tab_header_div .dw_span{
	margin-left: 250px;
}
.preview_bdxx_dialog_div table{
	width: 90%;
	margin:auto;
	text-align: center;
	border-color: #000;
}
.preview_bdxx_dialog_div table .tr1{
	height: 25px;
}
.preview_bdxx_dialog_div table .tr2{
	height: 35px;
}
.preview_bdxx_dialog_div table .ch_key_td,
.preview_bdxx_dialog_div table .hp_key_td,
.preview_bdxx_dialog_div table .kh_key_td,
.preview_bdxx_dialog_div table .shdw_key_td,
.preview_bdxx_dialog_div table .mz_key_td,
.preview_bdxx_dialog_div table .mzrqsj_key_td,
.preview_bdxx_dialog_div table .mzsby_key_td,
.preview_bdxx_dialog_div table .pz_key_td,
.preview_bdxx_dialog_div table .pzrqsj_key_td,
.preview_bdxx_dialog_div table .pzsby_key_td,
.preview_bdxx_dialog_div table .jz_key_td,
.preview_bdxx_dialog_div table .jzsj_key_td{
	width: 10%;
}
.preview_bdxx_dialog_div table .ch_val_td,
.preview_bdxx_dialog_div table .hp_val_td,
.preview_bdxx_dialog_div table .mz_val_td,
.preview_bdxx_dialog_div table .mzsby_val_td,
.preview_bdxx_dialog_div table .pz_val_td,
.preview_bdxx_dialog_div table .pzsby_val_td,
.preview_bdxx_dialog_div table .jz_val_td{
	width: 20%;
}
.preview_bdxx_dialog_div table .kh_val_td,
.preview_bdxx_dialog_div table .mzrqsj_val_td,
.preview_bdxx_dialog_div table .pzrqsj_val_td{
	width: 30%;
}
.preview_bdxx_dialog_div table .shdw_val_td{
	width: 38%;
}
.preview_bdxx_dialog_div table .fhdw_key_td{
	width: 12%;
}
.preview_bdxx_dialog_div table .fhdw_val_td{
	width: 40%;
}
.preview_bdxx_dialog_div table .jzsj_val_td{
	width: 60%;
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
		title:"磅单信息",
		width:setFitWidthInParent("#preview_bdxx_div","preview_bdxx_dialog_div"),
		height:480,
		top:dialogTop,
		left:dialogLeft,
		buttons:[
           {text:"打印",id:"print_but",iconCls:"icon-ok",handler:function(){
        	   var pageHtml = document.body.innerHTML;
        	   window.document.body.innerHTML= $("#preview_bdxx_dialog_div .panel-body").html();
        	   window.print();//打印上面新建的网页
        	   //window.document.body.innerHTML= pageHtml;
        	   location.href=location.href;
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

	$("#preview_bdxx_dialog_div #print_but").css("left","30%");
	$("#preview_bdxx_dialog_div #print_but").css("position","absolute");

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
		$("#preview_bdxx_div #xh_val_span").text(row.ddh);
		$("#preview_bdxx_div #rq_val_span").text(row.rq);
		$("#preview_bdxx_div table #ch_val_td").text(row.cph);
		$("#preview_bdxx_div table #hp_val_td").text(row.wzMc);
		$("#preview_bdxx_div table #shdw_val_td").text(row.shbmMc);
		$("#preview_bdxx_div table #fhdw_val_td").text(row.fhdwMc);
		$("#preview_bdxx_div table #mz_val_td").text(row.mz);
		$("#preview_bdxx_div table #mzrqsj_val_td").text(row.sygbsj);
		$("#preview_bdxx_div table #pz_val_td").text(row.pz);
		$("#preview_bdxx_div table #pzrqsj_val_td").text(row.qygbsj);
		$("#preview_bdxx_div table #jz_val_td").text(row.jz);
		$("#preview_bdxx_div table #jzsj_val_td").text(row.sjxm);
	}
	else{
		$("#preview_bdxx_bg_div").css("display","none");
		$("#preview_bdxx_div #xh_val_span").text("");
		$("#preview_bdxx_div #rq_val_span").text("");
		$("#preview_bdxx_div table #ch_val_td").text("");
		$("#preview_bdxx_div table #hp_val_td").text("");
		$("#preview_bdxx_div table #shdw_val_td").text("");
		$("#preview_bdxx_div table #fhdw_val_td").text("");
		$("#preview_bdxx_div table #mz_val_td").text("");
		$("#preview_bdxx_div table #mzrqsj_val_td").text("");
		$("#preview_bdxx_div table #pz_val_td").text("");
		$("#preview_bdxx_div table #pzrqsj_val_td").text("");
		$("#preview_bdxx_div table #jz_val_td").text("");
		$("#preview_bdxx_div table #jzsj_val_td").text("");
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
				<div class="title_div">山东蓝帆健康科技有限公司过磅单</div>
				<div class="tab_header_div">
					<span class="xh_key_span">序号：</span>
					<span class="xh_val_span" id="xh_val_span"></span>
					<span class="rq_key_span">日期：</span>
					<span class="rq_val_span" id="rq_val_span"></span>
					<span class="dw_span">单位：公斤</span>
				</div>
				<table border="1">
				  <tr class="tr1">
					<td class="ch_key_td">车号</td>
					<td class="ch_val_td" id="ch_val_td"></td>
					<td class="hp_key_td">货品</td>
					<td class="hp_val_td" id="hp_val_td" colspan="2"></td>
					<td class="kh_key_td">客户</td>
					<td class="kh_val_td" colspan="2">蓝帆</td>
				  </tr>
				  <tr class="tr1">
					<td class="shdw_key_td">收货单位</td>
					<td class="shdw_val_td" id="shdw_val_td" colspan="3"></td>
					<td class="fhdw_key_td">发货单位</td>
					<td class="fhdw_val_td" id="fhdw_val_td" colspan="3"></td>
				  </tr>
				  <tr class="tr2">
					<td class="mz_key_td">毛重</td>
					<td class="mz_val_td" id="mz_val_td"></td>
					<td class="mzrqsj_key_td">日期时间</td>
					<td class="mzrqsj_val_td" id="mzrqsj_val_td" colspan="3"></td>
					<td class="mzsby_key_td">司磅员</td>
					<td class="mzsby_val_td">李铁玉</td>
				  </tr>
				  <tr class="tr2">
					<td class="pz_key_td">皮重</td>
					<td class="pz_val_td" id="pz_val_td"></td>
					<td class="pzrqsj_key_td">日期时间</td>
					<td class="pzrqsj_val_td" id="pzrqsj_val_td" colspan="3"></td>
					<td class="pzsby_key_td">司磅员</td>
					<td class="pzsby_val_td">李铁玉</td>
				  </tr>
				  <tr class="tr2">
					<td class="jz_key_td">净重</td>
					<td class="jz_val_td" id="jz_val_td"></td>
					<td class="jzsj_key_td">司机</td>
					<td class="jzsj_val_td" id="jzsj_val_td" colspan="5"></td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
	
	<%@include file="../../inc/foot.jsp"%>
</div>
</body>
</html>