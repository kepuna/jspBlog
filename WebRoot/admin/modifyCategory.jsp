<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zj.blog.model.CategoryBean"%>
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
 <%
 	CategoryBean cg =(CategoryBean)request.getAttribute("category");
 %>
 
 <div class="container adminContainer">
<p>修改博客的分类</p>
<form id="form1" name="form1" method="post" action="servlet/CategoryServlet?type=postModify">
  <input type="hidden" name="id" value="<%=cg.getId() %>" /> 
  <table width="336" border="0">
    <tr>
      <td>分类的名称：</td>
      <td><label>
        <input type="text" name="categoryName" id="name" value="<%=cg.getName() %>" />
      </label></td>
    </tr>
    <tr>
      <td>分类的显示顺序</td>
      <td><label>
        <input name="level" type="text" id="level" size="2" maxlength="2" value="<%=cg.getLevel() %>"/>
      </label></td>
    </tr>
    <tr>
      <td><label>
        <input type="submit" name="button" id="button" value="提交" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
<p><a href="servlet/CategoryServlet?type=display">显示分类列表</a></p>
</div>

<!--底部区域-->
 <jsp:include page="include_admin_footer.jsp"></jsp:include>

</body>
</html>
