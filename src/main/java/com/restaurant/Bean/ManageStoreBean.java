package com.restaurant.Bean;

public class ManageStoreBean {

	private int id;
	private String store_name;
	private String status;  // for status active and Inactive -1 for active and 0 fro inactive
	private ManageTableBean tablebean;
	
	public ManageTableBean getTablebean() {
		return tablebean;
	}
	public void setTablebean(ManageTableBean tablebean) {
		this.tablebean = tablebean;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String isStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
