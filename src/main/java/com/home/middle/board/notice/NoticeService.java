package com.home.middle.board.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.home.middle.board.BbsDTO;
import com.home.middle.board.BbsService;
import com.home.middle.board.BoardFileDTO;
import com.home.middle.util.FileManager;
import com.home.middle.util.Pager;

@Service
@Transactional
public class NoticeService implements BbsService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		Long num = noticeDAO.getTotalCount(pager);
		pager.makeNum(num);
		
		pager.makeRow();
		return noticeDAO.getBoardList(pager);
		
	}


	@Override
	public int setBoardAdd(BbsDTO bbsDTO, MultipartFile[] multipartFiles, HttpSession session) throws Exception {
		int result = noticeDAO.setBoardAdd(bbsDTO);
		
		String realPath = session.getServletContext().getRealPath("resources/upload/notice");
		
		for(MultipartFile multipartFile : multipartFiles) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			
		String fileName = fileManager.fileSave(multipartFile, realPath);
		// db에 insert 
		BoardFileDTO boardFileDTO = new BoardFileDTO();
		boardFileDTO.setNum(bbsDTO.getNum());
		System.out.println("NUM:::" + boardFileDTO.getNum());
		boardFileDTO.setFileName(fileName);
		boardFileDTO.setOriName(multipartFile.getOriginalFilename());
		
		result = noticeDAO.setBoardFileAdd(boardFileDTO);
		
		}
		
		return result;
	}

	@Override
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception {
		return noticeDAO.setBoardUpdate(bbsDTO);
	}

	@Override
	public int setBoardDelete(BbsDTO bbsDTO, HttpSession session) throws Exception {
		return 0;
		
		
	}

	@Override
	public BbsDTO getBoardDetail(BbsDTO bbsDTO) throws Exception {
		
		return noticeDAO.getBoardDetail(bbsDTO);
	}

	@Override
	public BoardFileDTO getBoardFileDetail(BoardFileDTO boardFileDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	//조회수 올리기
	public int setBoardHit(BbsDTO bbsDTO) throws Exception {
		
		return noticeDAO.setBoardHit(bbsDTO);
	}

	
}
