package com.patateam.braingym.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patateam.braingym.controller.QuizController;
import com.patateam.braingym.model.Quiz;
import com.patateam.braingym.model.QuizTag;
import com.patateam.braingym.model.Tag;

@Repository
@SuppressWarnings({"unchecked", "rawtypes"})
public class QuizDAO {
	
	@Autowired private SessionFactory sessionFactory;
	private static final Logger logger = LoggerFactory.getLogger(QuizController.class);
	
	@Transactional
	public void addQuiz(Quiz quiz){
		sessionFactory.getCurrentSession().save(quiz);
	}
	
	@Transactional
	public void deleteQuiz(long qzid){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete Quiz where qzid = :qzid");
		query.setParameter("qzid", qzid);
		query.executeUpdate();
		
	}
	
	@Transactional
	public void updateQuiz(Quiz quiz){
		Quiz quizToUpdate = find(quiz.getQzid());
		quizToUpdate.setCatid(quiz.getCatid()); 
		quizToUpdate.setTitle(quiz.getTitle());
		
	}
	
	
	@Transactional
	public Quiz find(long qzid) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Quiz where qzid =:qzid");
		query.setParameter("qzid", qzid);
		List<Quiz> quizzes = query.list();
		Quiz quiz = quizzes.get(0);
		return quiz;
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
		String tagvalues[] = tag.split(",");
		int i = 0;
		List<Quiz> quizzes = new ArrayList<Quiz>();
		for(i=0;i<tagvalues.length;i++){
			Query query = session.createQuery("from Tag where tag = :tag");
			query.setParameter("tag", tagvalues[i]);
			List<Tag> tags = query.list();
			if(!tags.isEmpty()){
				Tag tagOld = tags.get(0);
				//logger.info("POTEK {}",tagOld.getTagid());
				Query query2 = session.createQuery("from QuizTag where tagid = :tagid");
				query2.setParameter("tagid", tagOld.getTagid());
				List<QuizTag> qztags = query2.list();
				for(QuizTag qztag: qztags){
					Query query3 = session.createQuery("from Quiz where qzid = :qzid");
					query3.setParameter("qzid", qztag.getQzid());
					quizzes.addAll(query3.list());
				}
			}
			
		}
		
		return quizzes;
	}
	@Transactional
	public List<Quiz> findAll(long catid, String tag) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Quiz where catid = :catid");
		query.setParameter("catid", catid);
		List<Quiz> quizzes = query.list();
		
		String tagvalues[] = tag.split(",");
		int i = 0;
		List<Quiz> quizzes2 = new ArrayList<Quiz>();
		for(i=0;i<tagvalues.length;i++){
			Query query1 = session.createQuery("from Tag where tag = :tag");
			query1.setParameter("tag", tagvalues[i]);
			List<Tag> tags = query1.list();
			if(tags != null){
				Tag tagOld = tags.get(0);
				Query query2 = session.createQuery("from QuizTag where tagid = :tagid");
				query.setParameter("tagid", tagOld.getTagid());
				List<QuizTag> qztags = query2.list();
				for(QuizTag qztag: qztags){
					Query query3 = session.createQuery("from Quiz where qzid = :qzid");
					query3.setParameter("qzid", qztag.getQzid());
					quizzes2.addAll(query3.list());
				}
			}
			
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
