package com.ac.home.notice;

import java.sql.Date;
import java.util.List;

public class NoticeDTO {

	private Long num;
	private String title;
	private String contents;
	private String writer;
	private Date regDate;
	private Long hit;
	private List<NoticeFileDTO> noticeFileDTOs;
	private Long checked;
	

	
	public Long getChecked() {
		return checked;
	}
	public void setChecked(Long checked) {
		this.checked = checked;
	}
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Long getHit() {
		return hit;
	}
	public void setHit(Long hit) {
		this.hit = hit;
	}
	public List<NoticeFileDTO> getNoticeFileDTOs() {
		return noticeFileDTOs;
	}
	public void setNoticeFileDTOs(List<NoticeFileDTO> noticeFileDTOs) {
		this.noticeFileDTOs = noticeFileDTOs;
	}
}
