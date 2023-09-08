package com.home.middle.board.notice;

import java.util.List;

import com.home.middle.board.BbsDTO;
import com.home.middle.board.BoardFileDTO;

public class NoticeDTO extends BbsDTO{

	private List<BoardFileDTO> boardFileDTOs;
	private Long r;
	private Integer important;
	
	public List<BoardFileDTO> getBoardFileDTOs() {
		return boardFileDTOs;
	}

	public void setBoardFileDTOs(List<BoardFileDTO> boardFileDTOs) {
		this.boardFileDTOs = boardFileDTOs;
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
