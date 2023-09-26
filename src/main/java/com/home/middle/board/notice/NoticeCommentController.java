package com.home.middle.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import oracle.jdbc.proxy.annotation.Post;


@Controller
public class NoticeCommentController {
	
	@Autowired
	private NoticeCommentService noticeCommentService;
	
	@GetMapping("notice/replyList")
	public ModelAndView getNoticeCommentList(NoticeCommentDTO noticeCommentDTO, NoticeDTO noticeDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<NoticeCommentDTO> ar = noticeCommentService.getNoticeCommentList(noticeCommentDTO, noticeDTO);
	
		
		mv.addObject("list", ar);
		mv.setViewName("notice/replyList");
		
		return mv;
	}
	

	
	@PostMapping("noticeReply/add")
	public ModelAndView setNoticeCommentAdd(NoticeCommentDTO noticeCommentDTO, NoticeDTO noticeDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = noticeCommentService.setNoticeCommentAdd(noticeCommentDTO, noticeDTO);
		
		String message = "등록 실패";
		
		if(result > 0) {
			message = "댓글이 등록되었습니다.";
		}
		
		mv.addObject("result", message);
		mv.setViewName("common/result");
		
		mv.addObject("url", "/notice/detail?num=" + noticeDTO.getNum());
		
		return mv;
		
	}
	
	@PostMapping("noticeReply/delete")
	public ModelAndView setNoticeCommentDelete(NoticeCommentDTO noticeCommentDTO, NoticeDTO noticeDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = noticeCommentService.setNoticeCommentDelete(noticeCommentDTO);
		
		String message="삭제 실패";
		
		if(result > 0) {
			message="댓글이 삭제되었습니다.";
		}
		
		mv.addObject("result", message);
		mv.setViewName("common/result");
		
		mv.addObject("url",  "/notice/detail?num=" + noticeDTO.getNum());
		
		return mv;
	}
	
	@GetMapping("noticeReply/update")
	public ModelAndView setNoticeCommentUpdate(NoticeCommentDTO noticeCommentDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		noticeCommentDTO = noticeCommentService.getNoticeCommentDetail(noticeCommentDTO);
		
		mv.addObject("noticeReply", noticeCommentDTO);
		mv.setViewName("notice/replyList");
		
		return mv;
		
	}
	

}
