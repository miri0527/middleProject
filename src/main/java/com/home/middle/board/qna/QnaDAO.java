package com.home.middle.board.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.home.middle.board.BbsDAO;
import com.home.middle.board.BbsDTO;
import com.home.middle.board.BoardFileDTO;
import com.home.middle.util.Pager;


@Repository
public class QnaDAO implements BbsDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.home.middle.board.qna.QnaDAO.";

	@Override
	public Long getTotalCount(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getTotalCount",pager);
	}

	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getBoardList", pager);
	}
	
	@Override
	public int setBoardAdd(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
	    return sqlSession.insert(NAMESPACE+"setBoardAdd", bbsDTO);
	}

	@Override
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"setBoardUpdate", bbsDTO);
	}

	@Override
	public int setBoardDelete(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setBoardDelete",bbsDTO);
	}
	
	public int setBoardFileAdd(BoardFileDTO boardFileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setProductFileAdd", boardFileDTO);
	}
	
	public List<BoardFileDTO> getBoardFileList(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getBoardFileList", bbsDTO);
	}
	
	
	public BbsDTO getBoardDetail(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getBoardDetail", bbsDTO);
	}
	
	
	public BoardFileDTO getBoardFileDetail(BoardFileDTO boardFileDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getBoardFileDetail", boardFileDTO);
	}
	
	
	public int setBoardFileDelete(Long fileNum) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setBoardFileDelete", fileNum);
	}
}
