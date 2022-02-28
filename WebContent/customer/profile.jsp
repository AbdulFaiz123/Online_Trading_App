<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.Date"%>
<%@page import="com.shop.models.UserProfile"%>
<%@page import="com.shop.models.User"%>
<%@page import="com.shop.services.UserService"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="com.shop.db.SendMail"%>
<%@ include file="cheader.jsp"%>

<%
String msg="";
String custid="",custname="",mobile="",user="";
String address="",gender="",bdate="",photo="";
UserService service=new UserService();
if(MultipartFormDataRequest.isMultipartFormData(request))
{
	MultipartFormDataRequest mreq=new MultipartFormDataRequest(request);
	if(mreq.getParameter("btnsignup")!=null)
	{
		custid=mreq.getParameter("custid");
		custname=mreq.getParameter("custname");
		address=mreq.getParameter("custaddress");
		bdate=mreq.getParameter("bdate");
		gender=mreq.getParameter("gender");
		mobile=mreq.getParameter("mobile");
		user=mreq.getParameter("username");
		
		try
		{	
			User cust=service.getUser(user);
			cust.setName(custname);
			cust.setMobile(mobile);
			service.updateUser(cust);
		
		
			UserProfile cp=service.getProfile(user);		
			if(cp!=null)
			{			
				cp.setBirthDate(Date.valueOf(bdate));
				cp.setGender(gender);
				cp.setUserName(user);
				Hashtable ht=mreq.getFiles();
				UploadFile uf=(UploadFile) ht.get("photo"); //Object get(Object key)
				photo=uf.getFileName();
				if(photo!=null)
				{							
					UploadBean obj=new UploadBean();
					obj.setFolderstore(request.getRealPath("/custimages/")); //returns phyiscal path of folder
					obj.store(mreq, "photo"); //Save as /Upload file					
					
					cp.setPhoto(photo);
					
				}
				service.updateProfile(cp);
				
			}
			else
			{
				//Upload file/Save as file on server			
				Hashtable ht=mreq.getFiles();
				UploadFile uf=(UploadFile) ht.get("photo"); //Object get(Object key)
				photo=uf.getFileName();
				
				
				UploadBean obj=new UploadBean();
				obj.setFolderstore(request.getRealPath("/custimages/")); //returns phyiscal path of folder
				obj.store(mreq, "photo"); //Save as /Upload file
				UserProfile cp1=new UserProfile();
				cp1.setBirthDate(Date.valueOf(bdate));
				cp1.setGender(gender);
				cp.setUserName(user);
				
				cp1.setPhoto(photo);
				
				service.updateProfile(cp1);
				
			}
			msg="Profile Updated";
		}
		catch(Exception ex)
		{
			msg="Error: "+ex.getMessage();	
			ex.printStackTrace();		
		}	
	}
}
else
{
	User cust=service.getUser(session.getAttribute("user")+"");
	if(cust!=null)
	{		
		custname=cust.getName();
		mobile=cust.getMobile();
		user=cust.getEmail();
		address=cust.getAddress();
		//UserProfile cp=service.getProfile(session.getAttribute("user")+"");		
		UserProfile cp=service.getProfile(session.getAttribute("user")+"");
		if(cp!=null)
		{			
			gender=cp.getGender();
			bdate=cp.getBirthDate().toLocalDate().format(DateTimeFormatter.ISO_DATE);
			photo=cp.getPhoto();
	
		}
	
	}
	
}
%>
 <div class="container">
            <div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div class="contact-form-right">
                        <h2>User PROFILE</h2>
                        <p>Manage User Profile</p>
                        <form id="form1" name="form1" method="post" enctype="multipart/form-data">                        
                        <fieldset>
                        <legend>User Personal Information</legend>
                        	<div class="row">
                            	<div class="col-md-12">
                            	<img src="../custimages/<%=photo%>" width="80" height="80" alt="NA" class="rounded-circle"/>
                            	</div>
                            </div>
                            <div class="row">
                            	<div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="custname" name="custname" placeholder="User Name" required data-error="Please enter your name" value="<%=custname%>">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>    
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <textarea class="form-control" id="custaddress" name="custaddress" placeholder="User Address" required data-error="Please enter your address"><%=address%></textarea>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div> 
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="date" class="form-control" id="bdate" name="bdate" placeholder="User BDate" required data-error="Please enter your BirthDate" value="<%=bdate%>">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <select name="gender" class="form-control" required data-error="Please enter your gender">
                                        <option value="">--select gender --</option>
                                        <option <%=gender.equals("Male")?"selected":"" %> value="Male">Male</option>
                                        <option <%=gender.equals("Female")?"selected":"" %> value="Female">Female</option>
                                        </select>                                       
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>    
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="mobile" name="mobile" placeholder="Mobile no" required data-error="Please enter your mobile no" value="<%=mobile%>">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div> 
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="username" name="username" placeholder="User EmailID" required data-error="Please enter your emailid" value="<%=user%>" readonly="readonly">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>                                
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="file" class="form-control" id="photo" name="photo"/>                                        
                                    </div>
                                </div>
                                
                                <div class="col-md-12">                                    
                                    <div class="submit-button text-center">
                                        <button class="btn hvr-hover" id="submit" type="submit" name="btnsignup" value="Register">Update Profile</button>                                        
                                        <span id="sp" class="h3 text-center hidden"></span>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
                </div>
                </div>
<%@ include file="cfooter.jsp"%>
<script>
$("#sp").html("<%=msg%>");

$(function(){
	$("#form1").validate({
		rules:{
			custname:{
				required:true,
				pattern:/^[a-zA-Z ]+$/
			},
			mobile:{
				required:true,
				pattern:/^\d{10}$/
			},
			username:{
				required:true,
				email:true				
			},
			password:{
				required:true,
				minlength:5
			},
			cpassword:{
				required:true,
				minlength:5,
				equalTo:"#password"
			}
		},
		messages:{
			custname:{
				required:"User Name is required",
				pattern:"User Name allows only chars and spaces"
			},
			mobile:{
				required:"Mobile No is required",
				pattern:"Mobile No allows only 10 digits",
			},
			username:{
				required:"UserName is required",
				email:"Username should be a valid email"
			},
			password:{
				required:"Password is required",
				minlength:"Min length of Password 5 chars"
			},
			cpassword:{
				required:"Confirm Password is Required",
				minlength:"Min length of Confirm Password 5 chars",
				equalTo:"Password Mismatch"
			}
		}
	});
});
</script>