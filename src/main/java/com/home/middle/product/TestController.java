package com.home.middle.product;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/test/*")
public class TestController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("jsonTest")
	public ModelAndView setProductAdd() throws Exception{
		
		ModelAndView mv = new ModelAndView();
	
		mv.setViewName("/test/jsonTest");
		
		return mv;
		
	}
	@GetMapping("testjson")
	public ModelAndView setProductAddOption() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/test/testjson");
		
		return mv;
		
	}
	@PostMapping("productOptionAdd")
	public ModelAndView productOptionAdd(String[] optionValue0, String[] optionValue1, String[] optionValue2, String[] optionName, int[] countList, int[] countList2, String[] price, String[] stock) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		productService.productOptionAdd(optionValue0,optionValue1,optionValue2,optionName, countList, countList2, price, stock);
		
		mv.setViewName("/test/testjson");
		
		return mv;
	}
	@GetMapping("productOptionUpdate")
	public ModelAndView productOptionAdd(ProductOptionDTO productOptionDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		List<ProductOptionDTO> dto0 = new ArrayList<ProductOptionDTO>();
		List<ProductOptionDTO> dto1 = new ArrayList<ProductOptionDTO>();
		List<ProductOptionDTO> dto2 = new ArrayList<ProductOptionDTO>();
		for(long i = 0; i < 3; i++) {
			productOptionDTO.setDepth(i);
			if(i == 0) {				
				dto0 = productService.getProductOptionList(productOptionDTO);
			}else if(i == 1) {
				dto1 = productService.getProductOptionList(productOptionDTO);
			}else if(i == 2) {
				dto2 = productService.getProductOptionList(productOptionDTO);
			}
		}
		
		mv.addObject("dto0", dto0);
		mv.addObject("dto1", dto1);
		mv.addObject("dto2", dto2);
		mv.setViewName("/test/productOptionUpdate");
		
		return mv;
	}
	@PostMapping("productOptionUpdate")
	public ModelAndView setproductOptionUpdate(ProductOptionDTO productOptionDTO, String[] optionValue0, String[] optionValue1, String[] optionValue2, String[] optionName, int[] countList, int[] countList2, String[] price, String[] stock) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		productService.setProductOptionDelete(productOptionDTO);
		
		productService.productOptionAdd(optionValue0,optionValue1,optionValue2,optionName, countList, countList2, price, stock);
		
		mv.setViewName("/test/testjson");
		
		return mv;
	}
}
