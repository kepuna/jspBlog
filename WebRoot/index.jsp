<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zj.blog.model.*" %>
<%@ include file="_basepath.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>显示博文列表</title>
    
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
 	request.getRequestDispatcher("servlet/ShowBlogServlet?type=blogList").forward(request,response);
  %>
 </body>
</html>
