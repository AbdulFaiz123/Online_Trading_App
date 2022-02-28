package com.shop.services;

import java.util.List;



import org.hibernate.Session;
import org.hibernate.Transaction;

import com.shop.db.HibernateUtil;
import com.shop.models.AdminLogin;

public class AdminLoginService  { //AdminLoginService
	
	public boolean login(AdminLogin login) {
		Session s=HibernateUtil.getSession();
		Transaction t=s.beginTransaction();
		List<AdminLogin> lt=s.createQuery("from AdminLogin a where a.userid='"+login.getUserid()+"' and a.password='"+login.getPassword()+"'").list();
		t.commit();
		s.close();//ResultSet rs="select *from adminlogin where userid=? and password=?",login.getUserid(),login.getPassword()
		//if(rs.next){ return true }else{return false}
		if(lt.size()>0) {
			return true;
		}else {
			return false;
		}
	}
	public void update(AdminLogin login) {
		Session s=HibernateUtil.getSession();
		Transaction t=s.beginTransaction();
		s.update(login);
		t.commit();
		s.close();		
	}

}
