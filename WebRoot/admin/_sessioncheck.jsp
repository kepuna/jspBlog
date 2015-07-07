<%@ page  import="com.zj.blog.model.*"%>

<%
	UserBean user = (UserBean)session.getAttribute("user");
  	if(user == null){
  			request.getRequestDispatcher("/admin/login.jsp").forward(request,response);
  	}	
 %>
