<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zj.blog.model.CommentBean"%>
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
<!--评论管理内容-->
 <%
 	List commentList = (List)request.getAttribute("commentList");
 	CommentBean cb = null;
 %>
 <div class="container adminContainer">
    <div class="content">
    <table class="admin-table">
    <thead>
    <tr>
        <th>编号</th>
        <th>评论人</th>
        <th>内容</th>
        <th>评论时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
   <%
	for(int i=0;i<commentList.size();i++){
	 cb = (CommentBean)commentList.get(i);
  %>
    <tr>
        <td><strong><%=cb.getId() %></strong></td>
        <td><%=cb.getUsername() %></td>
	    <td><%=cb.getContent() %></td>
	    <td><%=cb.getCreatedTime() %></td>
	    <td><a href="servlet/CommentServlet?type=delete&id=<%=cb.getId() %>" onclick="javascript: return del();">删除</a></td>
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
