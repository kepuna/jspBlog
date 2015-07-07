<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zj.blog.model.*" %>
<%@ include file="_adminBasepath.jsp" %>
<%@ include file="_sessioncheck.jsp" %>

<!DOCTYPE HTML>
<html>
<head>
	<base href="<%=basePath%>">
    <title>后台管理</title>
    <meta charset="utf-8">
    <link href="css/reset.css" rel='stylesheet' type='text/css' />
    <link href="css/style.css" rel='stylesheet' type='text/css' />
	<script src="admin/ckeditor/ckeditor.js"></script>
</head>
  
 <body>
 <jsp:include page="include_admin_header.jsp"></jsp:include> 
 <%
  	List list = (List)request.getAttribute("list");
    CategoryBean cg = null;
 %>
  	
 
<div class="container adminContainer addBlog-form"> 
<form method="post" action="servlet/AdminBlogServlet?type=add">
	<span class="addBlog-form-item">文章主题：</span><input name="title" type="text"  /><br>
    <span class="addBlog-form-item">文章概要：</span><input name="titleIntro" type="text" /><br>
    <span class="addBlog-form-item">文章类别：</span>
        <select name="category" id="select">
        <%
        	for(int i=0;i<list.size();i++){
               cg = (CategoryBean)list.get(i);
        %>
        	
  			<option value="<%=cg.getId() %>"><%=cg.getName() %></option>
  		<%
  		} 
  		%>
          
        </select><br>
        <textarea name="content" cols="100" rows="20" id="editor1"></textarea>
        <script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'editor1',{
                extraPlugins : 'font',
                });
        </script>
		<input type="submit"  value="提交" />
        <input type="reset"   value="重置" />
</form>
</div>

<!--底部区域-->
<jsp:include page="include_admin_footer.jsp"></jsp:include>
</body>
</html>
