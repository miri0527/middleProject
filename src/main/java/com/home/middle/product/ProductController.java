package com.home.middle.product;

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

import com.home.middle.util.Pager;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	
	
	@RequestMapping(value="list" , method=RequestMethod.GET)
	public ModelAndView getProductList(ProductDTO productDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		List<ProductDTO> ar = productService.getProductList(productDTO);
	  
		mv.setViewName("product/productList");
		mv.addObject("list",ar);
		//mv.addObject("pager", pager);
		return mv;
	}
	

	@RequestMapping(value="detail",method=RequestMethod.GET)
	public ModelAndView getProductDetail(ProductDTO productDTO, Model model) throws Exception{
		//파라미터 이름과 setter의 이름과 같아야함 
		
		 System.out.println("Product detail");
		 ModelAndView mv = new ModelAndView();
		 productDTO = productService.getProductDetail(productDTO);
		
		 System.out.println(productDTO!=null);
		
		 mv.setViewName("/product/productDetail");
		 mv.addObject("dto",productDTO);
		
	   return mv;
		
	}
	
	@GetMapping("memberProductList")
	   public ModelAndView getMemberProductList(Pager pager) throws Exception {
	      ModelAndView mv = new ModelAndView();
	      
	      List<ProductDTO> ar =  productService.getMemberProductList(pager);
	      
	      mv.setViewName("product/memberProductList");
	      mv.addObject("list", ar);
	      
	      return mv;
	   }
	////////////////////////상품 하위 옵션 구현 ///////////////////////////////////// 
	

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
		mv.addObject("url", "./list");
		
		return mv;
	}
	
	@PostMapping("delete")
	public ModelAndView setProductDelete(@RequestParam(value="chkList",required = false) ProductDTO[] productDTOs, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		for (ProductDTO productDTO2 : productDTOs) {
			productDTO2.setProductNum(productDTO2.getProductNum());
			System.out.println(productDTO2.getProductNum());
			int result = productService.setProductDelete(session, productDTO2) ;
			
		}
		
		
		mv.setViewName("redirect:./memberProductList");
		
		return mv;
	}
	
}
