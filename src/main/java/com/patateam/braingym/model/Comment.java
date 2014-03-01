package com.patateam.braingym.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "comment")
public class Comment {
	@Id @GeneratedValue private long comid;
	private long qzid;
	private String comment;
	
	public void setCommentid(long comid) {
		this.comid = comid;
	}
	public long getCommentid() {
		return comid;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getComment() {
		return comment;
	}
	public long getQzid() {
		return qzid;
	}
	public void setQzid(long qzid) {
		this.qzid = qzid;
	}

}
