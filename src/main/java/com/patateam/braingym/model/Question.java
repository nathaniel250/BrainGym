package com.patateam.braingym.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "question")
public class Question {
	@Id @GeneratedValue private long qid;
	private long qzid;
	private String question;
	private String answer;
	private String choiceA;
	private String choiceB;
	private String choiceC;
	private String choiceD;
	private String choiceE;
	//private String choiceE;
	
	private String image;

	public void setQid(long qid) {
		this.qid = qid;
	}
	public long getQid() {
		return qid;
	}
	public long getQzid() {
		return qzid;
	}
	public void setQzid(long qzid) {
		this.qzid = qzid;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getQuestion() {
		return question;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getAnswer() {
		return answer;
	}
	public void setChoiceA(String choiceA) {
		this.choiceA = choiceA;
	}
	public String getChoiceA() {
		return choiceA;
	}
	public void setChoiceB(String choiceB) {
		this.choiceB = choiceB;
	}
	public String getChoiceB() {
		return choiceB;
	}
	public void setChoiceC(String choiceC) {
		this.choiceC = choiceC;
	}
	public String getChoiceC() {
		return choiceC;
	}
	public void setChoiceD(String choiceD) {
		this.choiceD = choiceD;
	}
	public String getChoiceD() {
		return choiceD;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	/*public String getChoiceE() {
		return choiceE;
	}
	public void setChoiceE(String choiceE) {
		this.choiceE = choiceE;
	}
	*/
	public String getChoiceE() {
		return choiceE;
	}
	public void setChoiceE(String choiceE) {
		this.choiceE = choiceE;
	}

}
