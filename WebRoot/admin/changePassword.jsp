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

    <div class="changePassword">
        <form method="post" action="servlet/UserServlet?type=change&id=<%=user.getId() %>">
            <span>原密码</span> <input name="oldPassword" type="password"  /><br>
            <span>新密码</span><input name="newPassword" type="password"  /><br>
            <span>确认新密码</span><input name="reNewPassword" type="password" /><br>
            <input type="submit" value="提交" />
        </form>
    </div>
</div>


<!--底部区域-->
 <jsp:include page="include_admin_footer.jsp"></jsp:include>
</body>
</html>
