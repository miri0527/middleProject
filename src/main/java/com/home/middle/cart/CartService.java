package com.home.middle.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.middle.member.MemberDTO;
import com.home.middle.product.ProductDTO;
import com.home.middle.util.Pager;

@Service
public class CartService {
	
	@Autowired
	private CartDAO cartDAO;
	
	public List<CartDTO> getCartList(MemberDTO memberDTO) throws Exception{
		return cartDAO.getCartList(memberDTO);
	}
	
	public List<CartDTO> getMemberCartList(MemberDTO memberDTO) throws Exception {
		return cartDAO.getMemberCartList(memberDTO);
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
		return cartDAO.setCartPayment(cartDTO);
	}
	
	public int setCartPaymentCancel(CartDTO cartDTO) throws Exception{
		return cartDAO.setCartPaymentCancel(cartDTO);
	}
	
	public CartDTO getCartPaymentDetail(CartDTO cartDTO) throws Exception{
		return cartDAO.getCartPaymentDetail(cartDTO);
	}
	public int getCartUpdate(CartDTO cartDTO) throws Exception{
		return cartDAO.getCartUpdate(cartDTO);
	}
	
	
}
