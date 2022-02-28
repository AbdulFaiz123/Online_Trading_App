package com.shop.services;

import java.util.List;

import org.hibernate.Session;

import com.shop.db.HibernateUtil;
import com.shop.models.Cart;
import com.shop.models.CartView;

public class CartService {
	
	public List<Cart> list()
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		List<Cart> lt=session.createQuery("from Cart",Cart.class).list();
		
		
		session.getTransaction().commit();
		session.close();
		return lt;
	}	
	public List<CartView> listAll()
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		List<CartView> lt=session.createQuery("from CartView",CartView.class).list();
		
		
		session.getTransaction().commit();
		session.close();
		return lt;
	}	
	public List<CartView> listAll(String user)
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		List<CartView> lt=session.createQuery("from CartView c where c.UserName=?1",CartView.class)
				.setParameter(1, user)
				.list();
		session.getTransaction().commit();
		session.close();
		return lt;
	}
	public Cart get(String id)
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		Cart cat=session.get(Cart.class, Integer.parseInt(id));		
		session.getTransaction().commit();
		session.close();
		return cat;
	}	
	public void saveOrUpdate(Cart obj)
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();		
		session.saveOrUpdate(obj);
		session.getTransaction().commit();
		session.close();		
	}
	public void delete(String id)
	{	
		Cart cat=get(id);
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		session.delete(cat);
		session.getTransaction().commit();
		session.close();		
	}
	public String cartAmt(String user)
	{	
		
		Session session=HibernateUtil.getSession();		
		session.beginTransaction();
		Object sum=session.createQuery("select sum(c.ProductCost*c.Qty) from CartView c where c.UserName=?1")
		.setParameter(1, user)
		.uniqueResult();
		if(sum==null)
			sum=0;
		session.getTransaction().commit();
		session.close();
		return sum+"";
	}
	public int deleteByUser(String user)
	{			
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		int v=session.createQuery("delete from Cart where UserName=:user")
		.setParameter("user", user).executeUpdate();
		session.getTransaction().commit();
		session.close();
		return v;
	}
	
	

}
