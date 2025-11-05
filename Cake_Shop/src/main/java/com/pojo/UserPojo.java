package com.pojo;

public class UserPojo {
private int uid;
private String fname;
private String lname;
private String conatct;
private String email;
private String password;
public int getUid() {
	return uid;
}
public void setUid(int uid) {
	this.uid = uid;
}
public String getFname() {
	return fname;
}
public void setFname(String fname) {
	this.fname = fname;
}
public String getLname() {
	return lname;
}
public void setLname(String lname) {
	this.lname = lname;
}
public String getConatct() {
	return conatct;
}
public void setConatct(String conatct) {
	this.conatct = conatct;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public UserPojo(String fname, String lname, String conatct, String email, String password) {
	super();
	this.fname = fname;
	this.lname = lname;
	this.conatct = conatct;
	this.email = email;
	this.password = password;
}
public UserPojo() {
	super();
	// TODO Auto-generated constructor stub
}


}
