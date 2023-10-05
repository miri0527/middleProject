package com.home.middle.board.qna;

import java.util.List;

import com.home.middle.board.BbsDTO;
import com.home.middle.board.BoardFileDTO;
import com.home.middle.product.ProductDTO;



public class QnaDTO extends BbsDTO{
	private Long productNum;
	private List<BoardFileDTO> boardFileDTOs;
	private Long r;
	private ProductDTO productDTO;
	
	public List<BoardFileDTO> getBoardFileDTOs() {
		return boardFileDTOs;
	}

	public void setBoardFileDTOs(List<BoardFileDTO> boardFileDTOs) {
		this.boardFileDTOs = boardFileDTOs;
	}

	public Long getProductNum() {
		return productNum;
	}

	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	
	public Long getR() {
		return r;
	}
	
	public void setR(Long r) {
		this.r = r;
	}
	
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
}