package com.shop.services;

import java.util.List;



import org.hibernate.Session;
import org.hibernate.Transaction;

import com.shop.db.HibernateUtil;
import com.shop.models.AdminLogin;
import com.shop.models.Feedback;
import com.shop.models.User;

public class FeedbackService {
	
	public List<Feedback> list()
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		List<Feedback> lt=session.createQuery("from Feedback",Feedback.class).list();
		
		
		session.getTransaction().commit();
		session.close();
		return lt;
	}	
	public Feedback get(String id)
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		Feedback cat=session.get(Feedback.class, Integer.parseInt(id));		
		session.getTransaction().commit();
		session.close();
		return cat;
	}	
	public void saveOrUpdate(Feedback obj)
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();		
		session.saveOrUpdate(obj);
		session.getTransaction().commit();
		session.close();		
	}
	public void delete(String id)
	{	
		Feedback cat=get(id);
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		session.delete(cat);
		session.getTransaction().commit();
		session.close();		
	}

}
