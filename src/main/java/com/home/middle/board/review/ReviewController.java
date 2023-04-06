package com.home.middle.board.review;

import java.lang.System.Logger;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.home.middle.board.BbsDTO;
import com.home.middle.product.ProductDTO;
import com.home.middle.util.Pager;

@Controller
@RequestMapping("/review/**")
public class ReviewController {						
	
			@Autowired
			private ReviewService reviewService;
			
			@ModelAttribute("boardName")
			public String getBoardName() {
				return "review";
			}
			
			@RequestMapping(value="list", method = RequestMethod.GET)
			public ModelAndView getBoardList(Pager pager)throws Exception {
			ModelAndView mv = new ModelAndView();
	
			List<BbsDTO> ar = reviewService.getBoardList(pager);
		
			mv.addObject("pager",pager);
			mv.addObject("list",ar);
			mv.setViewName("board/review");
				
			return mv;			
			}
			
			@GetMapping("update")
			public ModelAndView setBoardUpdate(BbsDTO bbsDTO) throws Exception{
			ModelAndView mv = new ModelAndView();
			bbsDTO = reviewService.getBoardDetail(bbsDTO);
			mv.addObject("dto", bbsDTO);
			mv.setViewName("board/update");
			return mv;

			}
			@PostMapping("update")
			public ModelAndView setBoardUpdate(BbsDTO bbsDTO, MultipartFile [] addFiles, HttpSession session, Long [] fileNum)throws Exception{
				ModelAndView mv = new ModelAndView();
				int result = reviewService.setBoardUpdate(bbsDTO, addFiles, session, fileNum);
				
				mv.setViewName("common/result");
				mv.addObject("result", "수정 성공");
				mv.addObject("url", "./list");
				
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
			public ModelAndView setBoardAdd(ReviewDTO reviewDTO, MultipartFile [] files, HttpSession session)throws Exception{
			ModelAndView mv = new ModelAndView();
			int result = reviewService.setBoardAdd(reviewDTO, files, session);
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

				int result = reviewService.setBoardDelete(bbsDTO, session);

				String message="삭제 실패";

				if(result>0) {
					message="삭제 성공";
				}

				mv.addObject("result", message);
				mv.addObject("url", "./list");

				return mv;
			}
			
			@GetMapping("listTop")
			public ModelAndView getReviewListTop(Pager pager) throws Exception{
			ModelAndView mv = new ModelAndView();
			pager.setPerPage(5L);
			
			List<BbsDTO> ar = reviewService.getBoardList(pager);
			
			mv.addObject("list", ar);
			mv.setViewName("common/noticeResult");
			return mv;
			
			}
			
}
