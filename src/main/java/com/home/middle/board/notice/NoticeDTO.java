package com.home.middle.board.notice;


import com.home.middle.board.BbsDTO;
import com.home.middle.board.BoardFileDTO;

public class NoticeDTO extends BbsDTO{

	private BoardFileDTO boardFileDTO;
	private Long r;
	private Integer important;
	
	public BoardFileDTO getBoardFileDTO() {
		return boardFileDTO;
	}

	public void setBoardFileDTOs(BoardFileDTO  boardFileDTO) {
		this.boardFileDTO = boardFileDTO;
	}
	
	public Long getR() {
		return r;
	}
	
	public void setR(Long r) {
		this.r = r;
	}
	
	public Integer getImportant() {
		if(important == null) {
			important = 0;
			return important;
		}else {
			return important;
		}
		
	}
	public void setImportant(Integer important) {
		this.important = important;
	}
}
