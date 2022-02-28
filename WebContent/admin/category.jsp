<%@page import="javazoom.upload.UploadBean"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="com.shop.services.CategoryService"%>
<%@page import="com.shop.models.Category"%>
<%@page import="java.util.List"%>
<%@ include file="aheader.jsp"%>
<%
CategoryService service=new CategoryService();
String id="",name="",desc="",msg="",btntext="Save",fname="";
String uploadpath=request.getRealPath("/catuploads/");

if(MultipartFormDataRequest.isMultipartFormData(request)){
	MultipartFormDataRequest mreq=new MultipartFormDataRequest(request);
if(mreq.getParameter("btnsave")!=null){ //if save button is clicked
	id=mreq.getParameter("catid");
	name=mreq.getParameter("catname");
	desc=mreq.getParameter("catdesc");
	if(mreq.getParameter("btnsave").equals("Save")){
		Hashtable ht=mreq.getFiles(); 
		//collection of key value pairs
		//Key=>fileuploadname[photo] ==> value[UploadFile class object]
		if(ht!=null && !ht.isEmpty()){
			UploadFile uf=(UploadFile)ht.get("catimg");
			fname=uf.getFileName();
			UploadBean ub=new UploadBean();
			ub.setFolderstore(uploadpath); //Save uploaded file to this folder
			ub.store(mreq, "catimg"); //read photo field data and save to file at given folder store
		}
		Category cat=new Category();
		cat.setCategoryName(name);
		cat.setCategoryDescription(desc);
		cat.setCategoryImage(fname);
		service.saveOrUpdate(cat);
		msg="Stock Entry is Saved....";
	}else{
		Hashtable ht=mreq.getFiles(); 
		Category cat=service.get(id);
		if(ht!=null && !ht.isEmpty()){
			UploadFile uf=(UploadFile)ht.get("catimg");
			fname=uf.getFileName();
			if(fname!=null && !fname.equals("")){				
				UploadBean ub=new UploadBean();
				ub.setFolderstore(uploadpath); //Save uploaded file to this folder
				ub.store(mreq, "catimg"); //read photo field data and save to file at given folder store
				cat.setCategoryName(name);
				cat.setCategoryDescription(desc);
				cat.setCategoryImage(fname);
				service.saveOrUpdate(cat);
			}
			else{
				cat.setCategoryName(name);
				cat.setCategoryDescription(desc);
				service.saveOrUpdate(cat);
			}
		}
		
		msg="Category is Updated....";
	}
	
}
}else{
	//check querystring contains eroll
	if(request.getParameter("eid")!=null){
		Category cat=service.get(request.getParameter("eid"));		
		if(cat!=null){
			id=cat.getId()+"";
			name=cat.getCategoryName();
			desc=cat.getCategoryDescription();
			fname=cat.getCategoryImage();
			btntext="Update";			
		}
	}
	if(request.getParameter("did")!=null){		
		service.delete(request.getParameter("did"));				
	}
}

%>  
<div class="container-fluid">
<h2>Manage Stock Categories</h2>
<!-- Button trigger modal -->
<button type="button" id="btn" class="btn btn-primary float-right" data-toggle="modal" data-target="#div1">New Category</button>
<br>
<br>
<!-- Modal -->
<div class="modal fade" id="div1" data-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">Category Entry Form</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="form1" enctype="multipart/form-data" method="post">
      <div class="modal-body">      	
        <div class="form-group">
		Category Id
		<input name="catid" id="catid" class="form-control" readonly="readonly" value="(auto)"/>
		</div>
		<div class="form-group">
		Category Name
		<input name="catname" id="catname" class="form-control"/>
		</div>
		<div class="form-group">
		Category Description
		<textarea name="catdesc" id="catdesc" class="form-control"></textarea>
		</div>
		<div class="form-group">
		Category Image
		<input type="file" name="catimg" id="catimg" class="form-control"/>
		<img id="img1" src="${pageContext.request.contextPath}/catuploads/<%=fname%>" alt="NA" width="100" height="100" class="rounded"/>
		</div>		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" id="btnsave" name="btnsave" class="btn btn-primary" value="<%=btntext %>"><%=btntext %></button>
        <br>
		<span class="badge badge-secondary" id="s1"></span>
      </div>
      </form>
    </div>
  </div>
</div>

<table id="table1" class="table table-bordered" style="width:100%">
<thead>
<tr>
<th>Id</th>
<th>Category Name</th>
<th>Category description</th>
<th>Category Image</th>
<th>Actions</th>
</tr>
</thead>
<tbody>
<%

List<Category> lt=service.list();
for(Category cat : lt){
%>
<tr>
<td><%=cat.getId() %></td>
<td><%=cat.getCategoryName() %></td>
<td><%=cat.getCategoryDescription() %></td>
<td><img src="${pageContext.request.contextPath}/catuploads/<%=cat.getCategoryImage()%>" alt="NA" width="50" height="50" class="rounded-circle"/></td>
<td>
<a href="?eid=<%=cat.getId() %>" class="btn btn-info">Edit</a>
<a onclick="confirm_delete(<%=cat.getId() %>);" href="#" class="btn btn-danger">Delete</a>
</td>
</tr>
<%
}
%>
</tbody>
</table>


</div>


<%@ include file="afooter.jsp"%>
<script>
function confirm_delete(catid){
	swal({
		  title: "Are you sure?",
		  text: "Once deleted, you will not be able to recover this record!",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		    window.location="?did="+catid; //redirect to URL[change browser location]
		  } else {
		    //swal("Your imaginary file is safe!");
		    
		  }
		});
}
$(function(){
	$("#table1").DataTable();
	<%
	if(!msg.equals("")){
	%>
	swal("<%=msg%>");
	<%
	}
	%>
	
	<%
	if(!btntext.equals("Save")){
	%>
	$("#div1").modal("show");
	$("#catid").val("<%=id%>");
	$("#catname").val("<%=name%>");
	$("#catdesc").val("<%=desc%>");
	$("#img1").attr("src","${pageContext.request.contextPath}/catuploads/<%=fname%>");
	
	<%
	}
	%>
	
	//Write jQuery validation
	$("#form1").validate({
				rules:{
					
					catname:{
						required:true,
						pattern:/^[A-Za-z ]+$/
					},
					catdesc:{
						required:true
					}
				},
				messages:{					
					catname:{
						required:"Category Name is required",
						pattern:"Category Name allows only chars and spaces"
					},
					catdecs:{
						required:"Description is required"
					}
				}
			});
	
	//Preview uploaded file
	function readURL(input){
		if(input.files && input.files[0]){			
			var reader=new FileReader();
			reader.onload=function(e){
				$("#img1").attr("src",e.target.result);
			};
			reader.readAsDataURL(input.files[0]);
		}
		//console.log("executed");
	}
	$("#catimg").change(function(){ //runs when u browse file
		
		readURL(this);
		
	});
	
});


</script>