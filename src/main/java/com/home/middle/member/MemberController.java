package com.home.middle.member;

import java.util.List;

import javax.servlet.http.Cookie;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.home.middle.product.ProductDTO;
import com.home.middle.util.Pager;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
//	@GetMapping("memberList")
//	public ModelAndView getMemberList(Pager pager) throws Exception {
//		ModelAndView mv = new ModelAndView();
//
//		
//		List<MemberDTO> ar = memberService.getMemberList(pager);
//		
//		mv.addObject("list", ar);
//		mv.setViewName("member/memberList");
//		
//		
//		return mv;
//		
//	}
	
//	@GetMapping("memberList")
//	public ModelAndView getMemberList(Pager pager, @RequestParam(name = "roleName", required = false) String [] roleName) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		pager.setRoleName(roleName);
//		System.out.println(pager.getRoleName() == null);
//		
//		List<MemberDTO> ar = memberService.getMemberList(pager);
//		
////		System.out.println("AR" + ar.size());
//		
//		
//		mv.addObject("list", ar);
//		
//		mv.setViewName("member/memberList");
//		System.out.println("RoleName : " + ar.get(0).getRoleDTO().getRoleName());
//		
//		
//		return mv;
//		
//	}
//	
	
//	@PostMapping("memberDelete")
//	public ModelAndView setMemberDelete(MemberDTO memberDTO) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		
//		int result =  memberService.setMemberDelete(memberDTO);
//		
//		mv.setViewName("redirect:./memberList");
//		
//		return mv;
//		
//	}
	
	@GetMapping("memberIdFind")
	public ModelAndView getMemberIdFind()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberIdFind");
		return mv;
	}
	
	@PostMapping("memberIdFind")
	public ModelAndView getMemberIdFind(String email)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println(email);
		List<String> names=memberService.getMemberIdFind(email);
		
		mv.addObject("name", names);
		mv.setViewName("common/memberId");
		return mv;
	}
	
	@GetMapping("memberPwFind")
	public ModelAndView getMemberPwFind()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberPwFind");
		return mv;
	}
	
	@PostMapping("memberPwFind")
	public ModelAndView getMemberPwFind(MemberDTO memberDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		String pw=memberService.setMemberPwChange(memberDTO);
		
		
		
		mv.addObject("name", pw);
		mv.setViewName("common/memberId");
		return mv;
	}
	
	
	@PostMapping("memberCheck")
	public ModelAndView getMemberCheck(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(memberDTO.getId());
		boolean check = memberService.getMemberCheck(memberDTO);
		System.out.println(check);
		mv.addObject("result", check);
		mv.setViewName("common/memberCheck");
		return mv;
	}
	
	@GetMapping("memberJoin")
	public ModelAndView setMemberAdd() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("./member/memberJoin");
		return mv;
	}
	
	@PostMapping("memberJoin")
	public ModelAndView setMemberAdd(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberService.setMemberJoin(memberDTO);
		
		mv.setViewName("redirect:../");
		return mv;
	}
	
	@GetMapping("memberDetail")
	public ModelAndView getMemberDetail(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO=new MemberDTO();
		memberDTO=(MemberDTO)session.getAttribute("member");
		
		//memberDTO=memberService.getMemberDetail(memberDTO);
		
		mv.addObject("dto", memberDTO);
		mv.setViewName("./member/memberDetail");
		return mv;
	}
	
//	@GetMapping("adminMemberDetail")
//	public ModelAndView getAdminMemberDetail(MemberDTO memberDTO) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		memberDTO = memberService.getMemberDetail(memberDTO);
//		
//		mv.addObject("dto", memberDTO);
//		mv.setViewName("./member/adminMemberDetail");
//		
//		return mv;
//	}
	@GetMapping("memberLogin")
	public ModelAndView getMemberLogin() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("./member/memberLogin");
		return mv;
	}
	@PostMapping("memberLogin")
	public ModelAndView getMemberLogin(MemberDTO memberDTO,HttpSession session,String remember,HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO=memberService.getMemberLogin(memberDTO);
		if(remember != null && memberDTO !=null&& remember.equals("remember")) {
		Cookie cookie = new Cookie("remember",memberDTO.getId() );
		cookie.setMaxAge(60*60*24*7);
		response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("remember","");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		session.setAttribute("member", memberDTO);
		String message="로그인 실패";
		if(memberDTO !=null) {
			message="로그인 성공";
			mv.addObject("url", "/");
		}else {
			mv.addObject("url", "./memberLogin");
		}
		mv.addObject("message", message);
		
		mv.setViewName("common/result");
		return mv;
	}
	@GetMapping("memberUpdate")
	public ModelAndView setMemberUpdate(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO=new MemberDTO();
		memberDTO=(MemberDTO)session.getAttribute("member");
		memberDTO=memberService.getMemberDetail(memberDTO);
		
		mv.addObject("dto", memberDTO);
		mv.setViewName("./member/memberUpdate");
		return mv;
	}
	@PostMapping("memberUpdate")
	public ModelAndView setMemberUpdate(MemberDTO memberDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(memberDTO.getId());
		int result=memberService.setMemberUpdate(memberDTO);
		
		mv.setViewName("redirect:./memberDetail");
		return mv;
	}
	
//	@GetMapping("adminMemberUpdate")
//	public ModelAndView setAdminMemberUpdate(MemberDTO memberDTO) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		memberDTO = memberService.getMemberDetail(memberDTO);
//		
//		mv.addObject("dto", memberDTO);
//		mv.setViewName("./member/adminMemberUpdate");
//		
//		return mv;
//	}
	
//	@PostMapping("adminMemberUpdate")
//	public ModelAndView setAdminMemberUpdate(MemberDTO memberDTO, ModelAndView mv) throws Exception {
//		int result = memberService.setAdminMemberUpdate(memberDTO);
//		
//		mv.setViewName("redirect:./adminMemberDetail?id=" + memberDTO.getId());
//		
//		return mv;
//	}
	
	
	@GetMapping("memberLogout")
	public ModelAndView setMemberLogout(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		session.invalidate();
		mv.setViewName("redirect:../");
		return mv;
	}
	@GetMapping("memberAgree")
	public ModelAndView setMemberAgree() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("./member/memberAgree");
		return mv;
	}
	@GetMapping("memberPwCheck")
	public ModelAndView getMemberPwCheck()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberPwCheck");
		return mv;
	}
	
	@PostMapping("memberPwCheck")
	public ModelAndView getMemberPwCheck(MemberDTO memberDTO,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		MemberDTO pwCheck =(MemberDTO)session.getAttribute("member");
				
		pwCheck=memberService.getMemberDetail(pwCheck);
		boolean check = false;
		mv.addObject("message", "확인");
		
		if(pwCheck.getPw().equals(memberDTO.getPw())) {
			check = true;
			mv.addObject("url", "./memberUpdate");
		}else {
			mv.addObject("url", "./memberPwcheck");
		}
		mv.setViewName("common/result");
		return mv;
	}
}
