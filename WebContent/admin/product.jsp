<%@page import="com.shop.models.ProductView"%>
<%@page import="com.shop.models.Category"%>
<%@page import="com.shop.services.CategoryService"%>
<%@page import="com.shop.models.Product"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="com.shop.services.ProductService"%>
<%@page import="com.shop.models.Product"%>
<%@page import="java.util.List"%>
<%@ include file="aheader.jsp"%>
<%
ProductService service=new ProductService();
String id="",name="",desc="",catid="",cost="",qty="",msg="",btntext="Save",fname="";
String uploadpath=request.getRealPath("/productupload/");

if(MultipartFormDataRequest.isMultipartFormData(request)){
	MultipartFormDataRequest mreq=new MultipartFormDataRequest(request);
if(mreq.getParameter("btnsave")!=null){ //if save button is clicked
	id=mreq.getParameter("id");
	name=mreq.getParameter("name");
	desc=mreq.getParameter("desc");
	catid=mreq.getParameter("catid");
	cost=mreq.getParameter("cost");
	qty=mreq.getParameter("qty");	
	if(mreq.getParameter("btnsave").equals("Save")){
		Hashtable ht=mreq.getFiles(); 
		//collection of key value pairs
		//Key=>fileuploadname[photo] ==> value[UploadFile class object]
		if(ht!=null && !ht.isEmpty()){
			UploadFile uf=(UploadFile)ht.get("proimg");
			fname=uf.getFileName();
			UploadBean ub=new UploadBean();
			ub.setFolderstore(uploadpath); //Save uploaded file to this folder
			ub.store(mreq, "proimg"); //read photo field data and save to file at given folder store
		}
		Product pro=new Product();		
		pro.setProductName(name);
		pro.setProductDescription(desc);
		pro.setCategoryId(Integer.parseInt(catid));
		pro.setProductcost(Double.parseDouble(cost));
		pro.setProductQty(Integer.parseInt(qty)); 
		pro.setProductImage(fname);
		service.saveOrUpdate(pro);
		msg="Product is Saved....";
	}else{
		Hashtable ht=mreq.getFiles(); 
		Product pro=service.get(id);
		if(ht!=null && !ht.isEmpty()){
			UploadFile uf=(UploadFile)ht.get("proimg");
			fname=uf.getFileName();
			if(fname!=null && !fname.equals("")){				
				UploadBean ub=new UploadBean();
				ub.setFolderstore(uploadpath); //Save uploaded file to this folder
				ub.store(mreq, "proimg"); //read photo field data and save to file at given folder store
				pro.setProductName(name);
				pro.setProductDescription(desc);
				pro.setCategoryId(Integer.parseInt(catid));
				pro.setProductcost(Double.parseDouble(cost));
				pro.setProductQty(Integer.parseInt(qty)); 
				pro.setProductImage(fname);
				service.saveOrUpdate(pro);
			}
			else{
				pro.setProductName(name);
				pro.setProductDescription(desc);
				pro.setCategoryId(Integer.parseInt(catid));
				pro.setProductcost(Double.parseDouble(cost));
				pro.setProductQty(Integer.parseInt(qty)); 
				service.saveOrUpdate(pro);
			}
		}
		
		msg="Product is Updated....";
	}
	
}
}else{
	//check querystring contains eroll
	if(request.getParameter("eid")!=null){
		Product pro=service.get(request.getParameter("eid"));		
		if(pro!=null){
			id=pro.getId()+"";
			name=pro.getProductName();
			desc=pro.getProductDescription();
			catid=pro.getCategoryId()+"";
			cost=pro.getProductcost()+"";
			qty=pro.getProductQty()+"";			
			fname=pro.getProductImage();
			btntext="Update";			
		}
	}
	if(request.getParameter("did")!=null){		
		service.delete(request.getParameter("did"));				
	}
}

%>  
<div class="container-fluid">
<h2>Manage Product Categories 1</h2>
<!-- Button trigger modal -->
<button type="button" id="btn" class="btn btn-primary float-right" data-toggle="modal" data-target="#div1">New Product</button>
<br>
<br>
<!-- Modal -->
<div class="modal fade" id="div1" data-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">Product Entry Form</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="form1" enctype="multipart/form-data" method="post">
      <div class="modal-body">      	
        <div class="form-group">
		Product Id
		<input name="id" id="id" class="form-control" readonly="readonly" value="(auto)"/>
		</div>
		<div class="form-group">
		Product Name
		<input name="name" id="name" class="form-control"/>
		</div>
		<div class="form-group">
		Product Description
		<textarea name="desc" id="desc" class="form-control"></textarea>
		</div>
		<div class="form-group">
		Product Category
		<select name="catid" id="catid" class="form-control">
		<option value="">-- Select Category --</option>
		<%
		CategoryService ser=new CategoryService();

		List<Category> lt=ser.list();
		for(Category cat : lt){
		%>
		<option value="<%=cat.getId()%>"><%=cat.getCategoryName() %></option>
		<%
		}
		%>
		</select>		
		</div>
		<div class="form-group">
		Product Cost
		<input name="cost" id="cost" class="form-control"/>
		</div>
		<div class="form-group">
		Product Qty
		<input name="qty" id="qty" class="form-control"/>
		</div>
		<div class="form-group">
		Product Image
		<input type="file" name="proimg" id="proimg" class="form-control"/>
		<img id="img1" src="${pageContext.request.contextPath}/productupload/<%=fname%>" alt="NA" width="100" height="100" class="rounded"/>
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
<th>Product Name</th>
<th>Product desc</th>
<th>Cat Id</th>
<th>Cat Name</th>
<th>Product Cost</th>
<th>Product Qty</th>
<th>Product Image</th>
<th>Actions</th>
</tr>
</thead>
<tbody>
<%-- <%
//List<ProductView> lt2=service.listAll();
List<ProductView> lt2=service.listAll();
for(ProductView pro : lt2){
%> --%>

<%
List<ProductView> lt2 = service.listAll();
for(ProductView pro : lt2){
%>
<tr>
<td><%=pro.getId() %></td>
<td><%=pro.getProductName()%></td>
<td><%=pro.getProductDescription() %></td>
<td><%=pro.getCategoryId() %></td>
<td><%=pro.getCategoryName() %></td>
<td><%=pro.getProductCost() %></td>
<td><%=pro.getProductQty() %></td>
<td><img src="${pageContext.request.contextPath}/productupload/<%=pro.getProductImage()%>" alt="NA" width="50" height="50" class="rounded-circle"/></td>
<td>
<a href="?eid=<%=pro.getId() %>" class="btn btn-info">Edit</a>
<a onclick="confirm_delete(<%=pro.getId() %>);" href="#" class="btn btn-danger">Delete</a>
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
	$("#id").val("<%=id%>");
	$("#name").val("<%=name%>");
	$("#desc").val("<%=desc%>");
	$("#catid").val("<%=catid%>");
	$("#cost").val("<%=cost%>");
	$("#qty").val("<%=qty%>");
	$("#img1").attr("src","${pageContext.request.contextPath}/productupload/<%=fname%>");
	
	<%
	}
	%>
	
	//Write jQuery validation
	$("#form1").validate({
				rules:{					
					name:{
						required:true,
						pattern:/^[A-Za-z ]+$/
					},
					desc:{
						required:true
					}
				},
				messages:{					
					name:{
						required:"Product Name is required",
						pattern:"Product Name allows only chars and spaces"
					},
					desc:{
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
	$("#proimg").change(function(){ //runs when u browse file
		
		readURL(this);
		
	});
	
});


</script>