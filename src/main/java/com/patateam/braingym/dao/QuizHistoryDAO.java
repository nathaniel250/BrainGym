package com.patateam.braingym.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patateam.braingym.model.QuizHistory;

@Repository
@SuppressWarnings({"unchecked", "rawtypes"})
public class QuizHistoryDAO {
	@Autowired private SessionFactory sessionFactory;
	
	@Transactional
	public void addQuizHistory(QuizHistory quizHistory){
		sessionFactory.getCurrentSession().save(quizHistory);
	}
	
	@Transactional
	public List<QuizHistory> findAll(long userid) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from QuizHistory where userid = :userid");
		query.setParameter("userid", userid);
		List<QuizHistory> qh = query.list();
		return qh;
	}
}
