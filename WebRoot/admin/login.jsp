<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="_adminBasepath.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%
  	String message = (String)request.getAttribute("message");
  	if(message != null){
  		out.print(message);
  	}
   %>
<p>用户登录</p>
<form id="form1" name="form1" method="post" action="servlet/UserServlet?type=login">
  <table width="331" height="84" border="1">
    <tr>
      <td>用户名：</td>
      <td><label>
        <input type="text" name="username" id="username" />
      </label></td>
    </tr>
    <tr>
      <td>密码：</td>
      <td><label>
        <input type="password" name="password" id="password" />
      </label></td>
    </tr>
    <tr>
      <td><label>
        <input type="submit" name="button" id="button" value="提交" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
<p>&nbsp; </p>
</body>
</html>
