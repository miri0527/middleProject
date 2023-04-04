package com.home.middle.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {
	
	@Autowired
	private CartDAO cartDAO;
	
	public List<CartDTO> getCartList(MemberDTO memberDTO) throws Exception{
		return cartDAO.getCartList(memberDTO);
	}
	
	public int setCartAdd(CartDTO cartDTO) throws Exception{
		return cartDAO.setCartAdd(cartDTO);
	}
	
	public int setCartDelete(CartDTO cartDTO) throws Exception{
		return cartDAO.setCartDelete(cartDTO);
	}
	
	public int setCartClear(CartDTO cartDTO) throws Exception{
		return cartDAO.setCartClear(cartDTO);
	}
	
	public int setCartPayment(CartDTO cartDTO) throws Exception{
		long temp = cartDTO.getProductEa();
		
		ProductOptionDTO productOptionDTO = cartDAO.getOptionDetail(cartDTO);
		while(true) {
			cartDTO.setProductEa(productOptionDTO.getProductStock() - temp);
			cartDAO.setOptionUpdate(cartDTO);
			cartDTO.setOptionNum(productOptionDTO.getRef());
			productOptionDTO = cartDAO.getOptionDetail(cartDTO);
			if(productOptionDTO.getDepth() == 0) {
				cartDTO.setProductEa(productOptionDTO.getProductStock() - temp);
				cartDAO.setOptionUpdate(cartDTO);
				break;
			}
		}
		return cartDAO.setCartPayment(cartDTO);
	}
	
	public int setCartPaymentCancel(CartDTO cartDTO) throws Exception{
		long temp = cartDTO.getProductEa();
		
		ProductOptionDTO productOptionDTO = cartDAO.getOptionDetail(cartDTO);
		while(true) {
			cartDTO.setProductEa(productOptionDTO.getProductStock() + temp);
			cartDAO.setOptionUpdate(cartDTO);
			cartDTO.setOptionNum(productOptionDTO.getRef());
			productOptionDTO = cartDAO.getOptionDetail(cartDTO);
			if(productOptionDTO.getDepth() == 0) {
				cartDTO.setProductEa(productOptionDTO.getProductStock() + temp);
				cartDAO.setOptionUpdate(cartDTO);
				break;
			}
		}
		return cartDAO.setCartPaymentCancel(cartDTO);
	}
	
	public CartDTO getCartPaymentDetail(CartDTO cartDTO) throws Exception{
		return cartDAO.getCartPaymentDetail(cartDTO);
	}
	public int getCartUpdate(CartDTO cartDTO) throws Exception{
		return cartDAO.getCartUpdate(cartDTO);
	}
	public List<CartDTO> getCartPaymentList(MemberDTO memberDTO) throws Exception{
		return cartDAO.getCartPaymentList(memberDTO);
	}
	
	//임시로 가져오는거임
	public ProductDTO getProductDetail(ProductDTO productDTO) throws Exception{
		return cartDAO.getProductDetail(productDTO);
	}
}
