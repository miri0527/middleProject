package com.home.middle.product;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.home.middle.util.FileManager;
import com.home.middle.util.Pager;

@Service
public class ProductService {

	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private FileManager fileManager;
	

	public List<ProductOptionDTO> getProductList(ProductDTO productDTO,Pager pager ) throws Exception {
		
		pager.makeNum(productDAO.getTotalCount(pager));
		pager.makeRow();
		
		List<ProductOptionDTO> ar = productDAO.getProductList(productDTO);
		return ar;
	}

	public ProductDTO getProductDetail(ProductDTO productDTO) throws Exception {
		return productDAO.getProductDetail(productDTO);
	}

	public List<ProductOptionDTO> getOption(ProductOptionDTO productOptionDTO) throws Exception {
		return productDAO.getOption(productOptionDTO);
	}

	public int setProductOptionAdd(ProductDTO productDTO) throws Exception {
		return productDAO.setProductOptionAdd(productDTO);
		
	}
	public int setProductAdd(ProductDTO productDTO, MultipartFile[] pic, HttpSession session) throws Exception {

		int result = productDAO.setProductAdd(productDTO);

		System.out.println(result);

		String realPath = session.getServletContext().getRealPath("resources/upload/product");

		for (MultipartFile pics : pic) {
			if (pics.isEmpty()) {
				continue;
			}

			String fileName = fileManager.fileSave(pics, realPath);

			ProductImgDTO productImgDTO = new ProductImgDTO();

			productImgDTO.setFileName(fileName);
			productImgDTO.setOriName(pics.getOriginalFilename());
			productImgDTO.setProductNum(productDTO.getProductNum());

			result = productDAO.setProductFileAdd(productImgDTO);

		}

		return result;
	}

	
	  public List<ProductDTO> getMemberProductList(Pager pager) throws Exception {
	  pager.makeRow();
	  
	  pager.makeNum(productDAO.getTotalCount(pager));
	  
	  List<ProductDTO> ar = productDAO.getMemberProductList(pager);
	  
	  return ar; 
	  }


	public int setProductUpdate(ProductDTO productDTO, MultipartFile[] pic, Long[] fileNums, HttpSession session)
			throws Exception {
		int result = productDAO.setProductUpdate(productDTO);

		if (fileNums != null) {
			for (Long fileNum : fileNums) {
				productDAO.setProductFileDelete(fileNum);
			}

			// 파일 다시 add
			String realPath = session.getServletContext().getRealPath("resources/upload/product/");

			for (MultipartFile pics : pic) {
				if (pics.isEmpty()) {
					continue;
				}

				String fileName = fileManager.fileSave(pics, realPath);

				ProductImgDTO productImgDTO = new ProductImgDTO();

				productImgDTO.setFileName(fileName);
				productImgDTO.setOriName(pics.getOriginalFilename());
				productImgDTO.setProductNum(productDTO.getProductNum());

				result = productDAO.setProductFileAdd(productImgDTO);

			}
		}
		// 파일삭제

		return result;

	}

