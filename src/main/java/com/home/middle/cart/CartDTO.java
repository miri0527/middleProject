package com.home.middle.cart;

import java.sql.Date;

import com.home.middle.product.ProductDTO;


public class CartDTO {
	private Long orderNum;
	private String id;
	private Long totalPrice;
	private Long productEa;
	private Date orderDate;
	private Long buyCheck;
	private Long paymentCheck;
	private Long optionNum;
	private ProductDTO productDTO;
	
	
	
	
	
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
	public Long getPaymentCheck() {
		return paymentCheck;
	}
	public void setPaymentCheck(Long paymentCheck) {
		this.paymentCheck = paymentCheck;
	}
	public Long getOptionNum() {
		return optionNum;
	}
	public void setOptionNum(Long optionNum) {
		this.optionNum = optionNum;
	}
	public Long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Long totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Long getProductEa() {
		return productEa;
	}
	public void setProductEa(Long productEa) {
		this.productEa = productEa;
	}
	
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Long getBuyCheck() {
		return buyCheck;
	}
	public void setBuyCheck(Long buyCheck) {
		this.buyCheck = buyCheck;
	}
}
