package com.patateam.braingym.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patateam.braingym.model.ForumComment;

@Repository
@SuppressWarnings({"unchecked", "rawtypes"})
public class ForumCommentDAO {
	@Autowired private SessionFactory sessionFactory;
	
	@Transactional
	public void addForumComment(ForumComment forumComment){
		sessionFactory.getCurrentSession().save(forumComment);
	}
	
	@Transactional
	public void updateForumComment(ForumComment forumComment){
		ForumComment forumCommentToUpdate = find(forumComment.getForumCommentid());
		forumCommentToUpdate.setForumComment(forumComment.getForumComment()); 
	}
	
	@Transactional
	public void deleteForumComment(long forumCommentid){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete ForumComment where forumCommentid = :forumCommentid");
		query.setParameter("forumCommentid", forumCommentid);
		query.executeUpdate();
	}
	
	@Transactional
	public ForumComment find(long forumCommentid) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from ForumComment where forumCommentid =:forumCommentid");
		query.setParameter("forumCommentid", forumCommentid);
		List<ForumComment> forumComments = query.list();
		ForumComment forumComment = forumComments.get(0);
		return forumComment;
	}
	 
	@Transactional
	public List<ForumComment> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List forumComments = session.createQuery("from ForumComment").list();
		return forumComments;
	}
	
	@Transactional
	public List<ForumComment> findAll(long forumid) {
		//long qzid = qz.getQzid();
		Session session = sessionFactory.getCurrentSession();
		 Query query = session.createQuery("from ForumComment where forumid = :forumid");
		 query.setParameter("forumid", forumid);
		 List forumComments = query.list();
		return forumComments;
	}
}
