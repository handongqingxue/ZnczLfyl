<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
.main_div{
	padding: 1px;
}

.tab1_div{
	margin-top:80px;
	margin-left: 220px;
	position: fixed;
}
.tab1_div .toolbar{
	height:32px;
}
.tab1_div .toolbar .ddh_span,
.tab1_div .toolbar .ddzt_span,
.tab1_div .toolbar .search_but{
	margin-left: 13px;
}
.tab1_div .toolbar .ddh_inp{
	width: 120px;
	height: 25px;
}

.check_ddxx_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.check_ddxx_div{
	width: 1000px;
	height: 520px;
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
var ddglPath=path+'ddgl/';
var dialogTop=10;
var dialogLeft=20;
var cddxxdNum=0;
$(function(){
	initDDZTCBB();
	initSearchLB();
	initAddLB();
	initRemoveLB();
	initTab1();
	initCheckDDXXDialog();//0
	
	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	var cddxxdpw=$("body").find(".panel.window").eq(cddxxdNum);
	var cddxxdws=$("body").find(".window-shadow").eq(cddxxdNum);

	var cddxxdDiv=$("#check_ddxx_div");
	cddxxdDiv.append(cddxxdpw);
	cddxxdDiv.append(cddxxdws);
}

function initCheckDDXXDialog(){
	dialogTop+=20;
	$("#check_ddxx_dialog_div").dialog({
		title:"订单信息",
		width:setFitWidthInParent("#check_ddxx_div","check_ddxx_dialog_div"),
		height:430,
		top:dialogTop,
		left:dialogLeft,
		buttons:[
           {text:"通过",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   checkById();
           }},
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openCheckDDXXDialog(false,null);
           }}
        ]
	});

	$("#check_ddxx_dialog_div table").css("width",(setFitWidthInParent("#check_ddxx_div","check_ddxx_dialog_div"))+"px");
	$("#check_ddxx_dialog_div table").css("magin","-100px");
	$("#check_ddxx_dialog_div table td").css("padding-left","40px");
	$("#check_ddxx_dialog_div table td").css("padding-right","20px");
	$("#check_ddxx_dialog_div table td").css("font-size","15px");
	$("#check_ddxx_dialog_div table .td1").css("width","15%");
	$("#check_ddxx_dialog_div table .td2").css("width","30%");
	$("#check_ddxx_dialog_div table tr").css("border-bottom","#CAD9EA solid 1px");
	$("#check_ddxx_dialog_div table tr").each(function(i){
		$(this).css("height","45px");
	});

	$(".panel.window").eq(cddxxdNum).css("margin-top","20px");
	$(".panel.window .panel-title").eq(cddxxdNum).css("color","#000");
	$(".panel.window .panel-title").eq(cddxxdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(cddxxdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(cddxxdNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(cddxxdNum).css("border-color","#ddd");

	$("#check_ddxx_dialog_div #ok_but").css("left","30%");
	$("#check_ddxx_dialog_div #ok_but").css("position","absolute");

	$("#check_ddxx_dialog_div #cancel_but").css("left","45%");
	$("#check_ddxx_dialog_div #cancel_but").css("position","absolute");
	
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
}

function initDDZTCBB(){
	var data=[];
	data.push({"value":"","text":"请选择"});
	$.post(ddglPath+"queryDingDanZhuangTaiCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			ddztCBB=$("#ddzt_cbb").combobox({
				valueField:"value",
				textField:"text",
				//multiple:true,
				data:data
			});
		}
	,"json");
}

function initSearchLB(){
	$("#search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var ddh=$("#toolbar #ddh").val();
			var ddztId=ddztCBB.combobox("getValue");
			tab1.datagrid("load",{ddh:ddh,ddztId:ddztId});
		}
	});
}

function initAddLB(){
	$("#add_but").linkbutton({
		iconCls:"icon-add",
		onClick:function(){
			location.href=ddglPath+"zhcx/new";
		}
	});
}

function initRemoveLB(){
	$("#remove_but").linkbutton({
		iconCls:"icon-remove",
		onClick:function(){
			deleteByIds();
		}
	});
}

