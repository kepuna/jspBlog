package com.zj.blog.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

public class BlogBeanBO {
	
	QueryRunner qr = DBhelper.getQueryRunner();
	
	// 添加博客的方法
	public int add(String categoryId,String title,String titleIntro,String content){
		System.out.println("BlogBO里执行sql插入时候title是"+title);
		System.out.println("BlogBO里执行sql插入时候titleIntro"+titleIntro);
		System.out.println("BlogBO里执行sql插入时候categoryId"+categoryId);
		String sql = "insert into blog(categoryId,title,titleIntro,content,createdtime) values (?,?,?,?,now())";
		//为SQL语句中的？设定参数，需要定义一个数组,数组中的值是上面getParameter接受过来的指
		String params[]={categoryId,title,titleIntro,content};
		int result=0;
		// 调用QueryRunner的update方法，完成SQL的执行
		try {
			result = qr.update(sql,params);
			System.out.println("当前result是"+result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 删除博文
	public void delete(int id){
		String sql = "delete from blog where id="+id;
		try {
			qr.update(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public BlogBean modify(int id){
		String sql = "select id,title,titleIntro,content,categoryId from blog where id ="+id;
		// 执行查询语句,读出来的是一组数据，所以放在List
		List list = null;
		try {
			list = (List) qr.query(sql, new BeanListHandler(BlogBean.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 我们只需要过去一条记录
		BlogBean blog = (BlogBean) list.get(0);
		return blog;
	}
	public int postModify(String title,String titleIntro,String content,String categoryId,String id){
		String sql = "update blog set title=?,titleIntro=?,content=?,categoryId=? where id =?";
		String params[]={title,titleIntro,content,categoryId,id};
		int result = 0;
		try {
			result = qr.update(sql,params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	//show a blog
	public List getBlog(String id){
		String sql = "(select * from blog where id < "+id+" order by id desc limit 1)"+"union"+   
						"(select * from blog where id >= "+id+" order by id limit 2)";
		List list = null;
		try {
			list = (List) qr.query(sql, new BeanListHandler(BlogBean.class));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	// get comments
	public List getComments(String id){
		String sql = "select id,username,content,createdtime from comment where blog_id =" +id+" order by id desc";
		// 一篇博客有多条评论，所以放在一个list里
		List commentList = null;
		try {
			commentList = (List)qr.query(sql,new BeanListHandler(CommentBean.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return commentList;
		
	}
	/*
	 * int pageSize :每页显示几条记录
	 * 博客列表分页的实现返回共有多少页
	 * 
	*/
	public long getPageCount(long pageSize){
	
		long pageCount = 0;//定义一共有多少页
		long rowCount = 0; //定义一共有多少条记录
		String sql= "select count(*) from blog";
		List blogList = null;
		try {
			rowCount = (Long)qr.query(sql,new ScalarHandler(1) );
			if(rowCount%pageSize==0){
				pageCount = rowCount / pageSize;
			}else{
				pageCount = (rowCount/pageSize)+1;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return pageCount;//返回共有多少页
	}
	
	
	/***
	 * 分页博客
	 * int pageNow：显示第几页
	 * ArrayList ：ArrayList里面放的就是一个个BlogBean，就是要显示货物的集合
	 * 
	*/
	public List getBlogByPage(int pageSize,int pageNow){
		List blogList = null;
		String sql = "select categoryId,b.id,title,titleIntro,createdtime,name from blog as b,category as c where b.categoryId = c.id order by b.id desc limit "+((pageNow-1)*pageSize) +"," +pageSize;
		try {
			blogList = (List)qr.query(sql, new BeanListHandler(BlogBean.class));
		}catch(SQLException e){
			e.printStackTrace();
		}
		return blogList;
	}
	//根据类别 显示总页数
	public long getCountByCategory(String categoryId,long pageSize){
		long pageCount = 0;//定义一共有多少页
		long rowCount = 0; //定义一共有多少条记录
		String sql= "select count(*) from blog where categoryId = "+categoryId;
		List blogList = null;
		try {
			rowCount = (Long)qr.query(sql,new ScalarHandler(1) );
			if(rowCount%pageSize==0){
				pageCount = rowCount / pageSize;
			}else{
				pageCount = (rowCount/pageSize)+1;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return pageCount;//返回共有多少页
	}
	// 按类别显示文章列表
	public List displayAsCategory(String categoryId,int pageSize,int pageNow){
		List blogList = null;
		String sql = "select categoryId,b.id,title,titleIntro,createdtime,name from blog as b,category as c where c.id = b.categoryId and c.id = "+categoryId+" order by b.id desc limit "+((pageNow-1)*pageSize) +"," +pageSize;
		try {
			blogList = (List)qr.query(sql, new BeanListHandler(BlogBean.class));
		}catch(SQLException e){
			e.printStackTrace();
		}
		return blogList;
	}
	//获取最小id
	public int minId(){
		String sql = "select min(id) from blog";
		int minid = 0;
		try {
			Integer result = (Integer)qr.query(sql,new ScalarHandler(1));
			minid =  result.intValue();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return minid;
	
	}
	
}
