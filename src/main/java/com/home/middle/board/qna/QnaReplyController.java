package com.home.middle.board.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.home.middle.product.ProductDTO;
import com.home.middle.util.Pager;


@Controller
@RequestMapping("/qnaReply/**")
public class QnaReplyController {
	
	@Autowired
	private  QnaReplyService  qnaReplyService;
	
	@ModelAttribute("boardName")
	public String getBoardName() {
		return "QnaReply";
	}
	
	@GetMapping("list")
	public ModelAndView getBoardList(Pager pager)throws Exception {
	ModelAndView mv = new ModelAndView();

	List<QnaReplyDTO> ar = qnaReplyService.getBoardList(pager);

	mv.addObject("pager",pager);
	mv.addObject("list3",ar);
	mv.setViewName("product/detail");
		
	return mv;			
	}
	
	@GetMapping("listdetail")
	public ModelAndView getBoardListdetail(Pager pager)throws Exception {
	ModelAndView mv = new ModelAndView();

	List<QnaReplyDTO> ar = qnaReplyService.getBoardList(pager);

	mv.addObject("pager",pager);
	mv.addObject("list",ar);
	mv.setViewName("board/boardList");
		
	return mv;			
	}
	
	
	//글쓰기 
//	@GetMapping("add")
//	public ModelAndView SetBoardAdd(ProductDTO productDTO) throws Exception{
//	ModelAndView mv = new ModelAndView();
//	mv.addObject("dto",productDTO);
//	mv.setViewName("board/add");
//	return mv;
//	}
//	
	
	@GetMapping("add")
	public ModelAndView SetBoardAdd(QnaReplyDTO qnaReplyDTO) throws Exception{
	ModelAndView mv = new ModelAndView();
	mv.addObject("dto",qnaReplyDTO);
	mv.setViewName("board/add");
	return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setBoardAdd(QnaReplyDTO qnaDTO, MultipartFile [] files, HttpSession session)throws Exception{
	ModelAndView mv = new ModelAndView();
	int result = qnaReplyService.setBoardAdd(qnaDTO, files, session);
	String message = "등록이 실패했습니다.";
	if(result>0) {
		 message = "등록을 성공했습니다.";
	}
	
	mv.addObject("result", result);
	mv.addObject("url", "./listdetail");
	mv.setViewName("common/result");
	return mv;
	}	
	
	@PostMapping("delete")
	public ModelAndView setBoardDelete(QnaReplyDTO bbsDTO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/result");

		int result = qnaReplyService.setBoardDelete(bbsDTO, session);

		String message="삭제 실패";

		if(result>0) {
			message="삭제 성공";
		}

		mv.addObject("result", message);
		mv.addObject("url", "./listdetail");

		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setBoardUpdate(QnaReplyDTO bbsDTO) throws Exception{
	ModelAndView mv = new ModelAndView();
	bbsDTO = qnaReplyService.getBoardDetail(bbsDTO);
	mv.addObject("dto", bbsDTO);
	mv.setViewName("board/update");
	return mv;

	}
	@PostMapping("update")
	public ModelAndView setBoardUpdate(QnaReplyDTO bbsDTO, MultipartFile [] addFiles, HttpSession session, Long [] fileNum)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = qnaReplyService.setBoardUpdate(bbsDTO, addFiles, session, fileNum);
		
		mv.setViewName("common/result");
		mv.addObject("result", "수정 성공");
		mv.addObject("url", "./listdetail");
		
		return mv;
	}
	
	
	//디테일 페이지에 productnum 기준으로 뿌리기 
	@GetMapping("listqnaTop")
	public ModelAndView getQnaListTop(Pager pager) throws Exception{
	ModelAndView mv = new ModelAndView();
	pager.setPerPage(5L);
	
	List<QnaReplyDTO> ar = qnaReplyService.getBoardList(pager);
	
	mv.addObject("list", ar);
	mv.setViewName("common/qnaResult");
	return mv;
	
	}
	
	@GetMapping("detail")
	public ModelAndView getBoardDetail(QnaReplyDTO qnaDTO) throws Exception {
		ModelAndView mv = new ModelAndView(); 
		 QnaReplyDTO bbsDTO = qnaReplyService.getBoardDetail(qnaDTO);
		 mv.addObject("dto", bbsDTO);
		 mv.setViewName("board/detail");
		 return mv;
		
	}
	
}
