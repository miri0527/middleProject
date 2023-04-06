package com.home.middle.board.review;

import java.util.List;

import com.home.middle.board.BbsDTO;
import com.home.middle.board.BoardFileDTO;

public class ReviewDTO extends BbsDTO  {

	private Long productNum;
	private List<BoardFileDTO> boardFileDTOs;
	
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
	
	
	
}
