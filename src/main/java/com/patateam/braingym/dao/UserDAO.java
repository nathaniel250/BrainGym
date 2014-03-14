package com.patateam.braingym.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patateam.braingym.model.User;

@Repository
@SuppressWarnings({"unchecked", "rawtypes"})
public class UserDAO {
	@Autowired private SessionFactory sessionFactory;
	@Transactional
	
	public void addUser(User user){
		sessionFactory.getCurrentSession().save(user);
	}
	
	@Transactional
	public void deleteUser(long userid){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete User where userid = :userid");
		query.setParameter("userid", userid);
		query.executeUpdate();
		
	}
	
	@Transactional
	public void editUser(User user){
		User userToUpdate = find(user.getUserid());
		userToUpdate.setUsername(user.getUsername());
		userToUpdate.setPassword(user.getPassword());
		
	}
	
	@Transactional
	public User find(long userid){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where userid =:userid");
		query.setParameter("userid", userid);
		List<User> users = query.list();
		if(!users.isEmpty()){
			User user = users.get(0);
			return user;
		}
		return null;
		
	}
	
}
