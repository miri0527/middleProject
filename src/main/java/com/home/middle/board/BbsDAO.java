package com.home.middle.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.home.middle.util.Pager;


public interface BbsDAO {
	
	//totalCount
	public Long getTotalCount(Pager pager) throws Exception;
	
	//list 
		public List<BbsDTO> getBoardList(Pager pager) throws Exception;
		
		
	//insert(add)
		public int setBoardAdd(BbsDTO bbsDTO) throws Exception;
	
	
		
	//update
		public int setBoardUpdate(BbsDTO bbsDTO) throws Exception;
		
	//delete	
		public int setBoardDelete(BbsDTO bbsDTO) throws Exception;
	
}