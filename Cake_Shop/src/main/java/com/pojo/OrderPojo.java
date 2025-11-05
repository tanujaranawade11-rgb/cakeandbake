package com.pojo;

public class OrderPojo {
private int id;
private String pname;
private float price;
private String address;
private String email;
private String date;
private String pid;
private int quantity;
private float tprice;



public float getTprice() {
	return tprice;
}
public void setTprice(float tprice) {
	this.tprice = tprice;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getPname() {
	return pname;
}
public void setPname(String pname) {
	this.pname = pname;
}
public float getPrice() {
	return price;
}
public void setPrice(float price) {
	this.price = price;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getPid() {
	return pid;
}
public void setPid(String pid) {
	this.pid = pid;
}
public OrderPojo(String pname, float price, String address, String email, String date, String pid,int quantity,float tprice) {
	super();
	this.pname = pname;
	this.price = price;
	this.address = address;
	this.email = email;
	this.date = date;
	this.pid = pid;
	this.quantity=quantity;
	this.tprice=tprice;
}
public OrderPojo() {
	super();
	// TODO Auto-generated constructor stub
}


}
