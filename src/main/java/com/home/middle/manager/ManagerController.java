package com.home.middle.manager;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.home.middle.cart.CartDTO;
import com.home.middle.cart.CartService;
import com.home.middle.member.MemberDTO;
import com.home.middle.member.MemberService;
import com.home.middle.product.ProductDTO;
import com.home.middle.product.ProductOptionDTO;
import com.home.middle.product.ProductService;
import com.home.middle.util.Pager;

@Controller
@RequestMapping(value = "/manager/*")
public class ManagerController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("memberList")
	public ModelAndView getMemberList(Pager pager, @RequestParam(name = "roleName", required = false) String [] roleName) throws Exception {
		ModelAndView mv = new ModelAndView();
		pager.setRoleName(roleName);
		System.out.println(pager.getRoleName() == null);
		
		List<MemberDTO> ar = memberService.getMemberList(pager);
		
		System.out.println(pager.getAutoStatus());
		
//		System.out.println("AR" + ar.size());
		
		
		mv.addObject("list", ar);
		
		if (ar.size() !=0) {
			System.out.println("RoleName : " + ar.get(0).getRoleDTO().getRoleName());
			mv.setViewName("manager/memberList");
		}
		
		
		
		
		
		return mv;
		
	}
	
	@GetMapping("productList")
	   public ModelAndView getMemberProductList(Pager pager) throws Exception {
	      ModelAndView mv = new ModelAndView();
	      
	      List<ProductDTO> ar =  productService.getMemberProductList(pager);
	     
	      mv.setViewName("manager/productList");
	      mv.addObject("list", ar);
	      
	      return mv;
	   }
	
	@GetMapping("productDetail")
	public ModelAndView getProductOptionDetail(ProductDTO productDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<ProductOptionDTO> ar = productService.getProductOptionDetail(productDTO);
		
		mv.setViewName("manager/productDetail");
		mv.addObject("list", ar);
		
		return mv;
	}
	
	@GetMapping("cartList")
	public ModelAndView getCartList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<CartDTO> ar = cartService.getMemberCartList(pager);
		
		mv.setViewName("manager/cartList");
		mv.addObject("list", ar);
		
		return mv;
	}
	
		
	@GetMapping("cartDetail")
	public ModelAndView getMemberCartDetail(ProductOptionDTO productOptionDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("con1"+productOptionDTO.getProductNum());
		List<ProductOptionDTO> ar = productService.getMemberCartDetail(productOptionDTO);
		
		mv.setViewName("manager/cartDetail");
		mv.addObject("list", ar);
		
		return mv;
	}
	
	@GetMapping("memberDetail")
	public ModelAndView getAdminMemberDetail(MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.getMemberDetail(memberDTO);
		
		mv.addObject("dto", memberDTO);
		mv.setViewName("./manager/memberDetail");
		
		return mv;
	}
	
	@GetMapping("memberUpdate")
	public ModelAndView setAdminMemberUpdate(MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.getMemberDetail(memberDTO);
		
		mv.addObject("dto", memberDTO);
		mv.setViewName("./manager/memberUpdate");
		
		return mv;
	}
	
	@PostMapping("memberUpdate")
	public ModelAndView setAdminMemberUpdate(MemberDTO memberDTO, ModelAndView mv) throws Exception {
		int result = memberService.setAdminMemberUpdate(memberDTO);
		
		mv.setViewName("redirect:./memberDetail?id=" + memberDTO.getId());
		
		return mv;
	}
	
	@PostMapping("memberDelete")
	public ModelAndView setMemberDelete(String[]chkList) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		for(int i=0; i<chkList.length; i++) {
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId(chkList[i]);
			memberService.setMemberDelete(memberDTO);
		}
		
		
		mv.setViewName("redirect:./memberList");
		
		return mv;
		
	}
	
	@PostMapping("delete")
	public ModelAndView setProductDelete(String chkList[],HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
			
			for(int i = 0; i < chkList.length; i ++) {
				ProductDTO productDTO = new ProductDTO();
				productDTO.setProductNum(Long.parseLong(chkList[i]));
				productService.setProductDelete(session, productDTO);
			}
			mv.setViewName("redirect:./productList");
			return mv;
		}
	
	@PostMapping("update")
	public ModelAndView setProductUpdate(ProductDTO productDTO, HttpSession session, MultipartFile[] pics, Long[] fileNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result =  productService.setProductUpdate(productDTO, pics, fileNum, session);
		String message="등록실패";
		
		if(result > 0) {
			message="글이 수정되었습니다";
		}
		
		mv.addObject("result", message);
		mv.setViewName("common/result");
		mv.addObject("url", "./list?categoryNum=" + productDTO.getCategoryNum());
		
		return mv;
	}
	
	
}
