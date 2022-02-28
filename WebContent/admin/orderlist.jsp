<%@page import="com.shop.services.UserService"%>
<%@page import="com.shop.models.User"%>
<%@page import="com.shop.db.SendMail"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.shop.models.Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.shop.services.OrderService"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="aheader.jsp"%>

<%
String msg="";
OrderService service=new OrderService();
if(request.getParameter("did")!=null)
{
	service.delete(request.getParameter("did"));
	response.sendRedirect("orderlist.jsp");
}
if(request.getParameter("sid")!=null)
{
	Orders ord=service.get(request.getParameter("sid"));
	ord.setOrderStatus("Dispatched");
	service.update(ord);	
	String user=ord.getUserName();
	UserService service1=new UserService();
	User u=service1.getUser(user);
	SendMail.send(user, "Welcome to Online Shop", "<h1>Welcome "+u.getName()+" to Online Shop</h1>Your Order No "+ord.getOrderId()+" dated "+ord.getOrderDate()+" is dispatched, u will get within 2/3 business days. Thanking u");
	msg="Order No "+ord.getOrderId()+" is dispatached";
}
%>

<h1>Order History</h1>
<hr>

<table class="table table-bordered">
<tr>
<th>StockOrderNo</th>
<th>OrderDate</th>
<th>Amount</th>
<th>Status</th>
<th>Actions</th>
</tr>
<%
//List<Orders> lt=service.list("Paid");
List<Orders> lt=service.list("Paid");
boolean flag=true;
for(Orders ord : lt)
{
	flag=false;
%>
<tr>
<td><%=ord.getOrderId() %></td>
<td><%=ord.getOrderDate().toLocalDate().format(DateTimeFormatter.ISO_DATE) %></td>
<td><%=ord.getOrderAmount() %></td>
<td><%=ord.getOrderStatus() %></td>
<td>
<a href="showorder.jsp?id=<%=ord.getOrderId()%>" class="btn btn-danger">View Order</a>
<a onclick="return confirm('Do you want to cancel order?');" href="?did=<%=ord.getOrderId()%>" class="btn btn-danger">Cancel Order</a>
<%-- <a href="?sid=<%=ord.getOrderId()%>" class="btn btn-danger">Dispatch Order</a> --%>
</td>
</tr>
<%
}
%>
<tr>
<%
if(flag){
%>
<tr>
<td colspan="5" align="center">
--------- Order list is empty -------------
</td>
</tr>
<%
}
%>
<%
String sum=service.orderAmt("Paid");
%>
<td colspan="4" align="right"><strong>Total Order Amount: <%=sum %></strong> </td>
<td></td>
</tr>
</table>

<%@ include file="afooter.jsp"%>
<script>
<%
if(!msg.equals("")){
%>
swal("<%=msg%>");
<%
}
%>

</script>
