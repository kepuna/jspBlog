package com.zj.blog.model;
import java.io.IOException;

import java.io.InputStream;

import java.sql.Connection;

import java.sql.ResultSet;

import java.sql.SQLException;

import java.sql.Statement;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;

public class JdbcUtils2 {

	private JdbcUtils2() {}

	// 定义BasicDataSource的父类接口的形式，获得ds的参数。
	private static DataSource ds;

	static {

		try {

			InputStream in = JdbcUtils2.class.getClassLoader().getResourceAsStream("config.properties");

			Properties prop = new Properties();

			prop.load(in);// 通过流将配置项加载进来。

			// 通过工厂类读取
			ds = BasicDataSourceFactory.createDataSource(prop);

		} catch (Exception e) {throw new ExceptionInInitializerError();}

	}
	// 获得连接池
	public static DataSource getDataSource() {
		return ds;
	}
}