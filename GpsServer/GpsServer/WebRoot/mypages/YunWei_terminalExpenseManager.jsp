<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>费用管理</title>
<link href="<%=path%>/css/page.css" rel="stylesheet" type="text/css" />
<script>
	//验证搜索表单，通过的话就提交表单
	function submitSearchForm(searchForm){
		if (document.searchForm.value.value == ""
			|| (/\s+/g.test(document.searchForm.value.value))) {
		window.alert("必须输入查询值");
		return;
	}
	document.searchForm.submit();
	}

	//验证分页表单，通过的话就提交表单
	function submitPageForm(){
		if(document.pageForm.pageIndex.value=="" || (/\s+/g.test(document.pageForm.pageIndex.value))){
		   window.alert("输入页码");
		   return;
		}
		if(isNaN(document.pageForm.pageIndex.value)){
			window.alert("页码需要为数字");
			return;
		}
		document.pageForm.submit();
	}
	
</script>
</head>
<body>
	<div class="container_top"><span class="c_t_l"></span><span class="c_t_r"></span><img src="<%=path%>/images/tb.gif" width="16" height="16" />你当前的位置：[服务费管理 > 费用充值> 终端充值]</div>
		<div class="content">
		  <div class="tool"> 
			<form action="YunWei_terminalExpenseSearch?pageIndex=1" method="post" name="searchForm">
			   	<table border="0" >
				  <tr>
				   <td>
								按：
							</td>
							<td>
								<select name="option">
									<option value="0">
										-请选择搜索条件-
									</option>
									<option value="1">
										目标编号
									</option>
									<option value="3">
										终端编号
									</option>
								</select>
							</td>
							<td>
								<input type="text" 
									maxlength="" name="value" />
							</td>
							<td>
								<a href="#" onclick="submitSearchForm()" class="cssbtn"> <img
										src="<%=path%>/images/search.gif" />查询</a> &nbsp;&nbsp;
							</td>
				  </tr>
				</table>
			</form>
		  </div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="datatable" style="text-align:center;">
	  <tr>
	    <th scope="col">终端编号</th>
	    <th scope="col">目标编号</th>
	    <th scope="col">目标类型</th>
	    <th scope="col">注册时间</th>
	    <th scope="col">服务开始时间</th>
	    <th scope="col">服务结束时间</th>
	    <th scope="col">基本操作</th>
	  </tr>
	  
	  <s:iterator value="terminalList" var="terminal" status="status">
	  <tr
	 	 <s:if test="#status.even">
           bgcolor="#dddddd"
          </s:if>
          <s:elseif test="#status.odd">
           bgcolor="#ffffff"
          </s:elseif>
       >
	    <td><s:property value="#terminal.sim"/></td>
	    <td><s:property value="#terminal.carnumber"/></td>
	    <td><s:property value="#terminal.TCarInfo.typeName"/></td>
	    <td><s:date name="#terminal.registertime" format="yyyy-MM-dd hh:mm" /></td>
	    <td><s:date name="#terminal.startTime" format="yyyy-MM-dd hh:mm" /></td>
	    <td><s:date name="#terminal.endTime" format="yyyy-MM-dd hh:mm" /></td>
	    <td><img src="<%=path%>/images/edt.gif" width="16" height="16" /><a href='<s:url action="YunWei_terminalExpenseAdd"><s:param name="terminalId" value="#terminal.id"/></s:url>'>充值</a>&nbsp; &nbsp;</td>
	  </tr>
	  </s:iterator>
	</table>
	
	<form action="YunWei_findTerminalExpenseList" method="post" name="pageForm">
		<div class="tablefoot">
					<table border="0" align="right" cellpadding="0" cellspacing="0" class="right">
		                <tr>
		                  <td width="40"><a href="<s:url action="YunWei_findTerminalExpenseList"><s:param name="pageIndex" value="1"/></s:url>"><img src="<%=path%>/images/first.gif"/></a></td>
		                  <td width="45"><a href="<s:url action="YunWei_findTerminalExpenseList"><s:param name="pageIndex" value="pageIndex-1"/></s:url>"><img src="<%=path%>/images/back.gif"/></a></td>
		                  <td width="45"><a href="<s:url action="YunWei_findTerminalExpenseList"><s:param name="pageIndex" value="pageIndex+1"/></s:url>"><img src="<%=path%>/images/next.gif"/></a></td>
		                  <td width="40"><a href="<s:url action="YunWei_findTerminalExpenseList"><s:param name="pageIndex" value="pages"/></s:url>"><img class="btnImg" src="<%=path%>/images/last.gif"/></a></td>
		                  <td width="100"><div align="center"><span class="STYLE1">转到第
		                    <input name="pageIndex" type="text" size="4" maxlength="4" style="height:12px; width:20px; border:1px solid #999999;" /> 
		                    	页 </span></div></td>
		                  <td width="40">
		                  	<a href="#" onclick="submitPageForm()"><img src="images/go.gif" width="37" height="15"/></a>
		                  </td>
		                </tr>
		            </table>
		            &nbsp;&nbsp;共有 <s:property value="total"/> 条记录，当前第<s:property value="pageIndex"/>/<s:property value="pages"/> 页
		</div>
	</form>
</div>


<div class="container_bottom"><span class="c_b_l"></span><span class="c_b_r"></span></div>
</body>
</html>
