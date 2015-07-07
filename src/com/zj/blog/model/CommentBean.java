package com.zj.blog.model;

import java.util.Date;

public class CommentBean {

		private Integer id;
		private String username;
		private String content;
		private Date createdTime;
		
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public Date getCreatedTime() {
			return createdTime;
		}
		public void setCreatedTime(Date createdTime) {
			this.createdTime = createdTime;
		}
		
}