function initTab1(){
	tab1=$("#tab1").datagrid({
		title:"综合查询",
		url:ddglPath+"queryZHCXList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("body","tab1_div"),
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"ddh",title:"订单号",width:150},
			{field:"ddztMc",title:"订单状态",width:150},
			{field:"sjsfzh",title:"司机身份证号",width:200},
			{field:"sjxm",title:"司机姓名",width:100},
			{field:"cph",title:"车牌号",width:150},
			{field:"yssMc",title:"运输商",width:150},
			{field:"fhdwMc",title:"发货单位",width:150},
			{field:"shbmMc",title:"收货部门",width:150},
            {field:"lxlx",title:"流向类型",width:100,formatter:function(value,row){
            	var str;
            	switch (value) {
				case 1:
					str="送运";
					break;
				case 2:
					str="取运";
					break;
				}
            	return str;
            }},
            {field:"yzxzl",title:"预装卸重量",width:100},
            {field:"sjzl",title:"实际重量",width:100},
            {field:"zlceb",title:"重量差额比",width:100},
            {field:"bjsj",title:"编辑时间",width:150},
            {field:"id",title:"操作",width:150,formatter:function(value,row){
            	var str="<a href=\"edit?id="+value+"\">编辑</a>&nbsp;&nbsp;"
            		+"<a href=\"detail?id="+value+"\">详情</a>&nbsp;&nbsp;";
           		if(row.ddztMc=="待审核"){
           			var rowJson = JSON.stringify(row).replace(/"/g, '&quot;');
           			str+="<a onclick=\"openCheckDDXXDialog(true,"+rowJson+")\">审核</a>";
           		}
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{ddh:"<div style=\"text-align:center;\">暂无信息<div>"});
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

function openCheckDDXXDialog(flag,row){
	if(flag){
		$("#check_ddxx_bg_div").css("display","block");
		$("#check_ddxx_div #id").val(row.id);
		$("#check_ddxx_div #ddh_span").text(row.ddh);
		$("#check_ddxx_div #sjsfzh_span").text(row.sjsfzh);
		$("#check_ddxx_div #sjxm_span").text(row.sjxm);
		$("#check_ddxx_div #cph_span").text(row.cph);
		$("#check_ddxx_div #lxlxMc_span").text(row.lxlx==1?"送运":"取运");
		$("#check_ddxx_div #yzxzl_span").text(row.yzxzl);
		$("#check_ddxx_div #sjzl_span").text(row.sjzl);
		$("#check_ddxx_div #zlceb_span").text(row.zlceb);
		$("#check_ddxx_div #wzlxMc_span").text(row.wzlxMc);
		$("#check_ddxx_div #wzMc_span").text(row.wzMc);
		$("#check_ddxx_div #yssMc_span").text(row.yssMc);
		$("#check_ddxx_div #fhdwMc_span").text(row.fhdwMc);
		$("#check_ddxx_div #shbmMc_span").text(row.shbmMc);
	}
	else{
		$("#check_ddxx_bg_div").css("display","none");
		$("#check_ddxx_div #id").val("");
		$("#check_ddxx_div #ddh_span").text("");
		$("#check_ddxx_div #sjsfzh_span").text("");
		$("#check_ddxx_div #sjxm_span").text("");
		$("#check_ddxx_div #cph_span").text("");
		$("#check_ddxx_div #lxlxMc_span").text("");
		$("#check_ddxx_div #yzxzl_span").text("");
		$("#check_ddxx_div #sjzl_span").text("");
		$("#check_ddxx_div #zlceb_span").text("");
		$("#check_ddxx_div #wzlxMc_span").text("");
		$("#check_ddxx_div #wzMc_span").text("");
		$("#check_ddxx_div #yssMc_span").text("");
		$("#check_ddxx_div #fhdwMc_span").text("");
		$("#check_ddxx_div #shbmMc_span").text("");
	}
}

function checkById(){
	var id=$("#check_ddxx_div #id").val();
	$.post(ddglPath + "checkDingDanById",
		{id:id},
		function(result){
			if(result.status==1){
				alert(result.msg);
				openCheckDDXXDialog(false,null);
				tab1.datagrid("load");
			}
			else{
				alert(result.msg);
			}
		}
	,"json");
}

function deleteByIds() {
	var rows=tab1.datagrid("getSelections");
	if (rows.length == 0) {
		$.messager.alert("提示","请选择要删除的信息！","warning");
		return false;
	}
	
	$.messager.confirm("提示","确定要删除吗？",function(r){
		if(r){
			var ids = "";
			for (var i = 0; i < rows.length; i++) {
				ids += "," + rows[i].id;
			}
			ids=ids.substring(1);
			
			$.post(ddglPath + "deleteDingDan",
				{ids:ids},
				function(result){
					if(result.status==1){
						alert(result.msg);
						location.href = location.href;
					}
					else{
						alert(result.msg);
					}
				}
			,"json");
			
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
<div class="layui-layout layui-layout-admin main_div">
	<%@include file="../../inc/side.jsp"%>
	<div class="tab1_div" id="tab1_div">
		<div class="toolbar" id="toolbar">
			<span class="ddh_span">订单号：</span>
			<input type="text" class="ddh_inp" id="ddh" placeholder="请输入订单号"/>
			<span class="ddzt_span">订单状态：</span>
			<input id="ddzt_cbb"/>
			<a class="search_but" id="search_but">查询</a>
			<a id="add_but">添加</a>
			<a id="remove_but">删除</a>
		</div>
		<table id="tab1">
		</table>
	</div>
	
<div class="check_ddxx_bg_div" id="check_ddxx_bg_div">
	<div class="check_ddxx_div" id="check_ddxx_div">
	<div class="check_ddxx_dialog_div" id="check_ddxx_dialog_div">
		<input type="hidden" id="id"/>
		<table>
		  <tr>
			<td class="td1" align="right">
				订单号
			</td>
			<td class="td2">
				<span id="ddh_span"></span>
			</td>
			<td class="td1" align="right">
				司机身份证号
			</td>
			<td class="td2">
				<span id="sjsfzh_span"></span>
			</td>
		  </tr>
		  <tr>
			<td class="td1" align="right">
				司机姓名
			</td>
			<td class="td2">
				<span id="sjxm_span"></span>
			</td>
			<td class="td1" align="right">
				车牌号
			</td>
			<td class="td2">
				<span id="cph_span"></span>
			</td>
		  </tr>
		  <tr>
			<td class="td1" align="right">
				流向类型
			</td>
			<td class="td2">
				<span id="lxlxMc_span"></span>
			</td>
			<td class="td1" align="right">
				预装卸重量
			</td>
			<td class="td2">
				<span id="yzxzl_span"></span>
			</td>
		  </tr>
		  <tr>
			<td class="td1" align="right">
				实际重量
			</td>
			<td class="td2">
				<span id="sjzl_span"></span>
			</td>
			<td class="td1" align="right">
				重量差额比
			</td>
			<td class="td2">
				<span id="zlceb_span"></span>
			</td>
		  </tr>
		  <tr>
			<td class="td1" align="right">
				物资类型
			</td>
			<td class="td2">
				<span id="wzlxMc_span"></span>
			</td>
			<td class="td1" align="right">
				物资名称
			</td>
			<td class="td2">
				<span id="wzMc_span"></span>
			</td>
		  </tr>
		  <tr>
			<td class="td1" align="right">
				运输商
			</td>
			<td class="td2">
				<span id="yssMc_span"></span>
			</td>
			<td class="td1" align="right">
				发货单位
			</td>
			<td class="td2">
				<span id="fhdwMc_span"></span>
			</td>
		  </tr>
		  <tr>
			<td class="td1" align="right">
				收货部门
			</td>
			<td class="td2">
				<span id="shbmMc_span"></span>
			</td>
			<td class="td1" align="right">
			</td>
			<td class="td2">
			</td>
		  </tr>
		</table>
	</div>
	</div>
</div>
	
	<%@include file="../../inc/foot.jsp"%>
</div>
</body>
</html>