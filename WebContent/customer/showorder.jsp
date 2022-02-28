<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.List"%>
<%@page import="com.shop.models.User"%>
<%@page import="com.shop.services.UserService"%>
<%@page import="com.shop.models.Orders"%>
<%@page import="com.shop.services.OrderService"%>
<%@page import="java.sql.ResultSet"%>

<%
OrderService service=new OrderService();
String id=request.getParameter("id");
Orders ord=service.get(id);
%>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<h2 align="center">Your Order</h2>
<hr>
<br>
<table class="table table-bordered">
<tr>
<td colspan="4" align="center"><h4>Order Information</h4></td>
</tr>
<tr>
<td>Order No</td><td><%=ord.getOrderId() %></td>
<td>Order Date</td><td><%=ord.getOrderDate().toLocalDate().format(DateTimeFormatter.ISO_DATE) %></td>
</tr>
<tr>
<td>Order Amount</td><td><%=ord.getOrderAmount() %></td>
<td>Order Status</td><td><%=ord.getOrderStatus() %></td>
</tr>
<tr>
<%
UserService custservice=new UserService();
User cust=custservice.getUser(ord.getUserName());
%>
<td></td>
<td></td>
</tr>
</table>
<table class="table table-bordered">
<tr>
<td colspan="5" align="center"><h4>Order Products</h4></td>
</tr>
<tr>
<td>Product ID</td>
<td>Product Name</td>
<td>Product Price</td>
<td>Product Qty</td>
<td>Total Amount</td>
</tr>
<%

List<Object[]> lt=service.orderItems(id);
for(Object ob[] : lt)
{
%>
<tr>
<td><%=ob[1] %></td>
<td><%=ob[2] %></td>
<td><%=ob[3] %></td>
<td><%=ob[4] %></td>
<td><%=ob[5] %></td>
</tr>
<%
}
%>

</table>
<button type="button" onclick="window.print();" class="btn btn-primary">Print Order</button>
<button type="button" onclick="window.location='orderlist.jsp';" class="btn btn-primary">Back to Orders History</button>

