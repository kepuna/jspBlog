package com.zj.blog.model;

import java.util.Date;

public class BlogBean {
	private int id;
	private String title;
	private String titleIntro;
	private String content;
	private Date createdTime;
	private String name;
	private int categoryId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getTitleIntro() {
		return titleIntro;
	}
	public void setTitleIntro(String titleIntro) {
		this.titleIntro = titleIntro;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
