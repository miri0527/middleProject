package com.home.middle.board.notice;

import java.io.File;
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
import com.home.middle.product.ProductDTO;
import com.home.middle.product.ProductImgDTO;
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
	
	public List<NoticeDTO> getImportantList(NoticeDTO noticeDTO) throws Exception {
		return noticeDAO.getImportantList(noticeDTO);
				
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

	public int setBoardUpdate(BbsDTO bbsDTO, HttpSession session, MultipartFile[] pic, Long[] fileNums) throws Exception {
		int result = noticeDAO.setBoardUpdate(bbsDTO);

		// 파일 다시 add
		String realPath = session.getServletContext().getRealPath("resources/upload/notice/");

		for (MultipartFile pics : pic) {
			if (pics.isEmpty()) {
				continue;
			}

			String fileName = fileManager.fileSave(pics, realPath);

			BoardFileDTO boardFileDTO = new BoardFileDTO();

			boardFileDTO.setFileName(fileName);
			boardFileDTO.setOriName(pics.getOriginalFilename());
			boardFileDTO.setNum(bbsDTO.getNum());

			result = noticeDAO.setBoardFileAdd(boardFileDTO);

		}
	

	return result;
}

	@Override
	public int setBoardDelete(BbsDTO bbsDTO, HttpSession session) throws Exception {
		List<BoardFileDTO> ar= noticeDAO.getBoardFileList(bbsDTO);
		
		int result = noticeDAO.setBoardDelete(bbsDTO);
	
		
		if(result > 0) {
			String realPath = session.getServletContext().getRealPath("resources/upload/notice");
			
			for(BoardFileDTO boardFileDTO : ar) {
				boolean check = fileManager.fileDelete(realPath, boardFileDTO.getFileName());
			}
		}
		
		
		return result;
		
		
	}

	public BbsDTO getBoardDetail(NoticeDTO noticeDTO) throws Exception {
		
		return noticeDAO.getBoardDetail(noticeDTO);
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

	@Override
	public BbsDTO getBoardDetail(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	 public int setBoardtFileDelete(Long fileNum, HttpSession session, BbsDTO bbsDTO) throws Exception {
		  
		  List<BoardFileDTO> ar = noticeDAO.getBoardFileList(bbsDTO);
		  
		  String realPath = session.getServletContext().getRealPath("resources/upload/notice/");

			for (BoardFileDTO boardFileDTO : ar) {

				boolean check = fileManager.fileDelete(realPath, boardFileDTO.getFileName());
			};
	  
			int result = noticeDAO.setBoardFileDelete(fileNum);
				
			return result;
	  }

	@Override
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
