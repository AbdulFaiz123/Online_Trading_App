<%@page import="com.shop.models.CartView"%>
<%@page import="java.util.List"%>
<%@page import="com.shop.services.CartService"%>
<%
//Write Code to get all cart items from User's cart and pass these
//items to payment via QueryString/Get Method

CartService service=new CartService();
String user=session.getAttribute("user").toString();

String queryString  = "?cmd=_cart";
queryString += "&upload=1";
queryString += "&charset=utf-8";
queryString += "&currency_code=INR";
queryString += "&business=aakashmr14343@gmail.com";
queryString += "&return=http://localhost:8080/OnlineShop/customer/neworder.jsp?u="+user;
queryString += "&notify_url=''";

List<CartView> lt=service.listAll(user);
int i=1;
for(CartView cv : lt)
{
	queryString += "&item_number_"+i+"="+cv.getProductId();
	queryString += "&item_name_"+i+"="+cv.getProductName();
	queryString += "&amount_"+i+"="+cv.getProductCost();
	queryString += "&quantity_"+i+"="+cv.getQty();
	i++;
}
String url="https://www.sandbox.paypal.com/cgi-bin/webscr"+queryString;
response.sendRedirect(url);

%>