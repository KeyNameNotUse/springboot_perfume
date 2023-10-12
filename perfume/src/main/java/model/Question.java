package model;

import java.util.Date;

public class Question {
	
	private int num; //문의글 번호
	private String id; //아이디
	private String quesubject; //문의글 분류(상품/배송/주문및결제/회원/기타)
	private String quetitle; //문의글 제목
	private String quecontent; //문의글 내용
	private String queimage; //첨부 이미지
	private Date regdate; // 문의글 작성 날짜
	
	/*
create table question(
num int primary key,
id varchar(50),
quesubject varchar(50),
quetitle varchar(100),
quecontent varchar(2000),
queimage varchar(300),
regdate date);
create sequence questionseq;
	
	*/
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQuesubject() {
		return quesubject;
	}
	public void setQuesubject(String quesubject) {
		this.quesubject = quesubject;
	}
	public String getQuetitle() {
		return quetitle;
	}
	public void setQuetitle(String quetitle) {
		this.quetitle = quetitle;
	}
	public String getQuecontent() {
		return quecontent;
	}
	public void setQuecontent(String quecontent) {
		this.quecontent = quecontent;
	}
	public String getQueimage() {
		return queimage;
	}
	public void setQueimage(String queimage) {
		this.queimage = queimage;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "Question [num=" + num + ", id=" + id + ", quesubject=" + quesubject + ", quetitle=" + quetitle
				+ ", quecontent=" + quecontent + ", queimage=" + queimage + ", regdate="
				+ regdate + "]";
	}
	

	
	
	
}