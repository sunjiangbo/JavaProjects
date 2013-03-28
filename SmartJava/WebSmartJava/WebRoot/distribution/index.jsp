﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>配送点-物流管理系统</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<style media="all" type="text/css">
@import "../style/all.css";
</style>
<script type="text/javascript" src="../script/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
<!--
	function reinitIframe() {
		var iframe = document.getElementById("frame_content");
		try {
			var bHeight = iframe.contentWindow.document.body.scrollHeight;
			var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
			var height = Math.max(bHeight, dHeight);
			iframe.style.height = height;
		} catch (ex) {
		}
	}
	$(function() {
		window.setInterval("reinitIframe()", 200);
		$("#left-column h3").bind("click", function() {
			var t = $(this);
			t.toggleClass('link');
			t.next().toggle();
		});
	});
//-->
</script>
</head>
<body>
	<div id="main">
		<div id="header">
			<a href="index.jsp" class="logo"><img
				src="../style/img/logo.png" width="200" height="29" alt="" />
			</a>
			<ul id="top-navigation">
				<li class="active"><span><span><a
							href="index.jsp">首页</a>
					</span>
				</span>
				</li>
				<li><span><span><a href="placepriceManager.jsp">配送范围及价格管理</a>
					</span>
				</span>
				</li>
				<li><span><span><a href="orderManager.jsp">  订单管理</a>
					</span>
				</span>
				</li>
				<li><span><span><a href="vehicleManage.jsp">车辆管理</a>
					</span>
				</span>
				</li>
				<li><span><span><a href="goodsManage.jsp">货物管理</a>
					</span>
				</span>
				</li>
				<li><span><span><a href="userManager.jsp">人员管理</a>
					</span>
				</span>
				</li>
				<li><span><span><a href="excelManager.jsp">报表管理</a>
					</span>
				</span>
				</li>
			</ul>
			<div id="operator" class="active">
				配送员&nbsp;<span>admin</span>&nbsp;<a href="#">退出</a>
			</div>
		</div>
		<div id="middle">
			<div id="center-column">
				<span
					style="text-align:center;font-family:Georgia, 'Times New Roman', Times, serif;font-size:36px;padding-top:200px;">Welcome
					to Smart Java 物流管理系统 ！</span> <img src="../images/login/login_tp.jpg"
					alt="" />
			</div>
		</div>
		<div id="footer"></div>
	</div>
	<div id="copyright">Copyright &copy;2012 中软实训第六小组</div>
</body>
</html>