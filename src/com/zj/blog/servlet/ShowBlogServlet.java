package com.zj.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.zj.blog.model.BlogBean;
import com.zj.blog.model.BlogBeanBO;
import com.zj.blog.model.CategoryBeanBO;
import com.zj.blog.model.CommentBeanBO;
import com.zj.blog.model.DBhelper;
import com.zj.blog.model.UserBean;

public class ShowBlogServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 防止缓存
		response.setContentType("text/html");  
        response.setHeader("Cache-Control", "no-store");  
        response.setHeader("Pragma", "no-cache");  
        response.setDateHeader("Expires", 0);
        
		request.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String titleIntro = request.getParameter("titleIntro");
		String content = request.getParameter("content");
		String categoryId = request.getParameter("category");
		
		String name = request.getParameter("name");
		String commentContent = request.getParameter("commentContent");
		String blogId = request.getParameter("blogId");
		BlogBeanBO blogBO = new BlogBeanBO();
		BlogBean currentBlog,prevBlog,nextBlog;
		CommentBeanBO cbb = new CommentBeanBO();
		CategoryBeanBO categoryBO = new CategoryBeanBO();
		String message = "";
		int result = 0;
		int pageSize = 8;
		int pageNow = 1;

		if (type.equals("blog")) {
			List list = null;
			list = blogBO.getBlog(blogId);
			Iterator  iterator = list.iterator();
			prevBlog = null;
			currentBlog = null;
			nextBlog = null;
			if(iterator.hasNext()){
				prevBlog = (BlogBean)iterator.next();
			}
			if(iterator.hasNext()){
				// 为了实现上一篇是第一篇的情况
				currentBlog = (BlogBean)iterator.next();
				int minId = blogBO.minId();
				if(list.size() == 2 && prevBlog.getId() == minId){
					nextBlog = currentBlog;
					currentBlog = prevBlog;
					prevBlog = null;
				}
			}
			if(iterator.hasNext()){nextBlog = (BlogBean)iterator.next();}
			
			List commentList = blogBO.getComments(blogId);
			String commentSize = Integer.toString(commentList.size());
			request.setAttribute("commentSize", commentSize);
			request.setAttribute("prevBlog", prevBlog);
			request.setAttribute("currentBlog", currentBlog);
			request.setAttribute("nextBlog", nextBlog);
			request.setAttribute("commentList", commentList);
			request.getRequestDispatcher("/displayBlog.jsp").forward(request,response);
		} else if (type.equals("blogList")) {
			long pageCount = blogBO.getPageCount(pageSize);
			List blogList = blogBO.getBlogByPage(pageSize,pageNow);
			List categoryList = categoryBO.display();
			request.setAttribute("pageCount", Long.toString(pageCount));
			request.setAttribute("blogList", blogList);
			request.setAttribute("categoryList", categoryList);
			request.getRequestDispatcher("/displayBlogList.jsp").forward(request, response);
		}else if(type.equals("page")){// 点击分页显示文章列表
			long pageCount = blogBO.getPageCount(pageSize);
			String pageNowStr = request.getParameter("pageNow");
			if(pageNowStr != null){
				pageNow = Integer.valueOf(pageNowStr).intValue();//如果不等于空，这里点哪一页就显示哪一页
			}		
			List blogList = (List)blogBO.getBlogByPage(pageSize, pageNow);
			BlogBean blog = null;
			String jsonStart = "[";
			String jsonEnd = "]";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	     	SimpleDateFormat sdf2 = new  SimpleDateFormat("HH:mm:ss");
			for(int i=0;i<blogList.size();i++){
				blog = (BlogBean)blogList.get(i);
		     	String date = sdf.format(blog.getCreatedTime());
		     	String time = sdf2.format(blog.getCreatedTime());
				if(i == blogList.size()-1){
					String json = "{\"blogId\":\""+blog.getId()+"\",\"blogTitle\":\""+blog.getTitle()+"\",\"blogTitleIntro\":\""+blog.getTitleIntro()+"\",\"category\":\""+blog.getName()+"\",\"time\":\""+time+"\",\"date\":\""+date+"\"}";
					jsonStart += json;
				}else{
					
					String json = "{\"blogId\":\""+blog.getId()+"\",\"blogTitle\":\""+blog.getTitle()+"\",\"blogTitleIntro\":\""+blog.getTitleIntro()+"\",\"category\":\""+blog.getName()+"\",\"time\":\""+time+"\",\"date\":\""+date+"\"},";
					jsonStart += json;
				}	
			}
			String jsonStr = jsonStart + jsonEnd;
			response.setCharacterEncoding("utf-8");
		    response.getWriter().write(jsonStr);
					
		}else if(type.equals("comment")){
			if(name==null || name.equals("")){
				name="匿名";
			}
			cbb.add(name, commentContent, blogId);
			request.getRequestDispatcher("/servlet/ShowBlogServlet?id="+blogId+"&type=blog").forward(request, response);
		}else if(type.equals("displayAsCategory")){//根据点击的类别显示文章列表
			String getCategoryId = request.getParameter("getCategoryId");
			long pageCount = blogBO.getCountByCategory(getCategoryId, pageSize);
			List blogList = blogBO.displayAsCategory(getCategoryId, pageSize, 1);
			List categoryList = categoryBO.display();
			request.setAttribute("pageCount", Long.toString(pageCount));
			request.setAttribute("blogList", blogList);
			request.setAttribute("categoryList", categoryList);
			request.getRequestDispatcher("/displayBlogList.jsp").forward(request, response);
			
		}
	}

}