	public int setProductDelete(HttpSession session, ProductDTO productDTO) throws Exception {
		List<ProductImgDTO> ar = productDAO.getProductFileList(productDTO);

		int result = productDAO.setProductDelete(productDTO);

		if (result > 0) {
			String realPath = session.getServletContext().getRealPath("resources/upload/product/");

			for (ProductImgDTO productImgDTO : ar) {

				boolean check = fileManager.fileDelete(realPath, productImgDTO.getFileName());
			}

		}

		return result;
	}
	public List<ProductOptionDTO> getProductOptionList(ProductOptionDTO productOptionDTO) throws Exception{
		return productDAO.getProductOptionList(productOptionDTO);
	}
	public int setProductOptionDelete(ProductOptionDTO productOptionDTO) throws Exception{
		return productDAO.setProductOptionDelete(productOptionDTO);
	}
	public String getProductId(ProductDTO productDTO) throws Exception{
		return productDAO.getProductId(productDTO);
	}
	public int productOptionAdd(String[] optionValue0, String[] optionValue1, String[] optionValue2,
			String[] optionName, int[] countList, int[] countList2, String[] price, String[] stock, String productNum) throws Exception {
		List<Long> optionNum0 = new ArrayList<Long>();
		List<List<Long>> optionNum1 = new ArrayList<List<Long>>();
		List<ArrayList<String>> optionValue11 = new ArrayList<ArrayList<String>>();
		List<String> optionValue111 = new ArrayList<String>();
		List<ArrayList<ArrayList<String>>> optionValue22 = new ArrayList<ArrayList<ArrayList<String>>>();
		List<ArrayList<String>> optionValue222 = new ArrayList<ArrayList<String>>();
		List<ArrayList<String>> price1 = new ArrayList<ArrayList<String>>();
		List<ArrayList<ArrayList<String>>> price11 = new ArrayList<ArrayList<ArrayList<String>>>();
		List<ArrayList<String>> stock1 = new ArrayList<ArrayList<String>>();
		List<ArrayList<ArrayList<String>>> stock11 = new ArrayList<ArrayList<ArrayList<String>>>();
		
		
//				for (int i = 0; i < optionValue1.length; i++) {
//					String str = optionValue1[i];		
//					StringTokenizer st1 = new StringTokenizer(str, ",");
//					while (st1.hasMoreTokens()) {
//						optionValue111.add(st1.nextToken());
//					}
//				}
//				
//				int countidx = 0;
//				int count = 0;
//				
//				for(int i = 0; i < countList2.length; i ++) {		
//					List<String> optionValue112 = new ArrayList<String>();
//					count = countidx + countList2[i];
//					for(int j = countidx; j < count; j ++) {
//						optionValue112.add(optionValue111.get(j));
//					}
//					
//					optionValue11.add((ArrayList<String>) optionValue112);
//					countidx += countList2[i];
//				}
//				
//				
//			for (int i = 0; i < optionValue2.length; i++) {
//				String str = optionValue2[i];
//				String str2 = price[i];
//				String str3 = stock[i];
//				StringTokenizer st1 = new StringTokenizer(str, ",");
//				StringTokenizer st2 = new StringTokenizer(str2, ",");
//				StringTokenizer st3 = new StringTokenizer(str3, ",");
//				ArrayList<String> pstr = new ArrayList<String>();
//				ArrayList<String> pstr2 = new ArrayList<String>();
//				ArrayList<String> pstr3 = new ArrayList<String>();
//				while (st1.hasMoreTokens()) {
//					pstr.add(st1.nextToken());
//				}
//				while (st2.hasMoreTokens()) {
//					pstr2.add(st2.nextToken());
//				}
//				while (st3.hasMoreTokens()) {
//					pstr3.add(st3.nextToken());
//				}
//				optionValue222.add(pstr);
//				price1.add(pstr2);
//				stock1.add(pstr3);
//			}
//
//			countidx = 0;
//			count = 0;
//			for (int i = 0; i < countList2.length; i++) {
//				List<ArrayList<String>> optionValue223 = new ArrayList<ArrayList<String>>();
//				List<ArrayList<String>> price12 = new ArrayList<ArrayList<String>>();
//				List<ArrayList<String>> stock12 = new ArrayList<ArrayList<String>>();
//				count = countidx + countList2[i];
//
//				for (int j = countidx; j < count; j++) {
//					optionValue223.add(optionValue222.get(j));
//					price12.add(price1.get(j));
//					stock12.add(stock1.get(j));
//
//				}
//				countidx += countList2[i];
//				optionValue22.add((ArrayList<ArrayList<String>>) optionValue223);
//				price11.add((ArrayList<ArrayList<String>>) price12);
//				stock11.add((ArrayList<ArrayList<String>>) stock12);
//			}
//		
//		
//		System.out.println(optionValue11);
//		System.out.println(optionValue22);
//		System.out.println(price1);
//		System.out.println(price11);
//		System.out.println(stock1);
//		System.out.println(stock11);
//		return 1;

		
		for (int i = 0; i < optionValue1.length; i++) {
			String str = optionValue1[i];		
			StringTokenizer st1 = new StringTokenizer(str, ",");
			while (st1.hasMoreTokens()) {
				optionValue111.add(st1.nextToken());
			}
		}
		int countidx = 0;
		int count = 0;
			
		for(int i = 0; i < countList2.length; i ++) {		
			List<String> optionValue112 = new ArrayList<String>();
			count = countidx + countList2[i];
			for(int j = countidx; j < count; j ++) {
				optionValue112.add(optionValue111.get(j));
			}
				
			optionValue11.add((ArrayList<String>) optionValue112);
			countidx += countList2[i];
		}
		for (int i = 0; i < optionValue2.length; i++) {
			String str = optionValue2[i];
			String str2 = price[i];
			String str3 = stock[i];
			StringTokenizer st1 = new StringTokenizer(str, ",");
			StringTokenizer st2 = new StringTokenizer(str2, ",");
			StringTokenizer st3 = new StringTokenizer(str3, ",");
			ArrayList<String> pstr = new ArrayList<String>();
			ArrayList<String> pstr2 = new ArrayList<String>();
			ArrayList<String> pstr3 = new ArrayList<String>();
			while (st1.hasMoreTokens()) {
				pstr.add(st1.nextToken());
			}
			while (st2.hasMoreTokens()) {
				pstr2.add(st2.nextToken());
			}
			while (st3.hasMoreTokens()) {
				pstr3.add(st3.nextToken());
			}
			optionValue222.add(pstr);
			price1.add(pstr2);
			stock1.add(pstr3);
		}

		countidx = 0;
		count = 0;
		for (int i = 0; i < countList2.length; i++) {
			List<ArrayList<String>> optionValue223 = new ArrayList<ArrayList<String>>();
			List<ArrayList<String>> price12 = new ArrayList<ArrayList<String>>();
			List<ArrayList<String>> stock12 = new ArrayList<ArrayList<String>>();
			count = countidx + countList2[i];

			for (int j = countidx; j < count; j++) {
				optionValue223.add(optionValue222.get(j));
				price12.add(price1.get(j));
				stock12.add(stock1.get(j));
			}
			countidx += countList2[i];
			optionValue22.add((ArrayList<ArrayList<String>>) optionValue223);
			price11.add((ArrayList<ArrayList<String>>) price12);
			stock11.add((ArrayList<ArrayList<String>>) stock12);
		}

		for (int i = 0; i < optionValue0.length; i++) {
			long tempStock2 = 0;
			long tempPrice2 = 0;
			for (int j = 0; j < stock11.get(i).size(); j++) {
				long tempStock = 0;
				long tempPrice = 0;
				for (int k = 0; k < stock11.get(i).get(j).size(); k++) {
					tempStock += Long.parseLong(stock11.get(i).get(j).get(k));
					if (tempPrice == 0) {
						tempPrice = Long.parseLong(price11.get(i).get(j).get(k));
					} else if (tempPrice > Long.parseLong(price11.get(i).get(j).get(k))) {
						tempPrice = Long.parseLong(price11.get(i).get(j).get(k));
					}
				}
				if (tempPrice2 == 0) {
					tempPrice2 = tempPrice;
				} else if (tempPrice2 > tempPrice) {
					tempPrice2 = tempPrice;
				}
				tempStock2 += tempStock;
			}

			Long optionNum = productDAO.productOptionNum();
			optionNum0.add(optionNum);
			ProductOptionDTO productOptionDTO = new ProductOptionDTO();
			productOptionDTO.setOptionNum(optionNum);
			productOptionDTO.setOptionName(optionName[0]);
			productOptionDTO.setOptionValue(optionValue0[i]);
			productOptionDTO.setProductNum(Long.parseLong(productNum));// 상품 번호 넘어오는거 받아서 수정할것
			productOptionDTO.setDepth(0L);
			productOptionDTO.setProductPrice(tempPrice2);// 배열로 값 넘어온거 적용해줄것
			productOptionDTO.setProductStock(tempStock2);// 배열로 값 넘어온거 적용해줄것
			productOptionDTO.setRef(0L);
			productDAO.productOptionAdd0(productOptionDTO);

		}
			
		for (int i = 0; i < optionValue11.size(); i++) {
			List<Long> tempNum = new ArrayList<Long>();
			for (int j = 0; j < optionValue11.get(i).size(); j++) {
				if (optionValue11.get(i).get(j) != null) {
					long tempStock = 0;
					long tempPrice = 0;
						
					for (int k = 0; k < stock11.get(i).get(j).size(); k++) {
						tempStock += Long.parseLong(stock11.get(i).get(j).get(k));
						if (tempPrice == 0) {
							tempPrice = Long.parseLong(price11.get(i).get(j).get(k));
						} else if (tempPrice > Long.parseLong(price11.get(i).get(j).get(k))) {
							tempPrice = Long.parseLong(price11.get(i).get(j).get(k));
						}
					}
					Long optionNum = productDAO.productOptionNum();
						
					tempNum.add(optionNum);
					ProductOptionDTO productOptionDTO = new ProductOptionDTO();
					productOptionDTO.setOptionNum(optionNum);
					productOptionDTO.setOptionName(optionName[1]);
					productOptionDTO.setOptionValue(optionValue11.get(i).get(j));
					productOptionDTO.setProductNum(Long.parseLong(productNum));// 상품 번호 넘어오는거 받아서 수정할것
					productOptionDTO.setDepth(1L);
					productOptionDTO.setProductPrice(tempPrice);// 배열로 값 넘어온거 적용해줄것
					productOptionDTO.setProductStock(tempStock);// 배열로 값 넘어온거 적용해줄것
					productOptionDTO.setRef(optionNum0.get(i));

					productDAO.productOptionAdd0(productOptionDTO);
					optionNum1.add(tempNum);
				}
					
			}
				
		}
			
			
		for (int i = 0; i < optionValue22.size(); i++) {
			for (int j = 0; j < optionValue22.get(i).size(); j++) {
				for (int k = 0; k < optionValue22.get(i).get(j).size(); k++) {
					if (optionValue22.get(i).get(j).get(k) != null) {
						Long optionNum = productDAO.productOptionNum();
						ProductOptionDTO productOptionDTO = new ProductOptionDTO();
						productOptionDTO.setOptionNum(optionNum);
						productOptionDTO.setOptionName(optionName[2]);
						productOptionDTO.setOptionValue(optionValue22.get(i).get(j).get(k));
						productOptionDTO.setProductNum(Long.parseLong(productNum));// 상품 번호 넘어오는거 받아서 수정할것
						productOptionDTO.setDepth(2L);
						productOptionDTO.setProductPrice(Long.parseLong(price11.get(i).get(j).get(k)));// 배열로 값 넘어온거
																											// 적용해줄것
						productOptionDTO.setProductStock(Long.parseLong(stock11.get(i).get(j).get(k)));// 배열로 값 넘어온거
																											// 적용해줄것
						productOptionDTO.setRef(optionNum1.get(j).get(i));

						productDAO.productOptionAdd0(productOptionDTO);
					}
				}
			}
		}
		return 1;	
	}

}
