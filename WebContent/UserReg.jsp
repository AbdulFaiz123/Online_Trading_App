<%@page import="java.security.Provider.Service"%>
<%@page import="com.shop.db.SendMail"%>
<%@page import="com.shop.db.VerifyCaptcha"%>
<%@page import="com.shop.services.UserService"%>
<%@page import="com.shop.models.User"%>
<%@page import="com.shop.models.AdminLogin"%>
<%@page import="com.shop.services.AdminLoginService"%>
<%@ include file="header.jsp"%>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>

<%
String msg="";
if(request.getParameter("btn")!=null){
	String token=request.getParameter("g-recaptcha-response");
	if(VerifyCaptcha.verify(token)){
		String name=request.getParameter("t2");
		String address=request.getParameter("t3");
		String mobile=request.getParameter("t4");
		String email=request.getParameter("t5");
		String pass=request.getParameter("t6");
		String secq=request.getParameter("t7");
		String seca=request.getParameter("t8");
		User obj=new User();
		obj.setName(name);
		obj.setAddress(address);
		obj.setMobile(mobile);
		obj.setEmail(email);
		obj.setPassword(pass);
		obj.setSecQ(secq);
		obj.setSecA(seca);
		//UserService service=new UserService();
		UserService service=new UserService();
		//service.signup(obj);
		service.signup(obj);
		//SendMail.send(email, "Welcome to Torry Stock Exchanges", "<h1>Welcome "+name+" to Torry Harris Stock Exchange </h1>25 din me paisa double ....paisa he paisa ....hahahhah");
		SendMail.send(email, "Welcome to Torry Stock Exchanges", "<h1>Welcome "+name+" to Torry Harris Stock Exchange </h1>25 din me paisa double ....paisa he paisa ....hahahhah");
		msg="You have registered successfully.. Please Login...";
	}else{
		msg="Invalid Captcha try again....";
	}
}
%>

<div class="container">
<div class="row">
<div class="col-6">
<form name="form1" id="form1" method="post">
<div class="card">
<div class="card-header">
<h3>User Registration </h3>
</div>
<div class="card-body">
<div class="form-group">
Name
<input type="text" id="t2" name="t2" class="form-control"  placeholder="Enter Name"/>
</div>
<div class="form-group">
Country
<input type="text" name="t3" class="form-control"  placeholder="Enter Address"/>
</div>
<div class="form-group">
Mobile No.
<input type="text" name="t4" class="form-control"  placeholder="Enter Mobile Number"/>
</div>
<div class="form-group">
Email ID
<input type="text" name="t5" class="form-control"  placeholder="Enter Email Address"/>
</div>
<div class="form-group">
Password
<input type="password" name="t6" class="form-control"  placeholder="Enter Password"/>
</div>
<div class="form-group">
SecQ
<select name="t7" class="form-control">
<option value="">--Select Security Question--</option>
<option value="What is your last name?">What is your last name?</option>
<option value="What is your pet name?">What is your pet name?</option>
<option value="What is your city?">What is your city?</option>
<option value="What is your birthdate?">What is your birthdate?</option>
</select>
</div>
<div class="form-group">
SecA
<input type="text" name="t8" class="form-control"  placeholder="Enter SecA"/>
</div>
<div class="g-recaptcha" data-sitekey="6Lf5oCgeAAAAAFY1MnhHBOCdEJvggbE_g3ZbI-MR"></div>

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
			t2:{
				required:true,
				pattern:/^[A-Za-z ]+$/
				
			},
			t3:{
				required:true,
				
			},
			t4:{
				required:true,
				pattern:/^\d{10}$/
				
			},
			t5:{
				required:true,
				email:true,
				remote:"checkemail.jsp"
				
			},
			t6:{
				required:true,
				
			},
			t7:{
				required:true,
				
			},
			t8:{
				required:true,
				
			}
		},
		messages:{			
			t2:{
				required:"Name Required",
				pattern:"Allows only chars and spaces",
			},
			t3:{
				required:"Address Is Required",
			},
			t4:{
				required:"Mobile No. Is Required",
				pattern:"Allows only 10 digits",
				
			},
			t5:{
				required:"Email ID Is Required",
				email:"Invalid Email Address",
				remote:"EmailID/Username is already registered with us.."
				
			},
			t6:{
				required:"Password Is Required",
				
			},
			t7:{
				required:"SecQ Is Required",
				
			},
			t8:{
				required:"SecA Is Required",
				
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