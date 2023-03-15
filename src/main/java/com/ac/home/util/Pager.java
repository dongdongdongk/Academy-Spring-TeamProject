package com.ac.home.util;

public class Pager {
	
	private Long bookNumber;
	
	
	
	public Long getBookNumber() {
		return bookNumber;
	}

	public void setBookNumber(Long bookNumber) {
		this.bookNumber = bookNumber;
	}

	//κ²?? μ’λ₯(?¬?©?  column)
	private String kind;
	//κ²???΄
	private String search;
	
	//???΄μ§?? μΆλ ₯?  ROW? κ°??
	private Long perPage;
	
	//?λΈλ­?Ή μΆλ ₯?  λ²νΈ? κ°??
	private Long perBlock;
	
	//? μ²? page κ°??
	private Long totalPage;
	
	//Clientκ°? λ³΄κ³ ?Ά?? ??΄μ§? λ²νΈ(parameter)
	private Long page;
	
	//Table?? μ‘°ν?  ??λ²νΈ
	private Long startRow;
	//Table?? μ‘°ν?  ?λ²νΈ
	private Long lastRow;
	
	//? μ²? row? κ°??λ₯? ?΄? λ³??
	//private Long totalCount;
	
	private Long startNum;
	private Long lastNum;
	
	private boolean before;
	private boolean after;
	
	public Pager() {
		this.perPage=10L;
	}
	
	//startRow, lastRow κ³μ° ?? λ©μ?
	public void makeRow() {
		this.startRow = (this.getPage()-1)*this.getPerPage()+1;
		this.lastRow = this.getPage()*this.getPerPage();
	}
	
	//startNum, lastNum
	public void makeNum(Long totalCount) {
		
		//1. ? μ²? row? κ°?? κ΅¬νκΈ?
		//2. μ΄? page? κ°?? κ΅¬νκΈ?
		this.totalPage = totalCount/this.getPerPage();
		if(totalCount%this.getPerPage() != 0 ) {
			//totalPage=totalPage+1;
			//totalPage+=1;
			totalPage++;		
		}
		if(this.getPage()>totalPage) {
			this.setPage(totalPage);
		}
		//3. ? λΈλ­? μΆλ ₯?  λ²νΈ? κ°??
		
		
		//4. μ΄? λΈλ­? ? κ΅¬νκΈ?
		Long totalBlock = totalPage / this.getPerBlock();
		if(totalPage % this.getPerBlock() != 0) {
			totalBlock++;
		}
		
		//5. page λ²νΈλ‘? ??¬ λΈλ­ λ²νΈ κ΅¬νκΈ?
		// page 1-5 curBlock 1
		// page 6-10 curBlock 2
		// page 11-15 curBlock 3
		 Long curBlock=this.getPage() / this.getPerBlock();
		 
		 if(this.getPage() % this.getPerBlock() != 0) {
			 curBlock++;
		 }
		 
		 //6. curBlock? ??λ²νΈ?? ?λ²νΈλ₯? κ³μ°
		 /**	curBlock	startNum	lastNum
		  * 	1			1			5
		  * 	2			6			10
		  * 	3			11			15
		  */
		 
		 this.startNum=(curBlock-1)*this.getPerBlock()+1;
		 this.lastNum=curBlock*this.getPerBlock();
		 
		 this.after=true;
		 if(curBlock==totalBlock) {
			 lastNum=totalPage;
			 this.after=false;
		 }
		 
		 if(curBlock==1) {
			 this.before=true;
		 }
		 
	}
	
	
//	public Long getTotalCount() {
//		return totalCount;
//	}
//
//	public void setTotalCount(Long totalCount) {
//		this.totalCount = totalCount;
//	}
	
	
	
	

	public Long getPerPage() {
		if(this.perPage==null || this.perPage==0) {
			this.perPage=10L;
		}
		return perPage;
	}
	
	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSearch() {
		if(search == null) {
			search="";
		}
		return search; //"%"+search+"%";
	}

	public void setSearch(String search) {
		this.search = search;
	}

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

	public boolean isBefore() {
		return before;
	}

	public void setBefore(boolean before) {
		this.before = before;
	}

	public boolean isAfter() {
		return after;
	}

	public void setAfter(boolean after) {
		this.after = after;
	}

	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}
	public Long getPage() {
		if(this.page == null || this.page<1) {
			this.page=1L;
		}
		return page;
	}
	public void setPage(Long page) {
		this.page = page;
	}
	public Long getStartRow() {
		return startRow;
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
	
	
	
	

}