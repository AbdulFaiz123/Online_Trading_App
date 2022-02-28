<%@page import="com.shop.models.AdminLogin"%>
<%@page import="com.shop.services.UserService"%>
<%@ include file="header.jsp" %>

<%
String msg="";
//Get Cookies array from request
Cookie k[]=request.getCookies();
String u="",p="";
if(k!=null && k.length>0){
	for(Cookie c : k){
		if(c.getName().equals("user")){
			u=c.getValue();
		}else if(c.getName().equals("pass")){
			p=c.getValue();
		}
		
	}
}
if(request.getParameter("pid")!=null){
	session.setAttribute("pid", request.getParameter("pid"));
}
if(request.getParameter("btnlogin")!=null){
	UserService service=new UserService();
	String user=request.getParameter("user");
	String pass=request.getParameter("pass");	
	if(service.login(user,pass)){
		session.setAttribute("user", user);
		if(request.getParameter("remme")!=null){
			//Create cookies of user and pass
			Cookie c1=new Cookie("user",user); //name,value
			c1.setMaxAge(60*60); //seconds
			Cookie c2=new Cookie("pass",pass); //name,value
			c2.setMaxAge(60*60); //seconds
			
			response.addCookie(c1);
			response.addCookie(c2);
			
		}else{
			//on uncheck, remove cookies
			Cookie kk[]=request.getCookies();			
			if(k!=null && k.length>0){
				for(Cookie c : k){
					if(c.getName().equals("user")){
						c.setMaxAge(0);
						u="";
						response.addCookie(c);
					}else if(c.getName().equals("pass")){
						c.setMaxAge(0);
						p="";
						response.addCookie(c);
					}
					
				}
			}
			
		}
			
		if(session.getAttribute("pid")!=null){
			String pid=session.getAttribute("pid").toString();
			session.removeAttribute("pid");
			response.sendRedirect("customer/addcart.jsp?pid="+pid);
		}else{
			response.sendRedirect("customer/home.jsp");
		}
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
                                <h2 style="font-family:arial">Login</h2>    
                                </div>                            	
                                <div class="col-md-6">
                                    <label>E-mail</label>
                                    <input class="form-control" name="user" id="user" value="<%=u%>" type="text" placeholder="E-mail / Username">
                                </div>
                                <div class="col-md-6">
                                    <label>Password</label>
                                    <input class="form-control" name="pass" id="pass"  value="<%=p%>" type="password" placeholder="Password">
                                </div>
                                <div class="col-md-12">                                    
                                        <input type="checkbox"  id="remme" name="remme" value="1">
                                        <label for="newaccount">Keep me signed in</label>                                    
                                </div>
                                <div class="col-md-12">
                                    <button class="btn btn-primary" name="btnlogin" value="Login">Login</button>
                                    <a href="forgot.jsp" class="btn btn-link">Forgot Password?</a>
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