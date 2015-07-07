package com.zj.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.zj.blog.model.CommentBean;
import com.zj.blog.model.CommentBeanBO;
import com.zj.blog.model.DBhelper;
import com.zj.blog.model.UserBean;

public class CommentServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		String blogId = request.getParameter("blogId");
		CommentBeanBO cb = new CommentBeanBO();
		//·ÀÖ¹·Ç·¨µÇÂ¼
		HttpSession session = request.getSession();
		UserBean user = (UserBean)session.getAttribute("user");
		if(user == null){
			request.getRequestDispatcher("/admin/login.jsp").forward(request,response);
		}else{
			// ·ÀÖ¹±¨´í¿ØÖÆÖ¡
			if(type == null){
				type = "";
			}if(type.equals("display")){
				List commentList = cb.display();
				request.setAttribute("commentList", commentList);
				request.getRequestDispatcher("/admin/adminCommentList.jsp").forward(request, response);
			}else if(type.equals("delete")){
				cb.delete(id);
				request.getRequestDispatcher("/servlet/CommentServlet?type=display").forward(request, response);
			}

		}
		
		
	}
	
}
