<!-- Include header.jsp -->
<%@page import="com.shop.models.Product"%>
<%@page import="com.shop.services.ProductService"%>
<%@page import="com.shop.models.Category"%>
<%@page import="com.shop.services.CategoryService"%>
<%@ include file="cheader.jsp" %> 

<!--  Contents -->        
<div class="container-fluid">
<div class="row">
<div class="col-md-3">

<nav class="navbar bg-light">
 <ul class="navbar-nav">
 		<%
 		CategoryService service=new CategoryService();
 		for(Category cat : service.list()){
 		%>
        <li class="nav-item">
            <a class="nav-link" href="?cid=<%=cat.getId()%>"><img src="${pageContext.request.contextPath}/catuploads/<%=cat.getCategoryImage()%>" width="40" height="40" alt="NA" class="rounded"/><%=cat.getCategoryName() %></a>
        </li>
        <%
 		}
        %>
        
    </ul>
</nav>
                    
</div>
<div class="col-md-9">
<!-- Featured Product Start -->
        <div class="featured-product product">
            <div class="container-fluid">
                <div class="section-header">
                    <h1>Featured Stock</h1>
                </div>                
                	<%
                	ProductService service2=new ProductService();
                	for(Product prod : service2.list()){
                	%>                	
                    <div class="col-md-3">
                        <div class="product-item">
                            <div class="product-title">
                                <a href="#"><%=prod.getProductName() %></a>
                                <div class="ratting">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            </div>
                            <div class="product-image">
                                <a href="product-detail.html">
                                    <img src="${pageContext.request.contextPath}/productupload/<%=prod.getProductImage()%>" width="100" height="100" alt="Product Image">
                                </a>
                                <div class="product-action">
                                    <a href="#"><i class="fa fa-cart-plus"></i></a>
                                    <a href="#"><i class="fa fa-heart"></i></a>
                                    <a href="#"><i class="fa fa-search"></i></a>
                                </div>
                            </div>
                            <div class="product-price">
                                <h3><span>Rs </span><%=prod.getProductcost() %></h3>
                                <a class="btn" href="addcart.jsp?pid=<%=prod.getId() %>"><i class="fa fa-shopping-cart"></i>Buy Now</a>
                            </div></br>
                        </div>
                    </div>                    
                    <%
                	}
                    %>
                   
                
            </div>
        </div>
        <!-- Featured Product End -->     
</div>
</div>
</div>        
        <!-- Category Start-->
      
        
      
        <!-- Call to Action End -->       
        
          
        
        <!-- Newsletter Start -->
        <div class="newsletter">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <h1>Subscribe Our Newsletter</h1>
                    </div>
                    <div class="col-md-6">
                        <div class="form">
                            <input type="email" value="Your email here">
                            <button>Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Newsletter End -->        
        
        <!-- Recent Product Start -->
      
        <!-- Recent Product End -->
        
        <!-- Review Start -->
        <div class="review">
            <div class="container-fluid">
                <div class="row align-items-center review-slider normal-slider">
                    <div class="col-md-6">
                        <div class="review-slider-item">
                            <div class="review-img">
                                <img src="review.png" alt="Image">
                            </div>
                            <div class="review-text">
                                <h2>Customer Name</h2>
                                <h3>Profession</h3>
                                <div class="ratting">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae nunc eget leo finibus luctus et vitae lorem
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="review-slider-item">
                            <div class="review-img">
                                <img src="r_2.jpg" alt="Image">
                            </div>
                            <div class="review-text">
                                <h2>Customer Name</h2>
                                <h3>Profession</h3>
                                <div class="ratting">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae nunc eget leo finibus luctus et vitae lorem
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="review-slider-item">
                            <div class="review-img">
                                <img src="review-3.jpg" alt="Image">
                            </div>
                            <div class="review-text">
                                <h2>Customer Name</h2>
                                <h3>Profession</h3>
                                <div class="ratting">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae nunc eget leo finibus luctus et vitae lorem
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Review End -->  

<!-- Include footer.jsp -->
<%@ include file="cfooter.jsp" %>