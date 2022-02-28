<%@page import="com.shop.services.AdminLoginService"%>
<%@page import="com.shop.models.AdminLogin"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.shop.db.HibernateUtil"%>
<%
String pass=request.getParameter("t1");
String user=session.getAttribute("user").toString();
AdminLogin obj=new AdminLogin();
obj.setUserid(user);
obj.setPassword(pass);
AdminLoginService service=new AdminLoginService();
boolean flag=service.login(obj);
out.println(flag);

%>