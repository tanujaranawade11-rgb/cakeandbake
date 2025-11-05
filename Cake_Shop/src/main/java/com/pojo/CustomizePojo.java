package com.pojo;

public class CustomizePojo {
private int id;
private String name;
private String contact;
private String email;
private String detail;
private String image;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getContact() {
	return contact;
}
public void setContact(String contact) {
	this.contact = contact;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getDetail() {
	return detail;
}
public void setDetail(String detail) {
	this.detail = detail;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public CustomizePojo(String name, String contact, String email, String detail, String image) {
	super();
	this.name = name;
	this.contact = contact;
	this.email = email;
	this.detail = detail;
	this.image = image;
}
public CustomizePojo() {
	super();
	// TODO Auto-generated constructor stub
}


}
