package com.home.middle.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.home.middle.util.Pager;


public interface BbsService {

	//list
	public List<BbsDTO> getBoardList(Pager pager) throws Exception;
	//insert
	public int setBoardAdd(BbsDTO bbsDTO, MultipartFile [] multipartFiles , HttpSession session) throws Exception;
	//update
	public int setBoardUpdate(BbsDTO bbsDTO)throws Exception;
	//delete
	public int setBoardDelete(BbsDTO bbsDTO , HttpSession session)throws Exception;
    

	public BbsDTO getBoardDetail(BbsDTO bbsDTO) throws Exception;
	
	public BoardFileDTO getBoardFileDetail(BoardFileDTO boardFileDTO) throws Exception;
	int setBoardAdd(BbsDTO bbsDTO, HttpSession session) throws Exception;
	
	
	
	
}