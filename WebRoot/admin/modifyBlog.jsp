<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zj.blog.model.*" %>
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
	<script src="admin/ckeditor/ckeditor.js"></script>
</head>
  
 <body>
  <jsp:include page="include_admin_header.jsp"></jsp:include>

 <%
 	BlogBean blog = (BlogBean)request.getAttribute("blog");
  %>
 
 <div class="container adminContainer">
<p>&quot;请修改您的博文内容</p>
<form id="form1" name="form1" method="post" action="servlet/AdminBlogServlet?type=postModify">
	<input type="hidden" name="id" value="<%=blog.getId() %>" /> 
  <table width="629" border="0">
    <tr>
      <td width="76">主题：</td>
      <td width="543"><label>
        <input name="title" type="text" id="title" size="60" value="<%=blog.getTitle() %>"/>
      </label></td>
    </tr>
    <tr>
      <td width="76">内容简介：</td>
      <td width="543"><label>
        <input name="titleIntro" type="text" id="title" size="60" value="<%=blog.getTitleIntro() %>"/>
      </label></td>
    </tr>
    <tr>
      <td>类别：</td>
      <td><label>
        <select name="category" id="select">
        <%
        List categoryList = (List)request.getAttribute("categoryList");
        int categoryId = blog.getCategoryId();
        for(int i=0;i<categoryList.size();i++){
			CategoryBean cb = (CategoryBean)categoryList.get(i);
			if(cb.getId().equals(categoryId)){
        %>
          <option value="<%=cb.getId() %>" selected><%=cb.getName() %></option>
         <%
        	 }else{
         %>
        	 <option value="<%=cb.getId() %>"><%=cb.getName() %></option>
         <%
         	}
         }
          %>
        </select>
      </label></td>
    </tr>
    <tr>
      <td>内容：</td>
      <td><label>
        <textarea name="content" cols="100" rows="20" id="editor1">
        	<%=blog.getContent() %>
        </textarea>
        <script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'editor1',{
                extraPlugins : 'font',
                });
        </script>
      </label></td>
    </tr>
    <tr>
      <td><label>
        <input type="reset" name="button" id="button" value="重置" />
      </label></td>
      <td><label>
        <input type="submit" name="button2" id="button2" value="提交" />
      </label></td>
    </tr>
    
  </table>
</form>
</div>

<!--底部区域-->
 <jsp:include page="include_admin_footer.jsp"></jsp:include>

  </body>
</html>
