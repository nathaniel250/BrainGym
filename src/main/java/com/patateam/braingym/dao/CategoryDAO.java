package com.patateam.braingym.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patateam.braingym.model.Category;


@Repository
@SuppressWarnings({"unchecked", "rawtypes"})
public class CategoryDAO {
	@Autowired private SessionFactory sessionFactory;
	
	@Transactional
	public List<Category> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List categories = session.createQuery("from Category").list();
		return categories;
	}
}
