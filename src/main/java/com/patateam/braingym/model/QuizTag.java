package com.patateam.braingym.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "quiztag")
public class QuizTag {
	@Id @GeneratedValue private long qztagid;
	private long tagid;
	private long qzid;
	public long getTagid() {
		return tagid;
	}
	public void setTagid(long tagid) {
		this.tagid = tagid;
	}
	public long getQzid() {
		return qzid;
	}
	public void setQzid(long qzid) {
		this.qzid = qzid;
	}
}
