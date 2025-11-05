package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.helper.Connect;
import com.pojo.AddressPojo;

public class AddressDaoimpl {
	Connection con=Connect.getConnect();
	PreparedStatement ps;
	
	public boolean addAddress(AddressPojo addressPojo) {
		try {
			String q="insert into address(pid,state,city,street,pincode,landmark) values(?,?,?,?,?,?)";
			ps=con.prepareStatement(q);
			ps.setInt(1,addressPojo.getPid());
			ps.setString(2,addressPojo.getState());
			ps.setString(3,addressPojo.getCity());
			ps.setString(4,addressPojo.getStreet());
			ps.setInt(5,addressPojo.getPincode());
			ps.setString(6,addressPojo.getLandmark());
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
	
	public boolean updateAddress(AddressPojo addressPojo,int aid) {
		try {
			String q="update address set state=?,city=?,street=?,pincode=?,landmark=? where aid=?";
			
			ps=con.prepareStatement(q);
			ps.setString(1,addressPojo.getState());
			ps.setString(2,addressPojo.getCity());
			ps.setString(3,addressPojo.getStreet());
			ps.setInt(4,addressPojo.getPincode());
			ps.setString(5,addressPojo.getLandmark());
			ps.setInt(6, aid);
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
	
	public boolean deleteAddressByAid(int aid) {
		try {
			String q="delete from address where aid=?";
			ps=con.prepareStatement(q);
			ps.setInt(1, aid);
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
