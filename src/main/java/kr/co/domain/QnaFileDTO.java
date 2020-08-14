package kr.co.domain;

import java.io.Serializable;

public class QnaFileDTO implements Serializable{

	private static final long serialVersionUID = 1L;
	private int file_num;
	private String o_name;
	private String file_name;
	private String filepath;
	private int qno;
	
	public QnaFileDTO() {
	}

	public QnaFileDTO(int file_num, String o_name, String file_name, String filepath, int qno) {
		super();
		this.file_num = file_num;
		this.o_name = o_name;
		this.file_name = file_name;
		this.filepath = filepath;
		this.qno = qno;
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

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

	
	
	
	

}