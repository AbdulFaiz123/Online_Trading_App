<%@page import="com.shop.services.UserService"%>
<%@page import="com.shop.services.AdminLoginService"%>
<%@page import="com.shop.models.AdminLogin"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.shop.db.HibernateUtil"%>
<%
String pass=request.getParameter("t1");
String user=session.getAttribute("user").toString();
UserService service=new UserService();
boolean flag=service.login(user, pass);
out.println(flag);

%>