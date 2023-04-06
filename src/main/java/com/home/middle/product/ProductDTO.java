package com.home.middle.product;


import java.util.List;


public class ProductDTO {
	private String id;
	private Long r;
	private Long productNum;
	private String productName;
	private Long productPrice;
	private Long discount;
	private Double discountPercent;
	private Integer productSales;
	private Long categoryNum;
	private Long optionNum;
	private String optionName;
	private List<ProductOptionDTO> productOptionDTOs;
	private List<ProductImgDTO> productImgDTOs;
	
	public Long getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Long productPrice) {
		this.productPrice = productPrice;
	}
	public Long getOptionNum() {
		return optionNum;
	}
	public void setOptionNum(Long optionNum) {
		this.optionNum = optionNum;
	}
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public Long getR() {
		return r;
	}
	public void setR(Long r) {
		this.r = r;
	}
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Long getDiscount() {
		return discount;
	}
	public void setDiscount(Long discount) {
		this.discount = discount;
	}
	public Double getDiscountPercent() {
		return discountPercent;
	}
	public void setDiscountPercent(Double discountPercent) {
		this.discountPercent = discountPercent;
		
	}
	public Integer getProductSales() {
		return productSales;
	}
	public void setProductSales(Integer productSales) {
		this.productSales = productSales;
	}

	public Long getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(Long categoryNum) {
		this.categoryNum = categoryNum;
	}
	public List<ProductOptionDTO> getProductOptionDTOs() {
		return productOptionDTOs;
	}
	public void setProductOptionDTOs(List<ProductOptionDTO> productOptionDTOs) {
		this.productOptionDTOs = productOptionDTOs;
	}
	public List<ProductImgDTO> getProductImgDTOs() {
		return productImgDTOs;
	}
	public void setProductImgDTOs(List<ProductImgDTO> productImgDTOs) {
		this.productImgDTOs = productImgDTOs;
	}
	
	
	
	
	
	
	
	
	
	
	
}
