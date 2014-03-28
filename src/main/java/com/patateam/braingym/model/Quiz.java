package com.patateam.braingym.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "quiz")
public class Quiz {
	@Id @GeneratedValue private long qzid;
	//private String category;
	//private String tag;
	private long catid;
	private String title;
	
	public long getQzid() {
		return qzid;
	}
	public void setQzid(long qzid) {
		this.qzid = qzid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public long getCatid() {
		return catid;
	}
	public void setCatid(long catid) {
		this.catid = catid;
	}
	
}
