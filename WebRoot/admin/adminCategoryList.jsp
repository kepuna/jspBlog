<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zj.blog.model.CategoryBean"%>
<%@ include file="_adminBasepath.jsp" %>
<%@ include file="_sessioncheck.jsp" %>


<!DOCTYPE HTML>
<html>
<head>
	<base href="<%=basePath%>">
    <title>管理类别</title>
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
<!----- start-header---->
 <jsp:include page="include_admin_header.jsp"></jsp:include>
<!--博文类别管理-->
  <%
  	List list = (List)request.getAttribute("list");
    CategoryBean cg = null;
  %>
<div class="container adminContainer">
    <div class="content">
    <table class="admin-table">
	    <thead>
	    <tr>
	        <th>分类编号</th>
	        <th>类别名称</th>
	        <th>显示级别</th>
	        <th>操作</th>
	    </tr>
	    </thead>
	    <tbody>
	     <%
    	for(int i=0;i<list.size();i++){
       	cg = (CategoryBean)list.get(i);
    	%>
	    <tr>
	        <td><strong><%=cg.getId() %></strong></td>
	        <td><%=cg.getName() %></td>
	        <td><%=cg.getLevel() %></td>
	        <td><a href="servlet/CategoryServlet?id=<%=cg.getId() %>&type=modify">修改</a>|<a href="servlet/CategoryServlet?id=<%=cg.getId() %>&type=delete" onclick="javascript:return del();">删除</a></td>
	    </tr>
	   <% 
   		 }
   	   %>
	    </tbody>
	</table>   
    </div>
</div>
 
<br>

<!--底部区域-->
 <jsp:include page="include_admin_footer.jsp"></jsp:include>
</body>
</html>
