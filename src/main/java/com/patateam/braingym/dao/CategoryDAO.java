package com.patateam.braingym.dao;

import java.util.List;

import org.hibernate.Query;
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
	public void addCategory(Category category){
		sessionFactory.getCurrentSession().save(category);
	}
	
	@Transactional
	public void deleteCategory(long categoryid){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete Category where categoryid = :catid");
		query.setParameter("catid", categoryid);
		query.executeUpdate();
		
	}
	
	@Transactional
	public void editCategory(Category category){
		Category categoryToUpdate = find(category.getCategoryid());
		categoryToUpdate.setCategory(category.getCategory());
		
	}
	
	@Transactional
	public Category find(String categoryname){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Category where category =:category");
		query.setParameter("category", categoryname);
		List<Category> categories = query.list();
		if(!categories.isEmpty()){
			Category category = categories.get(0);
			return category;
		}
		return null;
		
	}
	
	@Transactional
	public Category find(long categoryid){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Category where categoryid =:categoryid");
		query.setParameter("categoryid", categoryid);
		List<Category> categories = query.list();
		if(!categories.isEmpty()){
			Category category = categories.get(0);
			return category;
		}
		return null;
		
	}
	
	@Transactional
	public List<Category> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List categories = session.createQuery("from Category").list();
		return categories;
	}
}
