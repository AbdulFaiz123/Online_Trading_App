x<%@page import="com.shop.models.AdminLogin"%>
<%@page import="com.shop.services.AdminLoginService"%>
<%@ include file="header.jsp" %>

<%
String msg="";

if(request.getParameter("btnlogin")!=null){
	AdminLoginService service=new AdminLoginService();
	String user=request.getParameter("user");
	String pass=request.getParameter("pass");
	AdminLogin login=new AdminLogin();
	login.setUserid(user);
	login.setPassword(pass);
	if(service.login(login)){
		session.setAttribute("user", user);		
		response.sendRedirect("admin/home.jsp");
		
	}else{
		msg="Login Failed..";
	}
}

%>

<!-- Breadcrumb Start -->
        <div class="breadcrumb-wrap">
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>                    
                    <li class="breadcrumb-item active">Login</li>
                </ul>
            </div>
        </div>
<!-- Breadcrumb End -->

<!-- Login Start -->
        <div class="login">
            <div class="container-fluid">
                <div class="row">                    
                    <div class="col-lg-6">                    
                        <div class="login-form">
                        <form name="form1" method="post">
                            <div class="row">                            	
                            	<div class="col-md-12">
                                <h2 style="font-family:arial">Admin Login</h2>    
                                </div>                            	
                                <div class="col-md-6">
                                    <label>E-mail</label>
                                    <input class="form-control" name="user" id="user" type="text" placeholder="E-mail / Username">
                                </div>
                                <div class="col-md-6">
                                    <label>Password</label>
                                    <input class="form-control" name="pass" id="pass" type="password" placeholder="Password">
                                </div>
                                <div class="col-md-12">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="remme" name="remme">
                                        <label class="custom-control-label" for="newaccount">Keep me signed in</label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <button class="btn btn-primary" name="btnlogin" value="Login">Login</button>
                                </div>
                                <div class="col-md-12">
                                    <h4><%=msg%></h4>
                                </div>
                            </div>
                            
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Login End -->
        
        
<%@ include file="footer.jsp" %>
<script>
<%
if(!msg.equals("")){
%>
swal("<%=msg%>");
<%
}
%>
</script>