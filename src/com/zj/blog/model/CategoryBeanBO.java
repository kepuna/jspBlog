package com.zj.blog.model;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class CategoryBeanBO {
	QueryRunner qr = DBhelper.getQueryRunner();
	
	// 添加分类的方法
	public int add(String categoryName, String level ){
		
		String sql = "insert into category (name,level) values (?,?)";
		String params[] = { categoryName, level };
		int result = 0;
		try {
			result = qr.update(sql, params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	// 删除分类的方法
	public void delete(String id){
		String sql = "delete from category where id="+id;
		try {
			qr.update(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// 修改分类的方法
	public CategoryBean modify(String id){
		String sql = "select id,name,level from category where id="+id;
		CategoryBean cg = null;
		List list = null;
		try {
			list = (List)qr.query(sql,new BeanListHandler(CategoryBean.class));
			cg = (CategoryBean)list.get(0);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cg;
	}
	// 提交修改分类的方法
	public void postModify(String categoryName, String level,String id){
		try {
			String sql = "update category set name=?,level=? where id=?";
			String params[] = { categoryName, level,id };
			qr.update(sql, params);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//显示所有分类列表的方法
	public List display(){
		String sql="select id,name,level from category order by level desc,id desc";
		List list = null;
		try {
			list = (List)qr.query(sql, new BeanListHandler(CategoryBean.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
