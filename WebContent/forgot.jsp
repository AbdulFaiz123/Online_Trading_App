<%@page import="com.shop.db.SendMail"%>
<%@page import="com.shop.models.User"%>
<%@page import="com.shop.services.UserService"%>
<%@page import="com.shop.models.AdminLogin"%>
<%@page import="com.shop.services.AdminLoginService"%>
<%@ include file="header.jsp"%>

<%
String msg="";
if(request.getParameter("btn")!=null){
	String user=request.getParameter("t1");
	String secq=request.getParameter("t2");
	String seca=request.getParameter("t3");
	UserService service=new UserService();
	User u=service.getUser(user);
	if(u.getSecQ().equals(secq) && u.getSecA().equals(seca)){
		String ans=u.getPassword();
		msg="Your Password is "+ans;
		//SendMail.send(user, "Online Shop - Password Receovery", "<h1>Welcome "+user+" to Online Shop</h1>Please note password: "+ans);
	}else{
		msg="Your Answer might be wrong try again";
	}	
}
%>



<div class="container">
<div class="row">
<div class="col-6">
<form name="form1" id="form1" method="post">
<div class="card">
<div class="card-header">
<h3>Forgot Password?</h3>
</div>
<div class="card-body">
<div class="form-group">
UserName
<input type="text" id="t1" name="t1" class="form-control" placeholder="Enter UserName"/>
<span id="s1"></span>
</div>
<div class="form-group">
Security Question
<input type="text" id="t2" name="t2" class="form-control"  placeholder="Security Question" readonly="readonly"/>
</div>
<div class="form-group">
Security Answer
<input type="text" name="t3" class="form-control"  placeholder="Enter Security Answer" />
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
<%@ include file="footer.jsp"%>
<script>
$(function(){
	$("#form1").validate({
		rules:{
			t1:{
				required:true
			},
			t2:{
				required:true
			},
			t3:{
				required:true				
			}
		},
		messages:{
			t1:{
				required:"UserName Required"				
			},
			t2:{
				required:"SecQ Required"
			},
			t3:{
				required:"SecA Required"
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
//Write script to get SecQ on valid username
$("#t1").blur(function(){ //on focus lost
	$.get("getUserData.jsp",{user:$(this).val()},function(response){
		if(response.trim()=="0"){
			$("#s1").html("UserName is not found");
		}else{
			$("#s1").html("");
			$("#t2").val(response);
			$("#t3").focus();
			
			
		}
	});
});

</script>