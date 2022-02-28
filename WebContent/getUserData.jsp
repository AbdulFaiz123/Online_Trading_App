<%@page import="com.shop.models.User"%>
<%@page import="com.shop.services.UserService"%>
<%@page import="com.shop.services.AdminLoginService"%>
<%@page import="com.shop.models.AdminLogin"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.shop.db.HibernateUtil"%>
<%
String user=request.getParameter("user");
UserService service=new UserService();
User u=service.getUser(user);
if(u==null){
out.println("0");
}else{
	out.println(u.getSecQ());
}

%>