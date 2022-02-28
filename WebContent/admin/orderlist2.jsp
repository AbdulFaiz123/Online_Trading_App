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
OrderService service=new OrderService();
%>

<h1>Stock Order History</h1>
<hr>

<table class="table table-bordered">
<tr>
<th>StockOrderNo</th>
<th>OrderDate</th>
<th>OrderAmount</th>
<th>OrderStatus</th>
<th>Action</th>
</tr>
<%
List<Orders> lt=service.list("Success");
for(Orders ord : lt)
{
%>
<tr>
<td><%=ord.getOrderId() %></td>
<td><%=ord.getOrderDate().toLocalDate().format(DateTimeFormatter.ISO_DATE) %></td>
<td><%=ord.getOrderAmount() %></td>
<td><%=ord.getOrderStatus() %></td>
<td>
<a href="showorder.jsp?id=<%=ord.getOrderId()%>" class="btn btn-danger">View Order</a>
</td>
</tr>
<%
}
%>
<tr>
<%
String sum=service.orderAmt("Success");
%>
<td colspan="4" align="right"><strong>Total Order Amount: <%=sum %></strong> </td>
<td></td>
</tr>
</table>

<%@ include file="afooter.jsp"%>
