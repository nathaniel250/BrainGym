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
import com.patateam.braingym.model.QuizTag;

@Repository
@SuppressWarnings({"unchecked", "rawtypes"})

public class QuizTagDAO {
	
	@Autowired private SessionFactory sessionFactory;
	
	@Transactional
	public void addQuizTag(long qzid, long tagid){
		Session session = sessionFactory.getCurrentSession();
		QuizTag qztag = new QuizTag();
		qztag.setQzid(qzid);
		qztag.setTagid(tagid);
		session.save(qztag);
	}
	
	@Transactional
	public void deleteQuizTag(long qzid, long tagid){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete QuizTag where qzid = :qzid AND tagid = :tagid");
		query.setParameter("qzid", qzid);
		query.setParameter("tagid", tagid);
		query.executeUpdate();
		
	}
	
	@Transactional
	public void deleteQuizTag(long qztagid){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete QuizTag where qztagid = :qzid");
		query.setParameter("qztagid", qztagid);
		query.executeUpdate();
		
	}
	
	@Transactional
	public List<Long> findQuizId(long tagid){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from QuizTag where tagid = :tagid");
		query.setParameter("tagid", tagid);
		List<QuizTag> qztags = query.list();
		List<Long> qzids = new ArrayList<Long>();
		for(QuizTag qztag: qztags){
			qzids.add(qztag.getQzid());
		}
		
		return qzids;
	}
	
	@Transactional
	public List<Long> findTagId(long qzid){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from QuizTag where qzid = :qzid");
		query.setParameter("qzid", qzid);
		List<QuizTag> qztags = query.list();
		List<Long> tagids = new ArrayList<Long>();
		for(QuizTag qztag: qztags){
			tagids.add(qztag.getTagid());
		}
		
		return tagids;
	}
	
	@Transactional
	public QuizTag findTagId(long qzid, long tagid){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from QuizTag where qzid = :qzid && tagid = :tagid");
		query.setParameter("qzid", qzid);
		query.setParameter("tagid", tagid);
		List<QuizTag> qztags = query.list();
		if(qztags!=null){
			QuizTag qztag = qztags.remove(0);
			return qztag;
		}
		
		return null;
	}
	
	
}
