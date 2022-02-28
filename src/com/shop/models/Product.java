package com.shop.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
public class Product {
	@javax.persistence.Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	private String ProductName;
	private String ProductDescription;
	private int CategoryId;
	private double ProductCost;
	private int ProductQty;
	private String ProductImage;
	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public String getProductDescription() {
		return ProductDescription;
	}
	public void setProductDescription(String productDescription) {
		ProductDescription = productDescription;
	}
	
	public double getProductcost() {
		return ProductCost;
	}
	public void setProductcost(double productcost) {
		this.ProductCost = productcost;
	}
	public String getProductImage() {
		return ProductImage;
	}
	public void setProductImage(String productImage) {
		this.ProductImage = productImage;
	}
	public int getProductQty() {
		return ProductQty;
	}
	public void setProductQty(int productQty) {
		ProductQty = productQty;
	}
	public int getCategoryId() {
		return CategoryId;
	}
	public void setCategoryId(int categoryId) {
		CategoryId = categoryId;
	}
	

}
