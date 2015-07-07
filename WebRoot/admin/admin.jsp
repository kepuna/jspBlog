<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
     <script type="text/javascript">
 	function del(){
 		var msg="确认要删除吗?";
 		if(confirm(msg) == true){
 			return true;
 		}else{
 			return false;
 		}
 	}
 </script>
</head>
<body>
 <jsp:include page="include_admin_header.jsp"></jsp:include>
<!--博文管理内容-->

<div class="container adminContainer">
    <div class="content">
    	<table class="admin-table">
   			 <thead>
			    <tr>
			        <th>文章号</th>
			        <th>文章主题</th>
			        <th>所属类别</th>
			        <th>操作</th>
			    </tr>
			 </thead>
			 <tbody>
<%	List list = (List)request.getAttribute("blogList");
	String s_pageCount = (String)request.getAttribute("pageCount");  
    int pageCount = Integer.parseInt(s_pageCount);
  	BlogBean blog = null;
   	for(int i=0;i<list.size();i++){
   	blog = (BlogBean)list.get(i);
 %>
			    <tr>
			        <td><strong><%=blog.getId() %></strong></td>
			        <td><%=blog.getTitle() %></td>
			        <td><%=blog.getName() %></td>
			        <td><a href="servlet/AdminBlogServlet?id=<%=blog.getId() %>&type=modify">修改</a>|<a href="servlet/AdminBlogServlet?id=<%=blog.getId() %>&type=delete" onclick="javascript:return del();">删除</a></td>
			    </tr>
  <% 
    }
  %>
			 
   			 </tbody>
		</table>
    </div>
</div>
<br>
<div class="page">
   	<a href="#">首页</a>
   	<a href="">&lt;</a>
   	 <%
    	for(int i=1;i<=pageCount;i++){
    		//分页超链接
    %>
    		<a href="servlet/AdminBlogServlet?type=page&pageNow=<%=i%>"><%= i %></a>
    <%
    	}	
     %>
      <a href="">...</a>
      <a href="">&gt;</a>
      <a href="">尾页</a>
  </div><!--分页-->

<!--底部区域-->
 <jsp:include page="include_admin_footer.jsp"></jsp:include>
</body>
</html>
