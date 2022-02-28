<%@page import="com.shop.services.UserService"%>
<%@page import="com.shop.models.AdminLogin"%>
<%@page import="com.shop.services.AdminLoginService"%>
<%@ include file="cheader.jsp"%>

<%
String msg="";
if(request.getParameter("btn")!=null){
	String pass=request.getParameter("t1");
	String newpass=request.getParameter("t2");
	String user=session.getAttribute("user").toString();
	UserService service=new UserService();
	service.updateUserByPassword(user, pass,newpass);	
	msg="Password Changed...";
}
%>

<div class="container">
<div class="row">
<div class="col-6">
<form name="form1" id="form1" method="post">
<div class="card">
<div class="card-header">
<h3>Change Password</h3>
</div>
<div class="card-body">
<div class="form-group">
Old Password
<input type="password" name="t1" class="form-control" placeholder="Enter Old Password"/>
</div>
<div class="form-group">
New Password
<input type="password" id="t2" name="t2" class="form-control"  placeholder="Enter New Password"/>
</div>
<div class="form-group">
Confirm New Password
<input type="password" name="t3" class="form-control"  placeholder="Enter Confirm New Password"/>
</div>
<div class="form-group">
<input type="submit" name="btn" class="btn btn-primary" value="Submit"/>
</div>
</div>
</div>
</form>
</div>
</div>
</div>
<%@ include file="cfooter.jsp"%>
<script>
$(function(){
	$("#form1").validate({
		rules:{
			t1:{
				required:true,
				remote:"checkpass.jsp"
			},
			t2:{
				required:true
			},
			t3:{
				required:true,
				equalTo:"#t2"
			}
		},
		messages:{
			t1:{
				required:"Old Password Required",
				remote:"Wrong Old Password"
			},
			t2:{
				required:"New Password Required"
			},
			t3:{
				required:"Confirm New Password Required",
				equalTo:"Password Mismatch"
			}
			
		}
	});
});

<%
if(!msg.equals("")){
%>
swal("<%=msg%>");
<%
}
%>
</script>