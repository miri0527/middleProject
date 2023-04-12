package com.home.middle.board.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.home.middle.board.BbsDTO;
import com.home.middle.board.BoardFileDTO;
import com.home.middle.util.FileManager;
import com.home.middle.util.Pager;


@Service
public class QnaReplyService {
	
	@Autowired
	private QnaReplyDAO qnaReplyDAO;
	
	@Autowired
	private FileManager fileManager;

	
	public List<QnaReplyDTO> getBoardList(Pager pager) throws Exception {
		pager.makeNum(qnaReplyDAO.getTotalCount(pager));
		pager.makeRow();
		
		return qnaReplyDAO.getBoardList(pager);
	}
	
	
	public List<QnaReplyDTO> getBoardListdetail(Pager pager) throws Exception {
		pager.makeNum(qnaReplyDAO.getTotalCount(pager));
		pager.makeRow();
		
		return qnaReplyDAO.getBoardList(pager);
	}
	
	

	public int setBoardAdd(QnaReplyDTO bbsDTO, MultipartFile[] multipartFiles , HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		int result = qnaReplyDAO.setBoardAdd(bbsDTO);
		
		String realPath = session.getServletContext().getRealPath("resources/upload/qna/");
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
		
		result = qnaReplyDAO.setBoardFileAdd(boardFileDTO);
		}
		//file을 hdd에 저장
		return result;
	}
	



	public int setBoardUpdate(QnaReplyDTO bbsDTO, MultipartFile[] multipartFiles, HttpSession session, Long[] fileNums)
			throws Exception {
		//qna Update
		int result = qnaReplyDAO.setBoardUpdate(bbsDTO);
		
		//qnaFiles Delete
		if(fileNums != null) {
			for(Long fileNum : fileNums) {
				qnaReplyDAO.setBoardFileDelete(fileNum);
				
			}
		}
		
		//qnaFiles Insert
		//file HDD에 저장
		String realPath=session.getServletContext().getRealPath("resources/upload/qna/");
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
					
			result=qnaReplyDAO.setBoardFileAdd(boardFileDTO);
					
		}		
		
		
		
		return result;
	}


	public int setBoardDelete(QnaReplyDTO bbsDTO, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		List<BoardFileDTO> ar = qnaReplyDAO.getBoardFileList(bbsDTO);
		int result =  qnaReplyDAO.setBoardDelete(bbsDTO);
		
		if(result>0) {
			
			String realPath = session.getServletContext().getRealPath("resources/upload/qna/");
			
			for(BoardFileDTO boardFileDTO : ar) {
			boolean check = fileManager.fileDelete(realPath, boardFileDTO.getFileName());
			}
		}
		
		return result;
	}



	public BoardFileDTO getBoardFileDetail(BoardFileDTO boardFileDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



	public QnaReplyDTO getBoardDetail(QnaReplyDTO qnaReplyDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaReplyDAO.getBoardDetail(qnaReplyDTO);
	}
	
	
	
}
