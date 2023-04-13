package com.home.middle.manager;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.home.middle.cart.CartDTO;
import com.home.middle.cart.CartService;
import com.home.middle.member.MemberDTO;
import com.home.middle.member.MemberService;
import com.home.middle.util.Pager;

@Controller
@RequestMapping(value = "/manager/*")
public class ManagerController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private CartService cartService;
	
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
	
	@GetMapping("cartList")
	public ModelAndView getCartList(HttpSession session, Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(session.getAttribute("member")!=null) {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		List<CartDTO> ar = cartService.getMemberCartList(pager);
		
		mv.addObject("list", ar);
		mv.setViewName("manager/cartList");
		}
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
	
}
