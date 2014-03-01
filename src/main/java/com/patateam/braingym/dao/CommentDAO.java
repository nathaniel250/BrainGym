	package com.patateam.braingym.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patateam.braingym.model.Comment;
import com.patateam.braingym.model.Question;
@Repository
@SuppressWarnings({"unchecked", "rawtypes"})
public class CommentDAO {
	@Autowired private SessionFactory sessionFactory;
	   
	  /**
	   * @Transactional annotation below will trigger Spring Hibernate transaction manager to automatically create
	   * a hibernate session. See src/main/webapp/WEB-INF/servlet-context.xml
	   */
	
	@Transactional
	public void addComment(Comment comment){
		sessionFactory.getCurrentSession().save(comment);
	}
	
	@Transactional
	public List<Comment> findAll(long qzid) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Comment where qzid = :qzid");
		query.setParameter("qzid", qzid);
		List<Comment> comments = query.list();
		return comments;
	}
	
	@Transactional
	public List<Comment> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List comments = session.createQuery("from Comment").list();
		return comments;
	}
	
	
		
}

