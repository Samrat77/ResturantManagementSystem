package com.restaurant.Bean;

public class ManageTableBean {
private int tid;
private String table_name;
private String table_cap;
private String status;
private int storeid;





public int getStore() {
	return storeid;
}
public void setStore(int storeid) {
	this.storeid = storeid;
}
public int getTid() {
	return tid;
}
public void setTid(int tid) {
	this.tid = tid;
}
public String getTable_name() {
	return table_name;
}
public void setTable_name(String table_name) {
	this.table_name = table_name;
}
public String getTable_cap() {
	return table_cap;
}
public void setTable_cap(String table_cap) {
	this.table_cap = table_cap;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}

}
