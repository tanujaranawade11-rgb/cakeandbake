package com.pojo;

public class CartPojo {
private int cid;
private String name;
private float price;
private int quantity;
private float tprice;
private String email;
private String image;
private int pid;
private float oprice;

public float getOprice() {
	return oprice;
}
public void setOprice(float oprice) {
	this.oprice = oprice;
}
public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
}
public int getCid() {
	return cid;
}
public void setCid(int cid) {
	this.cid = cid;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public float getPrice() {
	return price;
}
public void setPrice(float price) {
	this.price = price;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public float getTprice() {
	return tprice;
}
public void setTprice(float tprice) {
	this.tprice = tprice;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}

public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public CartPojo(String name, float price, int quantity, float tprice, String email,String image) {
	super();
	this.name = name;
	this.price = price;
	this.quantity = quantity;
	this.tprice = tprice;
	this.email = email;
	this.image=image;
}
public CartPojo() {
	super();
	// TODO Auto-generated constructor stub
}



}
