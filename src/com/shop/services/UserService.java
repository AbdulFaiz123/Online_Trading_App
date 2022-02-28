package com.shop.services;

import java.util.List;



import org.hibernate.Session;
import org.hibernate.Transaction;

import com.shop.db.HibernateUtil;
import com.shop.models.AdminLogin;
import com.shop.models.User;
import com.shop.models.UserProfile;

public class UserService {
	
	public boolean checkEmail(String email) {
		Session s=HibernateUtil.getSession();
		Transaction t=s.beginTransaction();
		List<User> lt=s.createQuery("from User a where a.email=?1")
				.setParameter(1, email).list();
		t.commit();
		s.close();
		if(lt.size()>0) {
			return true;
		}else {
			return false;
		}
	}
	public boolean login(String email,String password) {
		Session s=HibernateUtil.getSession();
		Transaction t=s.beginTransaction();
		List<User> lt=s.createQuery("from User a where a.email=?1 and a.password=?2")
				.setParameter(1, email)
				.setParameter(2, password)
				.list();
		t.commit();
		s.close();
		if(lt.size()>0) {
			return true;
		}else {
			return false;
		}
	}
	public void signup(User user) {
		Session s=HibernateUtil.getSession();
		Transaction t=s.beginTransaction();
		s.save(user);
		t.commit();
		s.close();		
	}
	public void updateUserByPassword(String email,String pass,String newpass) {
		Session s=HibernateUtil.getSession();
		Transaction t=s.beginTransaction();
		List<User> lt=s.createQuery("from User a where a.email=?1 and a.password=?2")
				.setParameter(1, email)
				.setParameter(2, pass)
				.list();
		lt.get(0).setPassword(newpass);
		s.update(lt.get(0));
		t.commit();
		s.close();		
	}
	
	public User getUser(String user) {
		Session s=HibernateUtil.getSession();
		Transaction t=s.beginTransaction();
		List<User> lt=s.createQuery("from User a where a.email=?1")
				.setParameter(1, user)				
				.list();
		t.commit();
		s.close();	
		if(lt.size()>0) {
			return lt.get(0);
		}else {
			return null;
		}
			
	}
	public void updateUser(User user) {
		Session s=HibernateUtil.getSession();
		Transaction t=s.beginTransaction();
		s.update(user);
		t.commit();
		s.close();	
		
	}
	//User Profile
	public UserProfile getProfile(String user)
	{		
		Session session=HibernateUtil.getSession();
		List<UserProfile> lt=session.createQuery("from UserProfile a where a.UserName=?1",UserProfile.class)
		.setParameter(1, user).list();	
		
		session.close();
		return lt.get(0);
	}	
	public void updateProfile(UserProfile obj)
	{
		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		session.saveOrUpdate(obj);
		session.getTransaction().commit();
		session.close();		
	}
		

}
