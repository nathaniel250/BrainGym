package com.patateam.braingym.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "forumcomment")

public class ForumComment {
	@Id @GeneratedValue private long forumCommentid;
	private long forumid;
	private String forumComment;
	private String dateCreated;
	
	public long getForumCommentid() {
		return forumCommentid;
	}
	public void setForumCommentid(long forumCommentid) {
		this.forumCommentid = forumCommentid;
	}
	public long getForumid() {
		return forumid;
	}
	public void setForumid(long forumid) {
		this.forumid = forumid;
	}
	public String getForumComment() {
		return forumComment;
	}
	public void setForumComment(String forumComment) {
		this.forumComment = forumComment;
	}
	public String getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}
}
