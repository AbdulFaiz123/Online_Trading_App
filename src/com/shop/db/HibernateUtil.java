package com.shop.db;

import java.sql.Connection;
import java.sql.SQLException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.engine.jdbc.connections.spi.ConnectionProvider;

import com.shop.models.AdminLogin;
import com.shop.models.Cart;
import com.shop.models.CartView;
import com.shop.models.Category;
import com.shop.models.Feedback;
import com.shop.models.Orders;
import com.shop.models.Product;
import com.shop.models.ProductView;
import com.shop.models.User;
import com.shop.models.UserProfile;



public class HibernateUtil {
	static SessionFactory sf;
	static {
		sf=new Configuration().
				configure().
				addAnnotatedClass(AdminLogin.class).
				addAnnotatedClass(User.class).
				addAnnotatedClass(Category.class).
				addAnnotatedClass(Product.class).
				addAnnotatedClass(ProductView.class).
				addAnnotatedClass(Cart.class).
				addAnnotatedClass(CartView.class).
				addAnnotatedClass(Orders.class).
				addAnnotatedClass(UserProfile.class).
				addAnnotatedClass(Feedback.class).
				buildSessionFactory();
	}
	public static Session getSession() {
		return sf.openSession(); //open connection/session and returns object
	}
	public static Connection getConnection()
	{
		try {			
			return sf.getSessionFactoryOptions().getServiceRegistry().getService(ConnectionProvider.class).getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
