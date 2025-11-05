package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.helper.Connect;
import com.pojo.UserPojo;

public class UserDaoimpl {
	Connection con=Connect.getConnect();
	PreparedStatement ps;
	public boolean register(UserPojo userPojo) {
	try {
		String q="insert into register (fname,lname,contact,email,password) values(?,?,?,?,?)";
		ps=con.prepareStatement(q);
		ps.setString(1,userPojo.getFname());
		ps.setString(2,userPojo.getLname());
		ps.setString(3,userPojo.getConatct());
		ps.setString(4,userPojo.getEmail());
		ps.setString(5,userPojo.getPassword());
		int x=ps.executeUpdate();
		if(x>0) {
			return true;
		}
		else {
			return false;
		}
		
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return false;
}
	public boolean login(String email,String password) {
		try {
			String q="select * from register where email=? and password=?";
			ps=con.prepareStatement(q);
			ps.setString(1, email);
			ps.setString(2,password);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				return true;
			}
			else {
				return false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	
	public String getUsernameByEmail(String email) {
		String name=null;
		try {
			String q="select fname from register where email=?";
			ps=con.prepareStatement(q);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				name=rs.getString("fname");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return name;
	}
	
	public List<UserPojo> getAllUser(){
		List<UserPojo> l=new ArrayList<UserPojo>();
		try {
			String q="select * from register";
			ps=con.prepareStatement(q);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				UserPojo userPojo=new UserPojo();
				userPojo.setUid(rs.getInt("uid"));
				userPojo.setFname(rs.getString("fname"));
				userPojo.setLname(rs.getString("lname"));
				userPojo.setConatct(rs.getString("contact"));
				userPojo.setEmail(rs.getString("email"));
				userPojo.setPassword(rs.getString("password"));
				l.add(userPojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return l;
	}
	
	public UserPojo getUserById(int id){
		UserPojo userPojo=new UserPojo();
		try {
			String q="select * from register where uid=?";
			ps=con.prepareStatement(q);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				
				userPojo.setUid(rs.getInt("uid"));
				userPojo.setFname(rs.getString("fname"));
				userPojo.setLname(rs.getString("lname"));
				userPojo.setConatct(rs.getString("contact"));
				userPojo.setEmail(rs.getString("email"));
				userPojo.setPassword(rs.getString("password"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return userPojo;
	}
	
	
	public boolean updateUserById(UserPojo userPojo,int id) {
		try {
			String q="update register set fname=?,lname=?,contact=?,email=?,password=? where uid=?";
			ps=con.prepareStatement(q);
			ps.setString(1,userPojo.getFname());
			ps.setString(2,userPojo.getLname());
			ps.setString(3,userPojo.getConatct());
			ps.setString(4,userPojo.getEmail());
			ps.setString(5,userPojo.getPassword());
			ps.setInt(6,id);
			int x=ps.executeUpdate();
			if(x>0) {
				return true;
			}
			else {
				return false;
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteUserById(int id) {
		try {
			String q="delete from register where uid=?";
			ps=con.prepareStatement(q);
			ps.setInt(1, id);
			int x=ps.executeUpdate();
			if(x>0) {
				return true;
			}
			else {
				return false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	
	
}
