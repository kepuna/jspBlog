<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="_sessioncheck.jsp" %>
<%@ include file="_adminBasepath.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<base href="<%=basePath%>">
    <title>后台管理</title>
    <meta charset="utf-8">
    <link href="css/reset.css" rel='stylesheet' type='text/css' />
    <link href="css/style.css" rel='stylesheet' type='text/css' />
</head>
<body>
<jsp:include page="include_admin_header.jsp"></jsp:include>

<div class="container"><%=request.getAttribute("message")%><br><div>    
    <!--底部区域-->
 <jsp:include page="include_admin_footer.jsp"></jsp:include>
  </body>
</html>
