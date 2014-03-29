package com.patateam.braingym.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "quizhistory")
public class QuizHistory {
	@Id @GeneratedValue private long quizHistoryid;
	private long quizid;
	private String quiztitle;
	private long userid;
	private float grade;
	private String dateCreated;
	
	public long getQuizHistoryid() {
		return quizid;
	}
	public void setQuizHistoryid(long quizHistoryid) {
		this.quizHistoryid = quizHistoryid;
	}
	public long getQuizid() {
		return quizid;
	}
	public void setQuizid(long quizid) {
		this.quizid = quizid;
	}
	public long getUserid() {
		return userid;
	}
	public void setUserid(long userid) {
		this.userid = userid;
	}
	public float getGrade() {
		return grade;
	}
	public void setGrade(float grade) {
		this.grade = grade;
	}
	public String getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}
	public String getQuiztitle() {
		return quiztitle;
	}
	public void setQuiztitle(String quiztitle) {
		this.quiztitle = quiztitle;
	}
	
}
