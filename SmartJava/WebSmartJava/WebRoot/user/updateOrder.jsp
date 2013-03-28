<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>订单管理-客户-物流管理系统</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<style media="all" type="text/css">
@import "../style/all.css";
</style>
</head>
<body style="background: none">
<div class="top-bar"> 
  <!--a href="#" class="button">取 消</a><a href="#" class="button">保 存</a-->
  <h1>修改订单</h1>
  <div class="breadcrumbs"> <a href="index.html" target="_top">首页</a> / <a href="orderManager.html" target="_top">订单管理</a> </div>
</div>
<div class="select-bar"/>
<div class="table"> <img src="../style/img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="../style/img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
  <form>
		  <div class="select-bar">
			<table class="select-table">
				<tr>
					<th>订单号</th>
					<td>SJ006000001</td>
					<th></th>
					<th></th>
				</tr>
				<tr>
					<th>收件人姓名(*)</th>
					<td><input type="text" name="receiver" class="text"/></td>
					<th>收件人地址(*)</th>
					<td>
						<select  name="tprovince "style="width:70px">
							<option>广东</option>
							<option>湖南省</option>
						</select>
						<select  name="tcity" style="width:70px">
							<option>广州</option>
							<option>长沙市</option>							
						</select>
						<select  name="tcountry" style="width:70px">
							<option>越秀区</option>
							<option>岳麓区</option>							
						</select>
						<select name="ttown" style="width:70px">
							<option>白云镇</option>
							<option>雷锋镇</option>
						</select>
					</td>					
				</tr>
				<tr>
					<th>收件人电话号码(*)</th>
					<td><input type="text" name="tPhone"  class="text"/></td>
					<th>收件人邮编</th>
					<td><input type="text" name="tCode"  class="text"/></td>
				</tr>
				<tr>
					<th>寄件人姓名</th>
					<td><input type="text" name="sender" value="李四" class="text"/></td>
					<th>寄件人地址</th>
					<td>				
						<select name="sprovince" style="width:70px">
							<option>湖南省</option>						
							<option>广东</option>

						</select>
						<select name="scity" style="width:70px">
							<option>长沙市</option>							
							<option>广州</option>
						
						</select>
						<select name="scountry" style="width:70px">
							<option>岳麓区</option>
							<option>越秀区</option>
						
						</select>
						<select name="stown" style="width:70px">
							<option>雷锋镇</option>						
							<option>白云镇</option>

						</select>
					</td>	
				</tr>
				<tr>
					<th>寄件人电话号码</th>
					<td><input type="text" name="sPhone"  class="text"/></td>
					<th>寄件人邮编</th>
					<td><input type="text" name="sCode"  class="text"/></td>
				</tr>
				<tr>
					<th>寄件重量(*)</th>
					<td><input type="text" name="weight"  class="text"/>(单位:KG)</td>
					<th>寄件体积(*)</th>
					<td><input type="text" name="volumn"  class="text"/>(单位:M3)</td>
				</tr>
				<tr>
					<th>寄件数量(*)</th>
					<td><input type="text" name="quantity"  class="text"/></td>
					</td>
					<th>寄件物品类别(*)</th>
					<td>
						<select style="width:70px" name="goodsType">
							<option>易碎</option>
							<option>危险</option>
							<option>快件</option>
							<option>普邮</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>备注信息</th>
					<td><input type="text" name="remark"  class="text"/></td>
					<th></th>
					<th></th>
				</tr>
				<tr>
					<th>价格在线计算</th>
					<td>15.00 RMB </td>
				</tr>
				<tr>				
					<th><input type="button" name="Submit" onclick="javascript:window.location.href='deleteProduct.html'" value="修改订单" class="button"/></th>				
					<th></th>
					<th><input type="button" name="Submit" onclick="javascript:window.location.href='deleteProduct.html'" value="取消修改" class="button"/></th>
					<th></th>
				</tr>
    </table>
  </form>
</div>
</body>
</html>

