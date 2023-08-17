package com.home.middle.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeCommentService {

	@Autowired
	private NoticeCommentDAO noticeCommentDAO;
	
	public List<NoticeCommentDTO> getNoticeCommentList(NoticeCommentDTO noticeCommentDTO, NoticeDTO noticeDTO) throws Exception {
		noticeCommentDTO.setNum(noticeDTO.getNum());
		
		return noticeCommentDAO.getNoticeCommentList(noticeCommentDTO);
	}
	
	public NoticeCommentDTO getNoticeCommentDetail(NoticeCommentDTO noticeCommentDTO) throws Exception {
		return noticeCommentDAO.getNoticeCommentDetail(noticeCommentDTO);
	}
	
	public int setNoticeCommentAdd(NoticeCommentDTO noticeCommentDTO, NoticeDTO noticeDTO) throws Exception {
		noticeCommentDTO.setNum(noticeDTO.getNum());
		
		int result = noticeCommentDAO.setNoticeCommentAdd(noticeCommentDTO);
		
		return result;
		
	}
	
	public int setNoticeCommentDelete(NoticeCommentDTO noticeCommentDTO) throws Exception {
		
		return noticeCommentDAO.setNoticeCommentDelete(noticeCommentDTO);
	}
	
	public int setNoticeCommentUpdate(NoticeCommentDTO noticeCommentDTO) throws Exception {
		return noticeCommentDAO.setNoticeCommentUpdate(noticeCommentDTO);
	}
	
}
