<%@page import="com.shop.models.Feedback"%>
<%@page import="com.shop.services.FeedbackService"%>
<%@page import="com.shop.db.SendMail"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>

<%
String msg="";

if(request.getParameter("btn")!=null)
{
	FeedbackService service=new FeedbackService();
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String body=request.getParameter("msg");	
	Feedback obj=new Feedback();
	obj.setName(name);
	obj.setEmail(email);
	obj.setMsg(body);
	service.saveOrUpdate(obj);	
	msg="Information submitted";
		
	
}

%>
<script src="//cdn.ckeditor.com/4.14.0/full/ckeditor.js"></script>
 <div class="container">
            <div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div class="contact-form-right">
                        <h2>CONTACT US/FEEDBACK FORM</h2>
                        <p>Contact Us</p>
                        <form id="form1" name="form1" method="post">
                            <div class="row">
                            	<div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="Customer Name" required data-error="Please enter your name">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>   
                                 
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="email" class="form-control" id="email" name="email" placeholder="Your EmailID" required data-error="Please enter your emailid">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <textarea name="msg" id="msg" clas="form-control"></textarea>
                                        <script>
                        					CKEDITOR.replace( 'msg' );
                						</script>                                        
                                    </div>
                                </div>                                
                                
                                <div class="col-md-12">                                    
                                    <div class="submit-button text-center">
                                        <button class="btn hvr-hover" id="submit" type="submit" name="btn" value="Feedback">Submit</button>                                        
                                        <span id="sp" class="h3 text-center hidden"></span>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                </div>
                </div>
<%@ include file="footer.jsp"%>
<script>
$("#sp").html("<%=msg%>");

$(function(){
	$("#form1").validate({
		rules:{
			name:{
				required:true,
				pattern:/^[a-zA-Z ]+$/
			},
			msg:{
				required:true				
			},
			email:{
				required:true,
				email:true				
			}
			
		},
		messages:{
			name:{
				required:"Name is required",
				pattern:"Name allows only chars and spaces"
			},
			msg:{
				required:"Message is required"
			},
			email:{
				required:"UserName is required",
				email:"Username should be a valid email"
			}
		}
	});
});
</script>