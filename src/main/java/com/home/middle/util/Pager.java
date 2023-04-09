package com.home.middle.util;

import com.home.middle.member.MemberDTO;

public class Pager {
	
	
	private Long num;
	
	private Long productNum;
	private String id;
	private String name;
	private String[] roleName;
	private Long orderNum;
	private String autoStatus;
	

	public String getAutoStatus() {
		return autoStatus;
	}

	public void setAutoStatus(String autoStatus) {
		this.autoStatus = autoStatus;
	}

	public Long getNum() {
		return num;
	}

	public void setNum(Long num) {
		this.num = num;
	}
                  

	public Long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}



	//검색 종료(사용할 column)
	private String kind;
	private String search;
	
	
	
	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSearch() {
		if(search == null) {
		search = "";
		}
		return  search;
		}
		
	

	public void setSearch(String search) {
		this.search = search;
	}

	//한페이지에 출력할 row의 갯수
	private Long perPage;
	
	//한블럭당 출력할 번호의 갯수
	private Long perBlock;
	
	//전체 페이지 갯수
	private Long totalPage;
	
	
	public Long getTotalPage() {
		return totalPage;
	}

	public Long getPerBlock() {
		if(this.perBlock == null || this.perBlock<1) {
		this.perBlock=5L;
		
		
		}
		return perBlock;
	}

	public void setPerBlock(Long perBlock) {
		this.perBlock = perBlock;
	}
	
	//client가 보고싶은 페이지의 번호(parameter) 
	private Long page;
	
	//table에서 조회할 시작번호 
	private Long startRow;
	//table에서 조회할 끝번호 
	private Long lastRow;
	
	private boolean before;
	public boolean isBefore() {
		return before;
	}



	public void setBefore(boolean before) {
		this.before = before;
	}
	private boolean after;
	
	//전체 Low의 갯수를 담을 변수 
	private Long totalCount;
	
	private Long startNum;
	private Long lastNum;

	
	
	public void makeNum(Long totalCount) {
		//1.전체 row의 갯수 구하기
		//2.총 page의 갯수 구하기 
		this.totalPage = totalCount/this.getPerPage();
		if (totalCount%this.getPerPage() !=0 ) {
		//	totalPage = totalPage+1;
	    //   totalPage++;
			totalPage+=1;
		}
		if(this.getPage()>totalPage) {
			this.setPage(totalPage);
		}
		
		//3. 한블럭에 출력할 번호의 갯수 
		
		
		//4. 총 블럭의 수 구하기 
		Long totalBlock = totalPage / this.getPerBlock();
		if(this.totalPage % this.getPerBlock() !=0 ) {
			totalBlock++;
		}
		
		//5. page 번호로 현재 블록 번호 구하기 
		//page 1-5 curBlock 1
		//page 6-10 curBlock 2
		//page 11-15 curBlock 3 ...
		Long curBlock = this.getPage() /this.getPerBlock();
		
		if(this.page % this.getPerBlock() != 0) {
			curBlock++;
		}
		//6. 현재 블록번호의 시작번호와 끝번호를 계산하기
		//curblock  startNum lastNum
		// * 1         1        5
		this.startNum = (curBlock-1)*this.getPerBlock()+1;
		this.lastNum = (curBlock*this.getPerBlock());
	
		this.after=true;
		if(curBlock==totalBlock) {
			lastNum = totalPage;
			this.after=false;
		}
		if(curBlock==1) {
			this.before=true;
		}
	}
	
	
	
	public boolean isAfter() {
		return after;
	}

	public void setAfter(boolean after) {
		this.after = after;
	}



	public Long getStartNum() {
		return startNum;
	}

	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}

	public Long getLastNum() {
		return lastNum;
	}

	public void setLastNum(Long lastNum) {
		this.lastNum = lastNum;
	}
	
	
	public Long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}

	public Pager() {
		this.perPage=10L;
	}
	
	   //startRow, lastRow 계산 하는 메서드
	public void makeRow() {
	      this.startRow = (this.getPage()-1)*this.getPerPage()+1;
	      this.lastRow = this.getPage()*this.getPerPage();
	}
	   
	public Long getStartRow() {
		return startRow;
	}
	
	public Long getPerPage() {
		if(this.perPage==null || this.perPage<1) {
		this.perPage=10L;
	}
		return perPage;
	}
		
	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}
	
	public Long getPage() {
		if(this.page==null || this.page<1) {
			this.page=1L;
		}
		return page;
	}
	
	public void setPage(Long page) {
		this.page = page;
	}
	public void setStartRow(Long startRow) {
		this.startRow = startRow;
	}
	public Long getLastRow() {
		return lastRow;
	}
	public void setLastRow(Long lastRow) {
		this.lastRow = lastRow;
	}

	public Long getProductNum() {
		return productNum;
	}

	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String[] getRoleName() {
		return roleName;
	}

	public void setRoleName(String[] roleName) {
		this.roleName = roleName;
	}

	public void setTotalPage(Long totalPage) {
		this.totalPage = totalPage;
	}
	
	
}
