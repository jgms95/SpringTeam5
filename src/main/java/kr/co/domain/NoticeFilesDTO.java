package kr.co.domain;

import java.io.Serializable;

public class NoticeFilesDTO implements Serializable{

	private static final long serialVersionUID = 1L;
	private int file_num;
	private String o_name;
	private String file_name; //중복처리 예방
	private int file_size;
	private int nno;
	
	public NoticeFilesDTO() {
	}

	public NoticeFilesDTO(int file_num, String o_name, String file_name, int file_size, int nno) {
		super();
		this.file_num = file_num;
		this.o_name = o_name;
		this.file_name = file_name;
		this.file_size = file_size;
		this.nno = nno;
	}

	public int getFile_num() {
		return file_num;
	}

	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}

	public String getO_name() {
		return o_name;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public int getFile_size() {
		return file_size;
	}

	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}
