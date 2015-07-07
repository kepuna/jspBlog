部署说明：
	本人的开发环境：MyEclipse6.5+Tomcat6.0.43+mysql5.5
	所以推荐采用MyEclipse+Tomcat+mysql，最好使用相同版本
	1.首先将blog.sql 导入mysql数据库
	2.项目采用的是DBCP配置数据库连接池，修改src目录下的config.properties里关于数据库连接池的配置
	  将url，username，password改成自己的就可以
	3. 项目用到的jar包我都放在了lib目录下，自己引入就ok
	
	
	