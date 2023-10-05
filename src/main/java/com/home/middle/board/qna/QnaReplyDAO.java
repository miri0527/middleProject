package com.home.middle.board.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.home.middle.board.BbsDAO;
import com.home.middle.board.BbsDTO;
import com.home.middle.board.BoardFileDTO;
import com.home.middle.product.ProductDTO;
import com.home.middle.util.Pager;


@Repository
public class QnaReplyDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.home.middle.board.qna.QnaReplyDAO.";

	
	public Long getTotalCount(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getTotalCount",pager);
	}

	
	public List<QnaReplyDTO> getBoardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getBoardList", pager);
	}
	
	//상품 이름 찾기
	public String getProductName(Long productNum)throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getProductName", productNum);
	}
	
	//원본 제목 찾기
	public String getQnaTitle(Long num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getQnaTitle", num);
	}
	
	public int setBoardAdd(QnaReplyDTO qnaReplyDTO) throws Exception {
		// TODO Auto-generated method stub
	    return sqlSession.insert(NAMESPACE+"setBoardAdd", qnaReplyDTO);
	}


	public int setBoardUpdate(QnaReplyDTO qnaReplyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"setBoardUpdate", qnaReplyDTO);
	}


	public int setBoardDelete(QnaReplyDTO qnaReplyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setBoardDelete",qnaReplyDTO);
	}
	
	public int setBoardFileAdd(BoardFileDTO boardFileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setProductFileAdd", boardFileDTO);
	}
	
	public List<BoardFileDTO> getBoardFileList(QnaReplyDTO qnaReplyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getBoardFileList", qnaReplyDTO);
	}
	
	public List<QnaReplyDTO> getReplyDetail(QnaReplyDTO qnaReplyDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getReplyDetail", qnaReplyDTO);
	}
	
	
	public QnaReplyDTO getReplyUpdate(QnaReplyDTO qnaReplyDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getReplyUpdate", qnaReplyDTO);
	}
	
	public QnaReplyDTO getBoardDetail(QnaReplyDTO bbsDTO) throws Exception {
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

