package com.pojo;

public class Profilepojo {
private int pid;
private String Name;
private String email;
private String contact;
private String State;
private String city;
private String Street;
private String pincode;
private String landmark;
private String image;
public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
}

public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getName() {
	return Name;
}
public void setName(String name) {
	Name = name;
}
public String getContact() {
	return contact;
}
public void setContact(String contact) {
	this.contact = contact;
}
public String getState() {
	return State;
}
public void setState(String state) {
	State = state;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getStreet() {
	return Street;
}
public void setStreet(String street) {
	Street = street;
}
public String getPincode() {
	return pincode;
}
public void setPincode(String pincode) {
	this.pincode = pincode;
}
public String getLandmark() {
	return landmark;
}
public void setLandmark(String landmark) {
	this.landmark = landmark;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public Profilepojo(String name,String email ,String contact, String state, String city, String street, String pincode, String landmark,
		String image) {
	super();
	Name = name;
	this.email=email;
	this.contact = contact;
	State = state;
	this.city = city;
	Street = street;
	this.pincode = pincode;
	this.landmark = landmark;
	this.image = image;
}
public Profilepojo() {
	super();
	// TODO Auto-generated constructor stub
}


}
