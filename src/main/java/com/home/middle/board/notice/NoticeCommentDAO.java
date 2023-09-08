package com.home.middle.board.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeCommentDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.home.middle.board.notice.NoticeCommentDAO.";
	
	public List<NoticeCommentDTO> getNoticeCommentList(NoticeCommentDTO noticeCommentDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getNoticeCommentList", noticeCommentDTO);
	}
	
	public NoticeCommentDTO getNoticeCommentDetail(NoticeCommentDTO noticeCommentDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getNoticeCommentDetail", noticeCommentDTO);
	}
	
	public int setNoticeCommentAdd(NoticeCommentDTO noticeCommentDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setNoticeCommentAdd", noticeCommentDTO);
	}
	
	public int setNoticeCommentDelete(NoticeCommentDTO noticeCommentDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setNoticeCommentDelete", noticeCommentDTO);
	}
	
	public int setNoticeCommentUpdate(NoticeCommentDTO noticeCommentDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setNoticeCommentUpdate", noticeCommentDTO);
	}
}
