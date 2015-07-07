package com.zj.blog.model;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
/*这个类用来获取数据源，进行数据库连接，并且最后返回一个QueryRunner对象*/
public class DBhelper {
	public static QueryRunner getQueryRunner(){
		// 数据源对象可以理解为数据库连接池的管理着，通过它可以获取数据库的链接 
		DataSource ds = null;
		try {
			ds = (DataSource) JdbcUtils2.getDataSource();//如果只写这句，程序将一直等待执行。
		} catch (Exception e) {
			e.printStackTrace();
		}
		// DButils中的核心类，生成对象时传递数据源对象ds
		QueryRunner qr = new QueryRunner(ds);
		return qr;
	}
}
