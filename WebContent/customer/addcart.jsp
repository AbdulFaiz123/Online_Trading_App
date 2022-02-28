<%@page import="com.shop.models.Cart"%>
<%@page import="com.shop.services.CartService"%>
<%
String pid=request.getParameter("pid");
String user=session.getAttribute("user").toString();
CartService service=new CartService();
Cart obj=new Cart();
obj.setProductId(Integer.parseInt(pid));
obj.setQty(1);
obj.setUserName(user);
service.saveOrUpdate(obj);
response.sendRedirect("cart.jsp");
%>