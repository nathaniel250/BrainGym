package com.patateam.braingym.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patateam.braingym.model.Forum;


@Repository
@SuppressWarnings({"unchecked", "rawtypes"})
public class ForumDAO {
	@Autowired private SessionFactory sessionFactory;
	@Transactional
	public void addForum(Forum forum){
		sessionFactory.getCurrentSession().save(forum);
	}
	
	@Transactional
	public void deleteForum(long forumid){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete Forum where forumid = :forumid");
		query.setParameter("forumid", forumid);
		query.executeUpdate();
		
	}
	
	@Transactional
	public void updateForum(Forum forum){
		Forum forumToUpdate = find(forum.getForumid());
		forumToUpdate.setCategoryid(forum.getCategoryid()); 
		forumToUpdate.setTopic(forum.getTopic());
		forumToUpdate.setSubtopic(forum.getSubtopic());
	}
	
	
	@Transactional
	public Forum find(long forumid) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Forum where forumid =:forumid");
		query.setParameter("forumid", forumid);
		List<Forum> forumzes = query.list();
		Forum forum = forumzes.get(0);
		return forum;
	}
	
	@Transactional
	public List<Forum> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List forumzes = session.createQuery("from Forum").list();
		return forumzes;
	}
	
	@Transactional
	public List<Forum> findAll(long categoryid) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Forum where categoryid = :categoryid");
		query.setParameter("categoryid", categoryid);
		List forums = query.list();
		return forums;
	}
}
