<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    <%response.setStatus(HttpServletResponse.SC_OK);%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服务器发生内部错误</title>
<STYLE type=text/css>INPUT {
	FONT-SIZE: 12px
}
TD {
	FONT-SIZE: 12px
}
.p2 {
	FONT-SIZE: 12px
}
.p6 {
	FONT-SIZE: 12px; COLOR: #1b6ad8
}
A {
	COLOR: #1b6ad8; TEXT-DECORATION: none
}
A:hover {
	COLOR: red
}
</STYLE>

</head>
<body>
 <P align=center>　</P>
<P align=center>　</P>
<TABLE cellSpacing=0 cellPadding=0 width=540 align=center border=0>
  <TBODY>
  <TR>
    <TD vAlign=top height=270>
      <DIV align=center><BR><IMG height=211 src="/GpsServer/images/error.gif" 
      width=329><BR><BR>
      <TABLE cellSpacing=0 cellPadding=0 width="80%" border=0>
        <TBODY>
        <TR>
          <TD><FONT class=p2>&nbsp;&nbsp;&nbsp; <FONT color=#ff0000><IMG 
            height=13 src="/GpsServer/images/emessage.gif" 
            width=12>&nbsp;无法访问本页的原因是：</FONT></FONT></TD></TR>
        <TR>
          <TD height=8></TD>
        <TR>
          <TD>
            <P><FONT color=#000000><BR>服务器出现内部错误，请与管理员联系</FONT>! 
      　</P></TD></TR></TBODY></TABLE></DIV></TD></TR>
  <TR>
    <TD height=5></TD>
  <TR>
    <TD align=middle>
      <CENTER>
      <TABLE cellSpacing=0 cellPadding=0 width=480 border=0>
        <TBODY>
        <TR>
          <TD width=6><IMG height=26 src="/GpsServer/images/left2.gif" 
width=7></TD>
          <TD background='/GpsServer/images/bg2.gif'>
            <DIV align=center><FONT class=p6> <A 
            href="javascript:history.go(-1)">返回出错页</A>　 　|　　 <A 
            href="login.jsp" target="_parent">退出系统</A></FONT> </DIV></TD>
          <TD width=7><IMG 
      src="/GpsServer/images/right2.gif"></TD></TR></TBODY></TABLE></CENTER></TD></TR></TBODY></TABLE>
<P align=center>　</P>
<P align=center>　</P>
</body>
</html>
