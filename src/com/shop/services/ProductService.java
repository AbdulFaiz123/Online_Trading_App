package com.shop.services;

import java.util.List;

import org.hibernate.Session;

import com.shop.db.HibernateUtil;
import com.shop.models.Product;
import com.shop.models.ProductView;


public class ProductService {
	
	public List<Product> list()
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		List<Product> lt=session.createQuery("from Product",Product.class).list();
		
		
		session.getTransaction().commit();
		session.close();
		return lt;
	}	
	public List<ProductView> listAll()
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		List<ProductView> lt=session.createQuery("from ProductView",ProductView.class).list();
		session.getTransaction().commit();
		session.close();
		return lt;
	}	
	public List<ProductView> listAll(String catid)
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		List<ProductView> lt=session.createQuery("from ProductView c where c.CategoryId=?1",ProductView.class)
				.setParameter(1, Integer.parseInt(catid))
				.list();
		session.getTransaction().commit();
		session.close();
		return lt;
	}
	public Product get(String id)
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		Product cat=session.get(Product.class, Integer.parseInt(id));		
		session.getTransaction().commit();
		session.close();
		return cat;
	}	
	public void saveOrUpdate(Product obj)
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();		
		session.saveOrUpdate(obj);
		session.getTransaction().commit();
		session.close();		
	}
	public void delete(String id)
	{	
		Product cat=get(id);
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		session.delete(cat);
		session.getTransaction().commit();
		session.close();		
	}
	
	

}
