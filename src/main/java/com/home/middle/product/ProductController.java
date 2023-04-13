package com.home.middle.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.home.middle.board.BbsDTO;
import com.home.middle.board.qna.QnaReplyDTO;
import com.home.middle.board.qna.QnaReplyService;
import com.home.middle.board.qna.QnaService;
import com.home.middle.board.review.ReviewService;
import com.home.middle.util.Pager;


@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private QnaReplyService qnaReplyService;
	
	
	
	@GetMapping("list")
	public ModelAndView getProductList(ProductDTO productDTO,Pager pager ) throws Exception{
	
		ModelAndView mv = new ModelAndView();

		List<ProductOptionDTO> ar = productService.getProductList(productDTO,pager);
		
		mv.setViewName("product/productList");
	
		mv.addObject("list",ar);
		//mv.addObject("pager", pager);

		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getProductDetail(ProductDTO productDTO, Model model,Pager pager) throws Exception{
		//파라미터 이름과 setter의 이름과 같아야함 
		
		 System.out.println("Product detail");
		 ModelAndView mv = new ModelAndView();
		 productDTO = productService.getProductDetail(productDTO);
		 System.out.println("pagerCo :"+ pager.getPage());
		 System.out.println(productDTO!=null);
		
		 mv.setViewName("/product/productDetail");
		 mv.addObject("dto",productDTO);
		// review 리스트 
		 List<BbsDTO> ar = reviewService.getBoardList(pager);
		 //qna 리스트
		 List<BbsDTO> ar2 = qnaService.getBoardList(pager);		
		
		 //qna 답글 리스트 
		  List<QnaReplyDTO> ar3 = qnaReplyService.getBoardList(pager);	
		  
		 // review 리스트 
		 mv.addObject("pager",pager);
		 mv.addObject("list1",ar);
		 
		 // qna 리스트 
		 mv.addObject("pager",pager);
		 mv.addObject("list2",ar2);
			
		 // qna 답글 리스트
		 mv.addObject("pager",pager);
		 mv.addObject("list3",ar3);
			
		 
	   return mv;		
	}
	
//	//상품 디테일 페이지에서 장바구니 데이터 인서트 
//	@PostMapping("detail")
//	public ModelAndView setProductOptionAdd(ProductDTO productDTO) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		//int result =  productService.setProductOptionAdd();
//		int ar =  productService.setProductOptionAdd(productDTO);
//		
//		mv.addObject("cart", ar);
//		mv.setViewName("/product/productDetail");
//		
//		return mv;
//	}
	   
	

	
//////////////////////////////////////////////////////////////상품 하위 옵션 구현//////////////////////////////////////////////////////////////////////	

	//ajax의 post url "./optionList" 
	@PostMapping("optionList")
	public ModelAndView getOption(ProductOptionDTO productOptionDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<ProductOptionDTO> ar = productService.getOption(productOptionDTO);
		
		mv.addObject("list", ar);
		mv.setViewName("/product/selectOption");
		
		return mv;
	}		
	
	
	@GetMapping("add")
	public ModelAndView setProductAdd() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/productAdd");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setProductAdd(ProductDTO productDTO, MultipartFile[] pics, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result =  productService.setProductAdd(productDTO, pics, session);
		String message = "등록 실패";
		
		if(result > 0) {
			message = "글이 등록되었습니다";
		}
		
		mv.addObject("result", message);
		mv.setViewName("common/result");
		mv.addObject("url", "./list");
		return mv;
	}
	

	@GetMapping("update")
	public ModelAndView setProductUpdate(ProductDTO productDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		productDTO=  productService.getProductDetail(productDTO);
		
		mv.addObject("dto", productDTO);
		
		mv.setViewName("product/productUpdate");
		
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
	
	@PostMapping("delete")
	public ModelAndView  setProductDelete(ProductDTO productDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = productService.setProductDelete(session, productDTO);
		
		String message = "삭제실패";
		if(result > 0) {
			message = "상품이 삭제되었습니다";
		}
		
		mv.addObject("result", message);
		mv.setViewName("common/result");
		mv.addObject("url", "./list?categoryNum=" + 1);
		
		return mv;
	}
	
}
