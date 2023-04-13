package com.home.middle.board.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.home.middle.board.BbsDTO;
import com.home.middle.board.BbsService;
import com.home.middle.board.BoardFileDTO;
import com.home.middle.board.review.ReviewDAO;
import com.home.middle.util.FileManager;
import com.home.middle.util.Pager;


@Service
public class QnaService implements BbsService{
	
	@Autowired
	private QnaDAO qnaDAO;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		pager.makeNum(qnaDAO.getTotalCount(pager));
		pager.makeRow();
		
		return qnaDAO.getBoardList(pager);
	}
	
	
	public List<BbsDTO> getBoardListdetail(Pager pager) throws Exception {
		pager.makeNum(qnaDAO.getTotalCount(pager));
		pager.makeRow();
		
		return qnaDAO.getBoardList(pager);
	}
	
	
	@Override
	public int setBoardAdd(BbsDTO bbsDTO, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		int result = qnaDAO.setBoardAdd(bbsDTO);
		
		//file을 hdd에 저장
		return result;
	}
	
	@Override
	public int setBoardAdd(BbsDTO bbsDTO, MultipartFile[] multipartFiles, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public BoardFileDTO getBoardFileDetail(BoardFileDTO boardFileDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	public int setBoardUpdate(BbsDTO bbsDTO, MultipartFile[] multipartFiles, HttpSession session, Long[] fileNums)
			throws Exception {
		//qna Update
		int result = qnaDAO.setBoardUpdate(bbsDTO);
		
		
		//qnaFiles Insert
		//file HDD에 저장
		
	
					
		
		
		
		return result;
	}

	@Override
	public int setBoardDelete(BbsDTO bbsDTO, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		
		int result =  qnaDAO.setBoardDelete(bbsDTO);
		
		return result;
	}




	@Override
	public BbsDTO getBoardDetail(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.getBoardDetail(bbsDTO);
	}
	
	
	
}