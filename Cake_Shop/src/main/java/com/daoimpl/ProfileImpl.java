package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.helper.Connect;
import com.pojo.Profilepojo;

public class ProfileImpl {
	Connection con=Connect.getConnect();
	PreparedStatement ps;
	
	public boolean addProfile(Profilepojo profilepojo) {
		// TODO Auto-generated method stub
		try {
			String q="insert into profile(name,contact,state,city,street,pincode,landmark,image,email) values(?,?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(q);
			ps.setString(1,profilepojo.getName());
			ps.setString(2,profilepojo.getContact());
			ps.setString(3,profilepojo.getState());
			ps.setString(4,profilepojo.getCity());
			ps.setString(5,profilepojo.getStreet());
			ps.setString(6,profilepojo.getPincode());
			ps.setString(7,profilepojo.getLandmark());
			ps.setString(8,profilepojo.getImage());
			ps.setString(9,profilepojo.getEmail());
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
	
	public Profilepojo getProfileByEmail(String email) {
		Profilepojo profilepojo=new Profilepojo();
		try {
			String q="select * from profile where email=?";
			ps=con.prepareStatement(q);
			ps.setString(1,email);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				profilepojo.setPid(rs.getInt("pid"));
				profilepojo.setName(rs.getString("name"));
				profilepojo.setContact(rs.getString("contact"));
				profilepojo.setState(rs.getString("state"));
				profilepojo.setCity(rs.getString("city"));
				profilepojo.setStreet(rs.getString("street"));
				profilepojo.setPincode(rs.getString("pincode"));
				profilepojo.setLandmark(rs.getString("landmark"));
				profilepojo.setImage(rs.getString("image"));
				profilepojo.setEmail(rs.getString("email"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return profilepojo;
	}
	
	public boolean updateProfileByEmail(Profilepojo profilepojo) {
		try {
			String q="update profile set name=?,contact=?,state=?,city=?,street=?,pincode=?,landmark=?,image=? where email=?";
			ps=con.prepareStatement(q);
			ps.setString(1,profilepojo.getName());
			ps.setString(2,profilepojo.getContact());
			ps.setString(3,profilepojo.getState());
			ps.setString(4,profilepojo.getCity());
			ps.setString(5,profilepojo.getStreet());
			ps.setString(6,profilepojo.getPincode());
			ps.setString(7,profilepojo.getLandmark());
			ps.setString(8,profilepojo.getImage());
			ps.setString(9,profilepojo.getEmail());
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
