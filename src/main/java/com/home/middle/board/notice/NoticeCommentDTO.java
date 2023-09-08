package com.home.middle.board.notice;

import java.sql.Date;

public class NoticeCommentDTO {
	private Long replyNum;
	private Long num;
	private String id;
	private String contents;
	private Date regDate;
	private Date modifyDate;
	
	public Long getReplyNum() {
		return replyNum;
	}
	
	public Long getNum() {
		return num;
	}
	
	public String getId() {
		return id;
	}
	
	public String getContents() {
		return contents;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public Date getModifyDate() {
		return modifyDate;
	}
	
	
	
	public void setReplyNum(Long replyNum) {
		this.replyNum = replyNum;
	}
	
	public void setNum(Long num) {
		this.num = num;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
}


