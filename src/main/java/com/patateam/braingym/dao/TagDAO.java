package com.patateam.braingym.dao;

import java.util.List;

import org.hibernate.Query;
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
		/*Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("INSERT INTO 'tag' ('tag') VALUES (:tag) ON DUPLICATE KEY UPDATE 'timesUsed'='timesUsed'+1");
		query.setParameter("tag", tag);
		query.executeUpdate();
		*/
	}
	
	@Transactional
	public void deleteTag(long tagid){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete Tag where tagid = :tagid");
		query.setParameter("tagid", tagid);
		query.executeUpdate();
		
	}
	
	@Transactional
	public void editTag(Tag tag){
		Tag tagToUpdate = find(tag.getTagid());
		tagToUpdate.setTag(tag.getTag());
		
	}
	
	@Transactional
	public Tag find(String tagname){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Tag where tag =:tag");
		query.setParameter("tag", tagname);
		List<Tag> tags = query.list();
		if(!tags.isEmpty()){
			Tag tag = tags.get(0);
			return tag;
		}
		return null;
		
	}
	
	@Transactional
	public Tag find(long tagid){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Tag where tagid =:tagid");
		query.setParameter("tagid", tagid);
		List<Tag> tags = query.list();
		if(!tags.isEmpty()){
			Tag tag = tags.get(0);
			return tag;
		}
		return null;
		
	}
	
	@Transactional
	public List<Tag> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List tags = session.createQuery("from Tag").list();
		return tags;
	}
	

}
