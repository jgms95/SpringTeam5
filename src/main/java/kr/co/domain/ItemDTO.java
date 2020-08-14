package kr.co.domain;

import java.io.Serializable;

public class ItemDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int ino;
	private String ititle;
	private String iwriter;
	private String publishDay;
	private String publisher;
	private String cataCode;
	private String sfilename;
	private String content;
	private int price;
	private int readcnt;
	private String writeday;
	private int percent;
	private int discountedPrice;
	private int stock;
	private String id;
	private String prolog;
	private int like1;
	private String TC;
	private int totalPage;
	private String classify;
	private String bookInfo;
	private String iwriteInfo;
	
	public ItemDTO(int ino, String ititle, String iwriter, String publishDay, String publisher, String cataCode,
			String sfilename, String content, int price, int readcnt, String writeday, int percent, int discountedPrice,
			int stock, String id, String prolog, int like1, String tC, int totalPage, String classify, String bookInfo,
			String iwriteInfo) {
		super();
		this.ino = ino;
		this.ititle = ititle;
		this.iwriter = iwriter;
		this.publishDay = publishDay;
		this.publisher = publisher;
		this.cataCode = cataCode;
		this.sfilename = sfilename;
		this.content = content;
		this.price = price;
		this.readcnt = readcnt;
		this.writeday = writeday;
		this.percent = percent;
		this.discountedPrice = discountedPrice;
		this.stock = stock;
		this.id = id;
		this.prolog = prolog;
		this.like1 = like1;
		TC = tC;
		this.totalPage = totalPage;
		this.classify = classify;
		this.bookInfo = bookInfo;
		this.iwriteInfo = iwriteInfo;
	}


	public String getBookInfo() {
		return bookInfo;
	}


	public void setBookInfo(String bookInfo) {
		this.bookInfo = bookInfo;
	}


	public String getIwriterInfo() {
		return iwriteInfo;
	}


	public void setIwriterInfo(String iwriterInfo) {
		this.iwriteInfo = iwriterInfo;
	}


	public ItemDTO(int ino, String ititle, String iwriter, String publishDay, String publisher, String cataCode,
			String sfilename, String content, int price, int readcnt, String writeday, int percent, int discountedPrice,
			int stock, String id, String prolog, int like1, String tC, int totalPage, String classify) {
		super();
		this.ino = ino;
		this.ititle = ititle;
		this.iwriter = iwriter;
		this.publishDay = publishDay;
		this.publisher = publisher;
		this.cataCode = cataCode;
		this.sfilename = sfilename;
		this.content = content;
		this.price = price;
		this.readcnt = readcnt;
		this.writeday = writeday;
		this.percent = percent;
		this.discountedPrice = discountedPrice;
		this.stock = stock;
		this.id = id;
		this.prolog = prolog;
		this.like1 = like1;
		TC = tC;
		this.totalPage = totalPage;
		this.classify = classify;
	}


	public String getCataCode() {
		return cataCode;
	}


	public void setCataCode(String cataCode) {
		this.cataCode = cataCode;
	}


	public String getSfilename() {
		return sfilename;
	}


	public void setSfilename(String sfilename) {
		this.sfilename = sfilename;
	}


	public String getTC() {
		return TC;
	}


	public void setTC(String tC) {
		TC = tC;
	}


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public String getClassify() {
		return classify;
	}


	public void setClassify(String classify) {
		this.classify = classify;
	}


	public int getStock() {
		return stock;
	}


	public void setStock(int stock) {
		this.stock = stock;
	}
	
	public int getLike1() {
		return like1;
	}


	public void setLike1(int like1) {
		this.like1 = like1;
	}


	public int getPercent() {
		return percent;
	}
	

	public String getProlog() {
		return prolog;
	}


	public void setProlog(String prolog) {
		this.prolog = prolog;
	}


	public ItemDTO(int ino, String ititle, String iwriter, String publishDay, String publisher, String cataCode,
			String sfilename, String content, int price, int readcnt, String writeday, int percent, int discountedPrice,
			int stock, String id, String prolog) {
		super();
		this.ino = ino;
		this.ititle = ititle;
		this.iwriter = iwriter;
		this.publishDay = publishDay;
		this.publisher = publisher;
		this.cataCode = cataCode;
		this.sfilename = sfilename;
		this.content = content;
		this.price = price;
		this.readcnt = readcnt;
		this.writeday = writeday;
		this.percent = percent;
		this.discountedPrice = discountedPrice;
		this.stock = stock;
		this.id = id;
		this.prolog = prolog;
	}







	public ItemDTO(int ino, String ititle, String iwriter, String publishDay, String publisher, String cataCode,
			String sfilename, String content, int price, int readcnt, String writeday, int percent, int discountedPrice,
			int stock, String id, String prolog, int like1) {
		super();
		this.ino = ino;
		this.ititle = ititle;
		this.iwriter = iwriter;
		this.publishDay = publishDay;
		this.publisher = publisher;
		this.cataCode = cataCode;
		this.sfilename = sfilename;
		this.content = content;
		this.price = price;
		this.readcnt = readcnt;
		this.writeday = writeday;
		this.percent = percent;
		this.discountedPrice = discountedPrice;
		this.stock = stock;
		this.id = id;
		this.prolog = prolog;
		this.like1 = like1;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public void setPercent(int percent) {
		this.percent = percent;
	}

	public ItemDTO(int ino, String ititle, String iwriter, String publishDay, String publisher, String cataCode,
			String sfilename, String content, int price, int readcnt, String writeday, int percent) {
		super();
		this.ino = ino;
		this.ititle = ititle;
		this.iwriter = iwriter;
		this.publishDay = publishDay;
		this.publisher = publisher;
		this.cataCode = cataCode;
		this.sfilename = sfilename;
		this.content = content;
		this.price = price;
		this.readcnt = readcnt;
		this.writeday = writeday;
		this.percent = percent;
	}

	public ItemDTO() {
		// TODO Auto-generated constructor stub
	}

	public ItemDTO(int ino2, String ititle2, String iwriter2, String publishDay2, String publisher2, String cateCode,
			String newFileName, String content2, int price2, int i, Object object, int percent2, int discountedPrice2,
			int stock2, String prolog2) {
		
		
		
		
		// TODO Auto-generated constructor stub
	}
	
	


	public int getIno() {
		return ino;
	}

	public void setIno(int ino) {
		this.ino = ino;
	}

	public String getItitle() {
		return ititle;
	}

	public void setItitle(String ititle) {
		this.ititle = ititle;
	}

	public int getDiscountedPrice() {
		return discountedPrice;
	}


	public void setDiscountedPrice(int discountedPrice) {
		this.discountedPrice = discountedPrice;
	}


	public String getIwriter() {
		return iwriter;
	}

	public void setIwriter(String iwriter) {
		this.iwriter = iwriter;
	}

	public String getPublishDay() {
		return publishDay;
	}

	public void setPublishDay(String publishDay) {
		this.publishDay = publishDay;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getCateCode() {
		return cataCode;
	}

	public void setCateCode(String cateCode) {
		this.cataCode = cateCode;
	}

	public String getFilename() {
		return sfilename;
	}

	public void setFilename(String filename) {
		this.sfilename = filename;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}





	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ino;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ItemDTO other = (ItemDTO) obj;
		if (ino != other.ino)
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "ItemDTO [ino=" + ino + ", ititle=" + ititle + ", iwriter=" + iwriter + ", publishDay=" + publishDay
				+ ", publisher=" + publisher + ", cataCode=" + cataCode + ", sfilename=" + sfilename + ", content="
				+ content + ", price=" + price + ", readcnt=" + readcnt + ", writeday=" + writeday + ", percent="
				+ percent + ", discountedPrice=" + discountedPrice + ", stock=" + stock + ", id=" + id + ", prolog="
				+ prolog + ", like1=" + like1 + ", TC=" + TC + ", totalPage=" + totalPage + ", classify=" + classify
				+ ", bookInfo=" + bookInfo + ", iwriterInfo=" + iwriteInfo + ", getBookInfo()=" + getBookInfo()
				+ ", getIwriterInfo()=" + getIwriterInfo() + ", getCataCode()=" + getCataCode() + ", getSfilename()="
				+ getSfilename() + ", getTC()=" + getTC() + ", getTotalPage()=" + getTotalPage() + ", getClassify()="
				+ getClassify() + ", getStock()=" + getStock() + ", getLike1()=" + getLike1() + ", getPercent()="
				+ getPercent() + ", getProlog()=" + getProlog() + ", getId()=" + getId() + ", getIno()=" + getIno()
				+ ", getItitle()=" + getItitle() + ", getDiscountedPrice()=" + getDiscountedPrice() + ", getIwriter()="
				+ getIwriter() + ", getPublishDay()=" + getPublishDay() + ", getPublisher()=" + getPublisher()
				+ ", getCateCode()=" + getCateCode() + ", getFilename()=" + getFilename() + ", getContent()="
				+ getContent() + ", getPrice()=" + getPrice() + ", getReadcnt()=" + getReadcnt() + ", getWriteday()="
				+ getWriteday() + ", hashCode()=" + hashCode() + ", getClass()=" + getClass() + ", toString()="
				+ super.toString() + "]";
	}




	
	
	

}
