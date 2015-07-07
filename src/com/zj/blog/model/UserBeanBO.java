package com.zj.blog.model;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class UserBeanBO {

	QueryRunner qr = DBhelper.getQueryRunner();

	public List login(String userName, String password) {

		String sql = "select * from users where username=? and password=md5(?)";
		String params[] = { userName, password };

		List list = null;
		try {
			list = (List) qr.query(sql, params,new BeanListHandler(UserBean.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//ÐÞ¸ÄÃÜÂë
	public int changePassword(String newPassword,String id){
		String sql = "update users set password=? where id=?";
		String params[] = {newPassword,id};
		int result = 0;
		try {
			result = qr.update(sql,params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
