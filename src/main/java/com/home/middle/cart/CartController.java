package com.home.middle.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.home.middle.member.MemberDTO;
import com.home.middle.product.ProductDTO;
import com.home.middle.product.ProductService;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("cartList")
	public ModelAndView getCartList(HttpSession session) throws Exception{
		//member 연동해서 아이디에 따른 장바구니 가져오기
		ModelAndView mv = new ModelAndView();
		//임시 아이디 설정
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId("TEST2");
	
		List<CartDTO> ar = cartService.getCartList(memberDTO);
		System.out.println(ar.size());
		mv.addObject("list", ar);
		mv.setViewName("/cart/cartList");
//		if(session.getAttribute("member")!=null) {
//			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
//			
//			List<CartDTO> ar = cartService.getCartList(memberDTO);
//			
//			mv.addObject("list", ar);
//			mv.setViewName("/cart/cartPayment");
//		}else {
//			mv.setViewName("redirect:../");
//		}
		return mv;
	}
	
	@GetMapping("cartAdd")
	public ModelAndView setCartAdd() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		//임시 아이디 설정
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId("test");
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProductNum(17L);//임시 수정
		productDTO = productService.getProductDetail(productDTO);
		
		mv.addObject("mDTO", memberDTO);
		mv.addObject("pDTO", productDTO);
		mv.setViewName("/cart/cartAdd");
		return mv;
		
	}
	
	@PostMapping("cartAdd")
	public ModelAndView setCartAdd(CartDTO cartDTO, ProductDTO productDTO) throws Exception{
	
		System.out.println("카트"+ cartDTO.getOptionNum());
		System.out.println("상품"+ productDTO.getOptionNum());
		ModelAndView mv = new ModelAndView();
    	cartDTO.setProductDTO(productDTO);
		int result = cartService.setCartAdd(cartDTO);
	
		mv.addObject("result", result);
		mv.setViewName("redirect:./cartList");
		
		return mv;
		
	}
	
	@PostMapping("cartDelete")
	public ModelAndView setCartDelete(CartDTO cartDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = cartService.setCartDelete(cartDTO);
		
		
		mv.setViewName("redirect:../cart/cartList");
		
		return mv;
	}
	
	@PostMapping("cartClear")
	public ModelAndView setCartClear(CartDTO cartDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = cartService.setCartClear(cartDTO);
		
		//mv.addObject("result", result);
		mv.setViewName("redirect:./cartList");
		
		return mv;
	}
	
//	@GetMapping("cartPayment")
//	public ModelAndView setCartPayment() throws Exception{
//		ModelAndView mv = new ModelAndView();
//		
//		//임시 아이디 설정
//		MemberDTO memberDTO = new MemberDTO();
//		memberDTO.setId("TEST2");
//		List<CartDTO> ar = cartService.getCartList(memberDTO);
//		
//		mv.addObject("list", ar);
//		mv.setViewName("/cart/cartPayment");
//		
//		return mv;
//	}
//	
//	@PostMapping("cartPayment")
//	public ModelAndView setCartPayment(CartDTO cartDTO) throws Exception{
//		ModelAndView mv = new ModelAndView();
//		
//		int result = cartService.setCartPayment(cartDTO);
//		
//		//mv.addObject("result", result);
//		mv.setViewName("redirect:./cartPayment");
//		
//		return mv;
//	}
//	
//	@PostMapping("cartPaymentCancel")
//	public ModelAndView setCartPaymentCancel(CartDTO cartDTO) throws Exception{
//		ModelAndView mv = new ModelAndView();
//		
//		int result = cartService.setCartPaymentCancel(cartDTO);
//		
//		//mv.addObject("result", result);
//		mv.setViewName("redirect:./cartPayment");
//		
//		return mv;
//	}
	
	@PostMapping("cartPaymentDetail")
	public ModelAndView getCartPaymentDetail(CartDTO cartDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		cartDTO = cartService.getCartPaymentDetail(cartDTO);
		
		mv.addObject("dto", cartDTO);
		mv.setViewName("/cart/cartPaymentDetail");
		
		return mv;
	}
	
	@PostMapping("cartUpdate")
	public ModelAndView getCartUpdate(CartDTO cartDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = cartService.getCartUpdate(cartDTO);
		
		mv.addObject("result", result);
		mv.setViewName("/common/result_1");
		
		return mv;
	}
	
	@PostMapping("cartPayment")
	public ModelAndView setCartPayment(CartDTO cartDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = cartService.setCartPayment(cartDTO);
		
		mv.setViewName("redirect:./cartList");
		return mv;
	}
	
	@PostMapping("cartPaymentCancel")
	public ModelAndView setCartPaymentCancel(CartDTO cartDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = cartService.setCartPaymentCancel(cartDTO);
		mv.setViewName("redirect:./cartList");
		return mv;
	}
	
	@PostMapping("cartSelectedDelete")
	public ModelAndView setCartSelectedDelete(String check[]) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		for(int i = 0; i < check.length; i ++) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setOrderNum(Long.parseLong(check[i]));
			cartService.setCartDelete(cartDTO);
		}
		mv.setViewName("redirect:./cartList");
		return mv;
		
	}
	
	@PostMapping("cartSelectedPayment")
	public ModelAndView setCartSelectedPayment(String check[], String ea[], String opNum[]) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		for(int i = 0; i < check.length; i ++) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setOrderNum(Long.parseLong(check[i]));
			cartDTO.setProductEa(Long.parseLong(ea[i]));
			cartDTO.setOptionNum(Long.parseLong(opNum[i]));
			cartService.setCartPayment(cartDTO);
		}
		mv.setViewName("redirect:./cartList");
		return mv;
	}
	@PostMapping("cartSelectedPaymentCancel")
	public ModelAndView setCartSelectedPaymentCancel(String check[], String ea[], String opNum[]) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		for(int i = 0; i < check.length; i ++) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setOrderNum(Long.parseLong(check[i]));
			cartDTO.setProductEa(Long.parseLong(ea[i]));
			cartDTO.setOptionNum(Long.parseLong(opNum[i]));
			cartService.setCartPaymentCancel(cartDTO);
		}
		mv.setViewName("redirect:./cartList");
		return mv;
	}
	
	@GetMapping("cartPaymentList")
	public ModelAndView setCartPaymentList() throws Exception{
		//member 연동해서 아이디에 따른 장바구니 가져오기
		ModelAndView mv = new ModelAndView();
		//임시 아이디 설정
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId("TEST2");
				
		List<CartDTO> ar = cartService.getCartPaymentList(memberDTO);
		
		mv.addObject("list", ar);
				
		return mv;
	}
}
