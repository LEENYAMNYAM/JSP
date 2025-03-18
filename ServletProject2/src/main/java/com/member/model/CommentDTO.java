package com.member.model;

public class CommentDTO {
	//필드
	private int cnum; 	// 댓글 번호
	private String userid;
	private String msg;
	private String regdate;
	private int bnum;	//부모게시글 번호
	
	//getter, setter
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String refdate) {
		this.regdate = refdate;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}



}
