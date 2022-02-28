<%@page import="com.shop.services.UserService"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.shop.db.HibernateUtil"%>
<%
String email=request.getParameter("t5");
UserService service=new UserService();
boolean flag=service.checkEmail(email);
out.println(!flag);

%>