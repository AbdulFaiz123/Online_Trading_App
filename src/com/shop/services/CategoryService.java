package com.shop.services;

import java.util.List;



import org.hibernate.Session;
import org.hibernate.Transaction;

import com.shop.db.HibernateUtil;
import com.shop.models.AdminLogin;
import com.shop.models.Category;
import com.shop.models.User;

public class CategoryService {
	
	public List<Category> list()
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		List<Category> lt=session.createQuery("from Category",Category.class).list();
		
		
		session.getTransaction().commit();
		session.close();
		return lt;
	}	
	public Category get(String id)
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		Category cat=session.get(Category.class, Integer.parseInt(id));		
		session.getTransaction().commit();
		session.close();
		return cat;
	}	
	public void saveOrUpdate(Category obj)
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();		
		session.saveOrUpdate(obj);
		session.getTransaction().commit();
		session.close();		
	}
	public void delete(String id)
	{	
		Category cat=get(id);
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		session.delete(cat);
		session.getTransaction().commit();
		session.close();		
	}

}
