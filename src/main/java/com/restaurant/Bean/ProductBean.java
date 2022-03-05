package com.restaurant.Bean;

public class ProductBean {

	private int pid;
	private String pname;
	private String price;
	private String description;
	private int categoryid;
	private int storenameid;
	private String status;
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getCategory() {
		return categoryid;
	}
	public void setCategory(int category) {
		this.categoryid = category;
	}
	public int getStorename() {
		return storenameid;
	}
	public void setStorename(int storename) {
		this.storenameid = storename;
	}
	
	
}
