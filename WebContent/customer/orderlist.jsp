<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.shop.models.Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.shop.services.OrderService"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="cheader.jsp"%>

<%
OrderService service=new OrderService();
if(request.getParameter("did")!=null)
{
	service.delete(request.getParameter("did"));
	response.sendRedirect("orderlist.jsp");
}
%>

<h1>Order History</h1>
<hr>

<table class="table table-bordered">
<tr>
<th>OrderNo</th>
<th>OrderDate</th>
<th>OrderAmount</th>
<th>OrderStatus</th>
<th>Actions</th>
</tr>
<%
List<Orders> lt=service.listByUser(session.getAttribute("user").toString());
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
<a onclick="return confirm('Do you want to cancel order?');" href="?did=<%=ord.getOrderId()%>" class="btn btn-danger">Cancel Order</a>
</td>
</tr>
<%
}
%>
<tr>
<%
String sum=service.orderAmtByUser(session.getAttribute("user").toString());
%>
<td colspan="4" align="right"><strong>Total Order Amount: <%=sum %></strong> </td>
<td></td>
</tr>
</table>

<%@ include file="cfooter.jsp"%>

