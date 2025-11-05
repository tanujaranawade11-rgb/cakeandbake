package com.pojo;

public class AddressPojo {
private int aid;
private int pid;
private String state;
private String city;
private String street;
private int pincode;
private String landmark;
public int getAid() {
	return aid;
}
public void setAid(int aid) {
	this.aid = aid;
}
public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getStreet() {
	return street;
}
public void setStreet(String street) {
	this.street = street;
}
public int getPincode() {
	return pincode;
}
public void setPincode(int pincode) {
	this.pincode = pincode;
}
public String getLandmark() {
	return landmark;
}
public void setLandmark(String landmark) {
	this.landmark = landmark;
}
public AddressPojo(int pid, String state, String city, String street, int pincode, String landmark) {
	super();
	this.pid = pid;
	this.state = state;
	this.city = city;
	this.street = street;
	this.pincode = pincode;
	this.landmark = landmark;
}
public AddressPojo() {
	super();
	// TODO Auto-generated constructor stub
}

}
