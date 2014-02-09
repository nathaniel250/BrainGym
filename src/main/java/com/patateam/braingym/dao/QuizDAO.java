package com.patateam.braingym.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patateam.braingym.model.Quiz;
import com.patateam.braingym.model.Tag;

@Repository
@SuppressWarnings({"unchecked", "rawtypes"})
public class QuizDAO {
	
	@Autowired private SessionFactory sessionFactory;
	
	@Transactional
	public void addQuiz(Quiz quiz){
		sessionFactory.getCurrentSession().save(quiz);
	}
	
	@Transactional
	public List<Quiz> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List quizzes = session.createQuery("from Quiz").list();
		return quizzes;
	}
	
	@Transactional
	public List<Quiz> findAll(long catid) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Quiz where catid = :catid");
		query.setParameter("catid", catid);
		List quizzes = query.list();
		return quizzes;
	}
	
	@Transactional
	public List<Quiz> findAll(String tag) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Tag where tag = :tag");
		query.setParameter("tag", tag);
		List<Tag> tags = query.list();
		List quizzes = new ArrayList();
		for(Tag tagvalue:tags){
			Query query2 = session.createQuery("from Quiz where qzid = :quizid");
			query2.setParameter("quizid", tagvalue.getQzid());
			List quiz = query2.list();
			quizzes.add(quiz.get(0));
		}
		return quizzes;
	}
	@Transactional
	public List<Quiz> findAll(long catid, String tag) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Quiz where catid = :catid");
		query.setParameter("catid", catid);
		List<Quiz> quizzes = query.list();
		
		Query query1 = session.createQuery("from Tag where tag = :tag");
		query1.setParameter("tag", tag);
		List<Tag> tags = query1.list();
		List<Quiz> quizzes2 = new ArrayList();
		for(Tag tagvalue:tags){
			Query query2 = session.createQuery("from Quiz where qzid = :quizid");
			query2.setParameter("quizid", tagvalue.getQzid());
			List quiz = query2.list();
			quizzes2.add((Quiz) quiz.get(0));
		}
		
		List quiz1x2 = new ArrayList();
		for (Quiz quiz : quizzes) {
            if(quizzes2.contains(quiz)) {
                quiz1x2.add(quiz);
            }
        }
		
		return quiz1x2;
	}
	
}
