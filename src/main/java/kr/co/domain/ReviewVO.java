package kr.co.domain;

public class ReviewVO {

	private int rno;
	private int ino;
	private String id;
	private String content;
	private String regdate;
	private String updatedate;
	
	public ReviewVO() {
		// TODO Auto-generated constructor stub
	}	

	public ReviewVO(int rno, int ino, String id, String content, String regdate, String updatedate) {
		super();
		this.rno = rno;
		this.ino = ino;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
		this.updatedate = updatedate;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getIno() {
		return ino;
	}

	public void setIno(int ino) {
		this.ino = ino;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	@Override
	public String toString() {
		return "ReviewVO [rno=" + rno + ", ino=" + ino + ", id=" + id + ", content=" + content + ", regdate=" + regdate
				+ ", updatedate=" + updatedate + "]";
	}
	
}	
	