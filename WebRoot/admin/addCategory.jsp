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
 
<div class="container adminContainer"> 
	<div class="add-category">
	<form class="add-category-form" method="post" action="servlet/CategoryServlet?type=add">
	 <!-- <input type="hidden" name="type" value="add" />  --> 
		<span>分类名称</span><input type="text" name="categoryName" placeholder="请输入分类名称..."/><br>
	    <span>显示级别</span><input name="level" type="text" placeholder="请输入分类的级别..."/><br>
	    <input type="submit" value="提交"/>
	</form>
	
	
	</div>
</div>

<!--底部区域-->
<jsp:include page="include_admin_footer.jsp"></jsp:include>
</body>
</html>