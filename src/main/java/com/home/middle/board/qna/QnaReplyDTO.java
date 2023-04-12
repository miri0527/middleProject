package com.home.middle.board.qna;

import java.util.List;

import com.home.middle.board.BbsDTO;
import com.home.middle.board.BoardFileDTO;



public class QnaReplyDTO extends BbsDTO{
	private Long productNum;
	private List<BoardFileDTO> boardFileDTOs;
	private Long replyNum;
	
	public Long getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(Long replyNum) {
		this.replyNum = replyNum;
	}

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
