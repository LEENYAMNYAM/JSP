package com.product.model;

public class ProductDTO {
	//필드
	private int pnum;
	private String name;
	private int unitPrice;
	private String description;
	private String ofile; //originalfile
	private String sfile; //savefile
//	sfile 실제 저장 주소
//	D:\JMT\JSP\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\ServletProject2\Uploads
	
	// getter, setter
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	
	
	
	
}
