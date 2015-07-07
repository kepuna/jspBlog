<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zj.blog.model.*" %>
<header class="top-header">
		<div class="header-container fl">
			<nav class="top-nav">
			<ul class="top-nav">
				<li class="active"><a href="#home">首页</a></li>
				<li><a href="#work">作品</a></li>
				<li><a href="#contact">关于</a></li>
			</ul>
			</nav>
		</div>
		<div class="login fr">
		<%
			UserBean user = (UserBean) session.getAttribute("user");
			if (user == null) {
		%>
			<a href="javascript:void(0);" class="login-btn" id="toggle-login">
                <span>登录</span>
             </a>
			<div id="login">
				<div id="triangle"></div>
				<h1>
					登录
				</h1>
				<form method="post" action="servlet/UserServlet?type=login">
					<input type="text" name="username" placeholder="用户名" />
					<input type="password" name="password" placeholder="密码" />
					<input type="submit"  value="登录" />
					<input type="reset" value="重置" />
				</form>
			</div>
		<%
			} else {
		%>
		<!-- <a href="servlet/AdminBlogServlet?type=admin"><span class="admin-btn">进入后台</span></a> --> 
		<a href="servlet/AdminBlogServlet?type=admin"><span class="admin-btn">进入后台</span></a>
		 <%
		 	}
		 %>
		 
		</div>
</header>
