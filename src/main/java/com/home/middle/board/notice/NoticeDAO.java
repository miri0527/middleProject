package com.home.middle.board.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.home.middle.board.BbsDAO;
import com.home.middle.board.BbsDTO;
import com.home.middle.board.BoardFileDTO;
import com.home.middle.util.Pager;

@Repository
public class NoticeDAO implements BbsDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.home.middle.board.notice.NoticeDAO.";
	
	@Override
	public Long getTotalCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotalCount", pager);
	}

	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getBoardList", pager);
	}
	
	//주요 공지사항 상단 고정
	public List<NoticeDTO> getImportantList(NoticeDTO noticeDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getImportantList", noticeDTO);
	}
	
	public NoticeDTO getBoardDetail(BbsDTO bbsDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getBoardDetail", bbsDTO);
	}
	
	//조회수 올리기
	public int setBoardHit(BbsDTO bbsDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setBoardHit", bbsDTO);
	}

	@Override
	public int setBoardAdd(BbsDTO bbsDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setBoardAdd", bbsDTO);
	}
	
	public int setBoardFileAdd(BoardFileDTO boardFileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setBoardFileAdd", boardFileDTO);
	}
	
	@Override
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setBoardUpdate", bbsDTO);
	}

	@Override
	public int setBoardDelete(BbsDTO bbsDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setBoardDelete", bbsDTO);
	}
	
	
	

	
}
