<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>边框导航栏</title>
<style type="text/css">
.layui-layout-admin{
	padding: 1px;
}
.header_div{
	position: fixed;
}
.side {
	position: fixed;
	top: 50px;
	bottom: 0;
	height: 100%;
	justify-content: center;
	display: flex;
}

.head {
	align-items: center;
	position: relative;
	height: 50px;
	background-color: #20A0FF !important;
}

.headTitle, .headTitle>h1 {
	padding-left: 15px;
	margin: 0px auto;
}
.layui-nav .layui-nav-item a{
	color:#000;
}
.layui-nav .layui-nav-item .pointer-img{
	margin-top: 18px;
	margin-left: 18px;
	position: absolute;
}
.layui-nav .level-ul{
	height: 800px;
	margin-right: 10px;
	overflow-y:scroll;
}
.layui-nav .first-level-div{
	width: 92%; 
	margin: 20px auto 0; 
	border: #CAD9EA solid 1px;
	background-color: #F5FAFE;
}
.layui-nav .first-level{
    font-size: 15px;
	font-weight: bold;
	background-color: #E7F4FD;
}
.layui-nav,.layui-side{
	background-color: #FAFDFE;
}
.layui-side{
	border-right:#86B9D6 solid 1px;
}
.layui-layout-admin .layui-header{
	width:100%;
	background-color:  #E7F4FD;
}
.line_div{
	width:100%;
	height: 1px;
	background-color: #CAD9EA;
}
.electronicGuide_img{
	width: 36px;
	height: 36px;
}
</style>
</head>
<body>
<div class="layui-header header_div">
		<div class="layui-logo">
			<img class="electronicGuide_img" alt="" src="<%=basePath%>resource/image/electronicGuide.png"/>
			<a>智能称重平台系统</a>
		</div>
		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item"><a href="javascript:;"> 
				<img src="${sessionScope.user.headImgUrl }" class="layui-nav-img">
					${sessionScope.user.userName }
				</a>
			</li>
			<li class="layui-nav-item"><a href="<%=basePath%>main/exit">退出</a>
			</li>
		</ul>
	</div>

	<div class="layui-side ">
		<div class="layui-side-scroll">
			<ul class="layui-nav layui-nav-tree layui-inline level-ul" lay-filter="demo">
				<div class="first-level-div">
					<li class="layui-nav-item first-level">
						<a>
							订单管理
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>ddgl/ddzt/list">
							&nbsp;&nbsp;&nbsp;订单状态
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>ddgl/drk/list">
							&nbsp;&nbsp;&nbsp;待入库
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>ddgl/zhcx/list">
							&nbsp;&nbsp;&nbsp;综合查询
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>ddgl/shjl/list">
							&nbsp;&nbsp;&nbsp;审核记录
						</a>
					</li>
				</div>
				<div class="first-level-div">
					<li class="layui-nav-item first-level">
						<a>
							过磅管理
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>gbgl/bdjl/list">
							&nbsp;&nbsp;&nbsp;磅单记录
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>gbgl/gbjl/list">
							&nbsp;&nbsp;&nbsp;过磅记录
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>gbgl/dyjsh/list">
							&nbsp;&nbsp;&nbsp;待一检审核
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>gbgl/dejsh/list">
							&nbsp;&nbsp;&nbsp;待二检审核
						</a>
					</li>
				</div>
				<div class="first-level-div">
					<li class="layui-nav-item first-level">
						<a>
							物资管理
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>wzgl/wzlx/list">
							&nbsp;&nbsp;&nbsp;物资类型
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>wzgl/wzcx/list">
							&nbsp;&nbsp;&nbsp;物资查询
						</a>
					</li>
				</div>
				<div class="first-level-div">
					<li class="layui-nav-item first-level">
						<a>
							单位管理
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>dwgl/yss/list">
							&nbsp;&nbsp;&nbsp;运输商
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>dwgl/fhdw/list">
							&nbsp;&nbsp;&nbsp;发货单位
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>dwgl/shbm/list">
							&nbsp;&nbsp;&nbsp;收货部门
						</a>
					</li>
				</div>
				<div class="first-level-div">
					<li class="layui-nav-item first-level">
						<a>
							车辆台账管理
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>cltzgl/zhcx/list">
							&nbsp;&nbsp;&nbsp;综合查询
						</a>
					</li>
				</div>
				<div class="first-level-div">
					<li class="layui-nav-item first-level">
						<a>
							系统管理
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>xtgl/yhcx/list">
							&nbsp;&nbsp;&nbsp;用户查询
						</a>
					</li>
					<!-- 
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>background/bus/busStop/list">
							&nbsp;&nbsp;&nbsp;角色查询
						</a>
					</li>
					-->
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>background/bus/busStop/list">
							&nbsp;&nbsp;&nbsp;权限查询
						</a>
					</li>
					<!-- 
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>background/bus/busStop/list">
							&nbsp;&nbsp;&nbsp;菜单查询
						</a>
					</li>
					 -->
				</div>
			</ul>
		</div>
	</div>
</body>
</html>