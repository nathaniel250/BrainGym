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
}
