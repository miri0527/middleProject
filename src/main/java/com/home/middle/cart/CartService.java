package com.home.middle.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.middle.member.MemberDTO;
import com.home.middle.product.ProductDTO;
import com.home.middle.product.ProductOptionDTO;
import com.home.middle.util.Pager;

@Service
public class CartService {
	
	@Autowired
	private CartDAO cartDAO;
	
	public int getPaymentCheck(List<CartDTO> cartDTOs, String amount) throws Exception{
		
		long sum = 0;
		
		for(CartDTO cartDTO : cartDTOs) {
			cartDTO = cartDAO.getPaymentCheck(cartDTO);
			sum = sum + cartDTO.getTotalPrice();
		}
		
		long a = Long.parseLong(amount);
		
		if(sum == a) {
			return 1;
		}else {
			return 0;
		}
		
	}
	public List<CartDTO> getCartOptionName(MemberDTO memberDTO) throws Exception{
	      List<CartDTO> arr = cartDAO.getCartList(memberDTO);
	      
	      int result=0;
	      for(int i =0; i<arr.size(); i++) {
	        
	         
	         Long num = cartDAO.setCartOptionRef(arr.get(i).getOptionNum());
	         
	         String name=cartDAO.setCartOptionName(arr.get(i).getOptionNum());
	         
	         name=cartDAO.setCartOptionName(num)+"-"+name;
	         num=cartDAO.setCartOptionRef(num);
	         
	         name=cartDAO.setCartOptionName(num)+"-"+name;
	         num=cartDAO.setCartOptionRef(num);
	         
	         arr.get(i).setOptionName(name);
	      }
	      
	      return arr;
	   }
	public void setPayment(List<CartDTO> cartDTOs, MemberDTO memeberDTO) throws Exception{
		ProductPaymentDTO productPaymentDTO = new ProductPaymentDTO();
		Long a = cartDAO.getPaymentNum();
		productPaymentDTO.setPaymentNum(a);
		productPaymentDTO.setPaymentName(Long.toString(a));
		System.out.println(productPaymentDTO.getPaymentName());
		cartDAO.setPaymentInsert(productPaymentDTO);
		for(CartDTO cartDTO : cartDTOs) {
			cartDTO.setId(memeberDTO.getId());
			cartDTO.setPaymentCheck(1L);
			cartDTO.setBuyCheck(1L);
			cartDTO.setPaymentNum(a);
			cartDAO.setCartUpdate(cartDTO);
		}
	}
	
	public List<CartDTO> getCartList(MemberDTO memberDTO) throws Exception{
		return cartDAO.getCartList(memberDTO);
	}
	
	public List<CartDTO> getMemberCartList(Pager pager) throws Exception {
		  pager.makeRow();
		  
		  pager.makeNum(cartDAO.getTotalCount(pager));
		  
		return cartDAO.getMemberCartList(pager);
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
	
	
}