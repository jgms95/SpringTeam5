package kr.co.domain;

import java.io.Serializable;

public class EventDTO implements Serializable {

	private static final long serialVersionUID = 1L;
	private int eno;
	private String id;
	private String title;
	private String content;
	private String writeday;
	private String filename;
	private String titleImg;
	private int readcnt;
	
	public EventDTO() {
	}

	

	public EventDTO(int eno, String id, String title, String content, String writeday, String filename, String titleImg,
			int readcnt) {
		super();
		this.eno = eno;
		this.id = id;
		this.title = title;
		this.content = content;
		this.writeday = writeday;
		this.filename = filename;
		this.titleImg = titleImg;
		this.readcnt = readcnt;
	}

	

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
