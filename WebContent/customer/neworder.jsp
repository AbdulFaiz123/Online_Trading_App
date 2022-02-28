<%@page import="com.shop.models.Orders"%>
<%@page import="com.shop.services.OrderService"%>
<%@page import="com.shop.models.Product"%>
<%@page import="com.shop.services.ProductService"%>
<%@page import="com.shop.models.Cart"%>
<%@page import="com.shop.services.CartService"%>
<%@page import="com.shop.models.CartView"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%
OrderService service=new OrderService();
CartService cartService=new CartService();
//u must restore session after return from Paypal Server
String user=request.getParameter("u");
session.setAttribute("user",user);

//String user=session.getAttribute("user").toString();

//Now we can create new order/bill for user => after payment

//Create new order
//Get Order Amount
String amt=cartService.cartAmt(user);
Orders obj=new Orders();		

obj.setOrderDate(Date.valueOf(LocalDate.now()));
obj.setUserName(user);
obj.setOrderAmount(Double.parseDouble(amt));
obj.setOrderStatus("Paid");
int ordid=service.save(obj);


//Store cart items in order items

ProductService is=new ProductService();
List<CartView> lt=cartService.listAll(user);
for(CartView cv : lt)
{
	service.insertOrderItems(ordid, cv.getProductId(), cv.getProductName(), cv.getProductCost(), cv.getQty(), cv.getProductCost()*cv.getQty());	
	//Update Qty in Product Table
	Product item=is.get(cv.getProductId()+"");
	item.setProductQty(item.getProductQty()-cv.getQty());
	is.saveOrUpdate(item);
	
}

//Once order created, delete user items from cart
cartService.deleteByUser(user);
response.sendRedirect("showorder.jsp?id="+ordid);
%>