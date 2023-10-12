package model;

import java.util.Date;

public class QuestionComment {
	
	private int ser; //답변 번호
	private int num; //문의글 번호
	private String content; //답변 내용
	private Date regdate; //답변작성날짜
	
	/*
create table questioncomment(
ser int primary key,
num int,
content varchar(2000),
regdate date);
create sequence questioncommentseq;
	
	*/	
	
	
	public int getSer() {
		return ser;
	}
	public void setSer(int ser) {
		this.ser = ser;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "QuestionComment [ser=" + ser + ", num=" + num + ", content=" + content + ", regdate=" + regdate + "]";
	}
	
	
	

}
