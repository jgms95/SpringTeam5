package kr.co.domain;

import java.io.Serializable;

public class EventCommentDTO implements Serializable {

	private static final long serialVersionUID = 1L;
	private int num;
	private String id;
	private int eno;
	private String content;
	private String writeday;
	private int repRoot;
	private int repStep;
	private int repIndent;
	private String orgWriter;
	
	public EventCommentDTO() {
	}
	

	

	public EventCommentDTO(int num, String id, int eno, String content, String writeday, int repRoot, int repStep,
			int repIndent, String orgWriter) {
		super();
		this.num = num;
		this.id = id;
		this.eno = eno;
		this.content = content;
		this.writeday = writeday;
		this.repRoot = repRoot;
		this.repStep = repStep;
		this.repIndent = repIndent;
		this.orgWriter = orgWriter;
	}




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

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	public int getRepRoot() {
		return repRoot;
	}

	public void setRepRoot(int repRoot) {
		this.repRoot = repRoot;
	}

	public int getRepStep() {
		return repStep;
	}

	public void setRepStep(int repStep) {
		this.repStep = repStep;
	}

	public String getOrgWriter() {
		return orgWriter;
	}

	public void setOrgWriter(String orgWriter) {
		this.orgWriter = orgWriter;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRepIndent() {
		return repIndent;
	}

	public void setRepIndent(int repIndent) {
		this.repIndent = repIndent;
	}
	
	

}
