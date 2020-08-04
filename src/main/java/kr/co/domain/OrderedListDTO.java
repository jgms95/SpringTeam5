package kr.co.domain;

import java.io.Serializable;

public class OrderedListDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int ono;
	private String id;
	private int ino;
	private int pcs;
	private String ititle;
	private String email;
	private String receiver;
	private int payPrice;
	private String payOption;
	private String message;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String phoneNum;
	
	public OrderedListDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public int getPcs() {
		return pcs;
	}
	public void setPcs(int pcs) {
		this.pcs = pcs;
	}
	public String getItitle() {
		return ititle;
	}
	public void setItitle(String ititle) {
		this.ititle = ititle;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public int getPayPrice() {
		return payPrice;
	}
	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}
	public String getPayOption() {
		return payOption;
	}
	public void setPayOption(String payOption) {
		this.payOption = payOption;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getUserAddr1() {
		return userAddr1;
	}
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}
	public String getUserAddr2() {
		return userAddr2;
	}
	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}
	public String getUserAddr3() {
		return userAddr3;
	}
	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public OrderedListDTO(int ono, String id, int ino, int pcs, String ititle, String email, String receiver,
			int payPrice, String payOption, String message, String userAddr1, String userAddr2, String userAddr3,
			String phoneNum) {
		super();
		this.ono = ono;
		this.id = id;
		this.ino = ino;
		this.pcs = pcs;
		this.ititle = ititle;
		this.email = email;
		this.receiver = receiver;
		this.payPrice = payPrice;
		this.payOption = payOption;
		this.message = message;
		this.userAddr1 = userAddr1;
		this.userAddr2 = userAddr2;
		this.userAddr3 = userAddr3;
		this.phoneNum = phoneNum;
	}
	
}
