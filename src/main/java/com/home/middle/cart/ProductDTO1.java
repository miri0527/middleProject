package com.home.middle.cart;

import java.util.List;

public class ProductDTO1 {
	private Long productNum;
	private String productName;
	private Long productPrice;
	private Long optionNum;
	private String optionName;
	
	private List<ProductOptionDTO1> productOptionDTOs;
	
	
	public List<ProductOptionDTO1> getProductOptionDTOs() {
		return productOptionDTOs;
	}
	public void setProductOptionDTOs(List<ProductOptionDTO1> productOptionDTOs) {
		this.productOptionDTOs = productOptionDTOs;
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
	public Long getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Long productPrice) {
		this.productPrice = productPrice;
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
	
}
