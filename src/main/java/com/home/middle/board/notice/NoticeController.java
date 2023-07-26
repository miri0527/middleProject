package com.home.middle.board.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.home.middle.board.BbsDTO;
import com.home.middle.board.BoardFileDTO;
import com.home.middle.util.Pager;

import oracle.jdbc.proxy.annotation.Post;
import retrofit2.http.HTTP;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("list")
	public ModelAndView getBoardList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<BbsDTO> ar = noticeService.getBoardList(pager);
		
		mv.addObject("list", ar);
		mv.setViewName("notice/list");
		
		return mv;
	}
	
	@GetMapping("importantList")
	public ModelAndView getImportantList(NoticeDTO noticeDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<NoticeDTO> ar = noticeService.getImportantList(noticeDTO);
		
		mv.addObject("importantList", ar);
		mv.addObject("notice/importantList");
		
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getBoardDetail(BbsDTO bbsDTO, HttpSession session) throws Exception {
	
		ModelAndView mv = new ModelAndView();
		
		
		bbsDTO = noticeService.getBoardDetail(bbsDTO);
		

		int result = noticeService.setBoardHit(bbsDTO);
		
		mv.addObject("boardDTO", bbsDTO);
		mv.setViewName("notice/detail");
		
		return mv;
		
	}
	
	@GetMapping("add")
	public ModelAndView setBoardAdd() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("notice/add");
		
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setBoardAdd(NoticeDTO noticeDTO, MultipartFile[] addfiles, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = noticeService.setBoardAdd(noticeDTO,addfiles, session);
		
		String message = null;
		if(result > 0) {
			 message = "등록되었습니다.";
		}
		
		mv.addObject("result", message);
		mv.setViewName("common/result");
		
		mv.addObject("url", "./list");
		
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setBoardUpdate(NoticeDTO noticeDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		BbsDTO bbsDTO =  noticeService.getBoardDetail(noticeDTO);
		
		mv.addObject("detail", bbsDTO);
		mv.setViewName("notice/update");
	
		return mv;
		
		
	}

	

}
