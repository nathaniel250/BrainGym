package com.patateam.braingym.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class Category {
	@Id @GeneratedValue private long categoryid;
	private String category;
	
	public void setCategoryid(long categoryid) {
		this.categoryid = categoryid;
	}
	public long getCategoryid() {
		return categoryid;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

}
