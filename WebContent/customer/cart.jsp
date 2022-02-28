<%@page import="com.shop.models.Cart"%>
<%@page import="com.shop.models.CartView"%>
<%@page import="com.shop.services.CartService"%>
<%@page import="com.shop.services.UserService"%>
<%@page import="com.shop.models.AdminLogin"%>
<%@page import="com.shop.services.AdminLoginService"%>
<%@ include file="cheader.jsp"%>

<%
CartService service=new CartService();
String user=session.getAttribute("user").toString();

if(request.getParameter("q")!=null){
	String cid=request.getParameter("id");
	String qty=request.getParameter("q");
	Cart obj=service.get(cid);
	obj.setQty(Integer.parseInt(qty));
	service.saveOrUpdate(obj);	
}
if(request.getParameter("did")!=null){
	String cid=request.getParameter("did");
	service.delete(cid);	
}

%>

<div class="container">
<div class="row">
<div class="col-12">
<table class="table table-bordered">
<tr>
<td>Image</td>
<td>ProductId</td>
<td>Product Name</td>
<td>Price</td>
<td>Qty</td>
<td>total</td>
<td>Actions</td>
</tr>

<%
int i=0;

for(CartView cv : service.listAll(user)){


%>
<tr>
<td><img src="${pageContext.request.contextPath}/productupload/<%=cv.getProductImage()%>" alt="NA" width="50" height="50" class="rounded-circle"/></td>
<td><%=cv.getProductId()%></td>
<td><%=cv.getProductName()%></td>
<td><%=cv.getProductCost()%></td>
<td><input type="text" id="t<%=i%>" value="<%=cv.getQty()%>" class="form-control"/></td>
<td><%=cv.getProductCost()*cv.getQty()%></td>
<td>
<a href="?did=<%=cv.getCartId()%>" class="btn btn-danger">Remove</a>
<a href="#" onclick="return updateQty(<%=cv.getCartId()%>,<%=i%>);" class="btn btn-info">Update</a>
</td>
</tr>
<%
i++;
}
%>
<tr>
<td colspan="5">
<a href="neworder.jsp" class="btn btn-info">Place Order</a>
</td>
<td>
Total: <%=service.cartAmt(user) %>
</td>
<td></td>
</tr>
</table>
</div>
</div>
</div>

<%@ include file="cfooter.jsp"%>
<script>
function updateQty(id,q){
	var t=document.getElementById("t"+q);
	window.location="?id="+id+"&q="+t.value;
	return false;
}

</script>
