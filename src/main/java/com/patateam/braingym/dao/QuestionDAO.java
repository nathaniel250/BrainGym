package com.patateam.braingym.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patateam.braingym.model.Question;

@Repository
@SuppressWarnings({"unchecked", "rawtypes"})
public class QuestionDAO {
	@Autowired private SessionFactory sessionFactory;
	   
	  /**
	   * @Transactional annotation below will trigger Spring Hibernate transaction manager to automatically create
	   * a hibernate session. See src/main/webapp/WEB-INF/servlet-context.xml
	   */
	
	@Transactional
	public void addQuestion(Question question){
		sessionFactory.getCurrentSession().save(question);
	}
	 
	@Transactional
	public List<Question> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List questions = session.createQuery("from Question").list();
		return questions;
	}
	
	@Transactional
	public List<Question> findAll(long qzid) {
		//long qzid = qz.getQzid();
		Session session = sessionFactory.getCurrentSession();
		 Query query = session.createQuery("from Question where qzid = :quizid");
		 query.setParameter("quizid", qzid);
		 List questions = query.list();
		return questions;
	}
		
}
