package com.home.middle.board.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.home.middle.board.BbsDTO;
import com.home.middle.board.BbsService;
import com.home.middle.board.BoardFileDTO;
import com.home.middle.util.FileManager;
import com.home.middle.util.Pager;
@Service
public class ReviewService implements BbsService {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		
		pager.makeNum(reviewDAO.getTotalCount());
		pager.makeRow();
		return reviewDAO.getBoardList(pager);
	}
	
	@Override
	public int setBoardAdd(BbsDTO bbsDTO, MultipartFile[] multipartFiles , HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		int result = reviewDAO.setBoardAdd(bbsDTO);
		
		String realPath = session.getServletContext().getRealPath("resources/upload/review/");
		System.out.println(realPath);
		System.out.println(multipartFiles.length);
		
		for(MultipartFile multipartFile : multipartFiles) {
			if(multipartFile.isEmpty()) {
				//다시위로 올라가세용 컨티뉴...!
				continue;
			}
			
		String fileName = fileManager.fileSave(multipartFile, realPath);
		// db에 insert 
		BoardFileDTO boardFileDTO = new BoardFileDTO();
		boardFileDTO.setNum(bbsDTO.getNum());
		boardFileDTO.setFileName(fileName);
		boardFileDTO.setOriName(multipartFile.getOriginalFilename());
		
		result = reviewDAO.setBoardFileAdd(boardFileDTO);
		}
		//file을 hdd에 저장
		return result;
	}
	
	@Override
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	public int setBoardUpdate(BbsDTO bbsDTO, MultipartFile[] multipartFiles, HttpSession session, Long[] fileNums)
			throws Exception {
		//qna Update
		int result = reviewDAO.setBoardUpdate(bbsDTO);
		
		//qnaFiles Delete
		if(fileNums != null) {
			for(Long fileNum : fileNums) {
				reviewDAO.setBoardFileDelete(fileNum);
				
			}
		}
		
		//qnaFiles Insert
		//file HDD에 저장
		String realPath=session.getServletContext().getRealPath("resources/upload/review/");
		System.out.println(realPath);
				
		for(MultipartFile multipartFile: multipartFiles) {
					
			if(multipartFile.isEmpty()) {
				continue;
			}
					
			String fileName = fileManager.fileSave(multipartFile, realPath);
							
			//DB INSERT
			BoardFileDTO boardFileDTO = new BoardFileDTO();
			boardFileDTO.setNum(bbsDTO.getNum());
			boardFileDTO.setFileName(fileName);
			boardFileDTO.setOriName(multipartFile.getOriginalFilename());
					
			result=reviewDAO.setBoardFileAdd(boardFileDTO);
					
		}		
		
		
		
		return result;
	}
	@Override
	public int setBoardDelete(BbsDTO bbsDTO, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		List<BoardFileDTO> ar = reviewDAO.getBoardFileList(bbsDTO);
		int result =  reviewDAO.setBoardDelete(bbsDTO);
		
		if(result>0) {
			
			String realPath = session.getServletContext().getRealPath("resources/upload/review/");
			
			for(BoardFileDTO boardFileDTO : ar) {
			boolean check = fileManager.fileDelete(realPath, boardFileDTO.getFileName());
			}
		}
		
		return result;
	}
	
	@Override
	public BoardFileDTO getBoardFileDetail(BoardFileDTO boardFileDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BbsDTO getBoardDetail(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.getBoardDetail(bbsDTO);
	}

}
