<%@page import="com.shop.services.FeedbackService"%>
<%@page import="com.shop.models.Feedback"%>
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
FeedbackService service=new FeedbackService();

if(request.getParameter("btn")!=null)
{
	String id=request.getParameter("hid");
	Feedback fd=service.get(id);
	String name=fd.getName();
	String email=fd.getEmail();
	SendMail.send(email, "Welcome to Online Shop", "<h1>Welcome "+name+" to Online Shop Feedback System</h1><p>"+request.getParameter("reply"));
	service.delete(id);	
	msg="Replied";
	
}
%>

<div  id="div1" class="modal" tabindex="-1" role="dialog">
<form name="form1" action="" method="post">
  <div class="modal-dialog" role="document">
  
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Reply to Feedback</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <input type="hidden" id="hid" name="hid"/>
      Your Reply
      <textarea class="form-control" name="reply"></textarea>        
      </div>
      <div class="modal-footer">
        <button type="submit" name="btn" class="btn btn-primary">Send</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>   
  </div>
  </form>
</div>
<h1>User Feedbacks</h1>
<hr>

<table class="table table-bordered">
<tr>
<th>Id</th>
<th>Name</th>
<th>Email ID</th>
<th>Message</th>
<th>Actions</th>
</tr>

<%
//List<Feedback> lt=service.list();

List<Feedback> lt=service.list();
boolean flag=true;
for(Feedback fd : lt)
{
	flag=false;
%>

<tr>
<td><%=fd.getId()%></td>
<td><%=fd.getName() %></td>
<td><%=fd.getEmail()%></td>
<td><%=fd.getMsg() %></td>
<td>
<button onclick="f1(<%=fd.getId()%>)" type="button" class="btn btn-primary">Reply</button>
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
--------- Feedback list is empty -------------
</td>
</tr>
<%
}
%>
</table>

<%@ include file="afooter.jsp"%>
<script>
function f1(id){
	alert(id);
	$("#hid").val(id);
	$('#div1').modal("show");	
}
<%
if(!msg.equals("")){
%>
swal("<%=msg%>");
<%
}
%>

</script>
