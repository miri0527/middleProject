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

import com.home.middle.board.BbsDTO;
import com.home.middle.board.review.ReviewDTO;
import com.home.middle.product.ProductDTO;
import com.home.middle.util.Pager;


@Controller
@RequestMapping("/qna/**")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@ModelAttribute("boardName")
	public String getBoardName() {
		return "qna";
	}
	
	@RequestMapping(value="list", method = RequestMethod.GET)
	public ModelAndView getBoardList(Pager pager)throws Exception {
	ModelAndView mv = new ModelAndView();

	List<BbsDTO> ar = qnaService.getBoardList(pager);

	mv.addObject("pager",pager);
	mv.addObject("list",ar);
	mv.setViewName("board/boardList");
		
	return mv;			
	}
	
	
	//글쓰기 
	@GetMapping("add")
	public ModelAndView SetBoardAdd(ProductDTO productDTO) throws Exception{
	ModelAndView mv = new ModelAndView();
	mv.addObject("dto",productDTO);
	mv.setViewName("board/add");
	return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setBoardAdd(QnaDTO qnaDTO, MultipartFile [] files, HttpSession session)throws Exception{
	ModelAndView mv = new ModelAndView();
	int result = qnaService.setBoardAdd(qnaDTO, files, session);
	String message = "등록이 실패했습니다.";
	if(result>0) {
		 message = "등록을 성공했습니다.";
	}
	
	mv.addObject("result", result);
	mv.addObject("url", "./list");
	mv.setViewName("common/result");
	return mv;
	}	
	
	@PostMapping("delete")
	public ModelAndView setBoardDelete(BbsDTO bbsDTO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/result");

		int result = qnaService.setBoardDelete(bbsDTO, session);

		String message="삭제 실패";

		if(result>0) {
			message="삭제 성공";
		}

		mv.addObject("result", message);
		mv.addObject("url", "./list");

		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setBoardUpdate(BbsDTO bbsDTO) throws Exception{
	ModelAndView mv = new ModelAndView();
	bbsDTO = qnaService.getBoardDetail(bbsDTO);
	mv.addObject("dto", bbsDTO);
	mv.setViewName("board/update");
	return mv;

	}
	@PostMapping("update")
	public ModelAndView setBoardUpdate(BbsDTO bbsDTO, MultipartFile [] addFiles, HttpSession session, Long [] fileNum)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setBoardUpdate(bbsDTO, addFiles, session, fileNum);
		
		mv.setViewName("common/result");
		mv.addObject("result", "수정 성공");
		mv.addObject("url", "./list");
		
		return mv;
	}
	
	
	//디테일 페이지에 productnum 기준으로 뿌리기 
	@GetMapping("listqnaTop")
	public ModelAndView getQnaListTop(Pager pager) throws Exception{
	ModelAndView mv = new ModelAndView();
	pager.setPerPage(5L);
	
	List<BbsDTO> ar = qnaService.getBoardList(pager);
	
	mv.addObject("list", ar);
	mv.setViewName("common/qnaResult");
	return mv;
	
	}
	
	@GetMapping("detail")
	public ModelAndView getBoardDetail(QnaDTO qnaDTO) throws Exception {
		ModelAndView mv = new ModelAndView(); 
		 BbsDTO bbsDTO = qnaService.getBoardDetail(qnaDTO);
		 mv.addObject("dto", bbsDTO);
		 mv.setViewName("board/detail");
		 return mv;
		
	}
	
}
