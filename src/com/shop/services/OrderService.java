package com.shop.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;

import com.shop.db.HibernateUtil;
import com.shop.models.Orders;

public class OrderService {
	
	public List<Orders> list(String orderstatus)
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		List<Orders> lt=session.createQuery("from Orders c where c.OrderStatus=?1",Orders.class)
				.setParameter(1, orderstatus)
				.list();
		
		
		session.getTransaction().commit();
		session.close();
		return lt;
	}	
	public List<Orders> listByUser(String user)
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		List<Orders> lt=session.createQuery("from Orders c where c.UserName=?1",Orders.class)
				.setParameter(1, user)
				.list();
		
		
		session.getTransaction().commit();
		session.close();
		return lt;
	}	
		
	public Orders get(String id)
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		Orders cat=session.get(Orders.class, Integer.parseInt(id));		
		session.getTransaction().commit();
		session.close();
		return cat;
	}	
	public int save(Orders obj)
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();		
		Integer id=(Integer)session.save(obj);
		session.getTransaction().commit();
		session.close();		
		return id;
	}
	public void update(Orders obj)
	{		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();		
		session.update(obj);
		session.getTransaction().commit();
		session.close();		
		
	}
	public void delete(String id)
	{	
		Orders cat=get(id);
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		session.delete(cat);
		session.getTransaction().commit();
		session.close();		
	}
	
	public String orderAmt(String status)
	{	
		
		Session session=HibernateUtil.getSession();		
		session.beginTransaction();
		Object sum=session.createQuery("select sum(c.OrderAmount) from Orders c where c.OrderStatus=?1")
		.setParameter(1, status)
		.uniqueResult();
		if(sum==null)
			sum=0;
		session.getTransaction().commit();
		session.close();
		return sum+"";
	}
	public String orderAmtByUser(String user)
	{	
		
		Session session=HibernateUtil.getSession();		
		session.beginTransaction();
		Object sum=session.createQuery("select sum(c.OrderAmount) from Orders c where c.UserName=?1")
		.setParameter(1, user)
		.uniqueResult();
		if(sum==null)
			sum=0;
		session.getTransaction().commit();
		session.close();
		return sum+"";
	}
	public List<Object[]> orderItems(String ordid)
	{	
		
		Session session=HibernateUtil.getSession();		
		session.beginTransaction();
		List<Object[]> lt=session.createSQLQuery("select * from OrderItems where OrderId=?1")
		.setParameter(1, ordid).list();
		
		session.getTransaction().commit();
		session.close();
		return lt;
	}
	public void insertOrderItems(int ordid,int itemid,String itemname,double price,int qty,double tot) throws SQLException
	{	
		
		Connection cn=HibernateUtil.getConnection();
		PreparedStatement ps=cn.prepareStatement("Insert into OrderItems values(?,?,?,?,?,?)");
		ps.setInt(1, ordid);
		ps.setInt(2, itemid);
		ps.setString(3, itemname);
		ps.setDouble(4, price);
		ps.setInt(5, qty);
		ps.setDouble(6,tot);
		
		ps.executeUpdate();
		cn.commit();
		
	}
	
	

}
