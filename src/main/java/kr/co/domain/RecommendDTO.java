package kr.co.domain;

import java.io.Serializable;

public class RecommendDTO implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int ino;
	private String bookName;
	private String fileName;
	private String content;
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public RecommendDTO() {
		// TODO Auto-generated constructor stub
	}
	public RecommendDTO(int ino, String bookName, String fileName, String content) {
		super();
		this.ino = ino;
		this.bookName = bookName;
		this.fileName = fileName;
		this.content = content;
	}
}
