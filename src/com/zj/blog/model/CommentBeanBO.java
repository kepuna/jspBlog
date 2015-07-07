package com.zj.blog.model;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class CommentBeanBO {

	QueryRunner qr = DBhelper.getQueryRunner();
	
	// Ìí¼ÓÆÀÂÛ
	public void add(String name,String content,String blogId){
		
		String sql = "insert into comment(username,content,blog_id,createdtime) values(?,?,?,now())";
		String params[] ={name,content,blogId};
		try {
			qr.update(sql,params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public List display(){
	
		String sql = "select id,username,content,createdtime from comment order by id desc";
		List commentList = null;
		try {
			commentList = (List)qr.query(sql,new BeanListHandler(CommentBean.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return commentList;
	}
	// É¾³ýÆÀÂÛ
	public void delete(String id){
		String sql = "delete from comment where id="+id;
		try {
			qr.update(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
