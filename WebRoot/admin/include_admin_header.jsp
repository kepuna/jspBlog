<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="_sessioncheck.jsp" %>
<%@ page import="com.zj.blog.model.*" %>
<header class="admin-header">
	<nav class="top-nav">
	<ul class="top-nav">
		<li class="active">
			<a href="#home">Home</a>
		</li>
		<li>
			<a href="#work">Work</a>
		</li>
		<li>
			<a href="#contact">Contact</a>
		</li>
	</ul>
	</nav>
</header>
<nav class="admin-nav">
    <ul class="admin-nav">
        <li class="active"><a href="servlet/AdminBlogServlet?type=admin">文章管理</a></li>
        <li><a href="admin/addCategory.jsp" >添加类别</a></li>
        <li><a href="servlet/CategoryServlet?type=display" >类别管理</a></li>
        <li><a href="servlet/CommentServlet?type=display" >评论管理</a></li>
        <li><a href="admin/changePassword.jsp">修改密码</a></li>
        <li class="add-blog-button"><a href="servlet/AdminBlogServlet?type=preAdd" >发表博文</a></li>
        <li class="add-blog-button"><a href="servlet/UserServlet?type=logOut" >退出登录</a></li>
    </ul>
</nav>