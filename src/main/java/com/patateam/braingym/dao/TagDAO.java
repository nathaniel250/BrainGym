package com.patateam.braingym.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patateam.braingym.model.Tag;


@Repository
@SuppressWarnings({"unchecked", "rawtypes"})
public class TagDAO {
	
	@Autowired private SessionFactory sessionFactory;
	@Transactional
	public void addTag(Tag tag){
		sessionFactory.getCurrentSession().save(tag);
	}
	@Transactional
	public List<Tag> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List tags = session.createQuery("from Tag").list();
		return tags;
	}
	

}
