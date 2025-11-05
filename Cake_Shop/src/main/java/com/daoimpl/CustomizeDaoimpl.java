package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.helper.Connect;
import com.pojo.CustomizePojo;

public class CustomizeDaoimpl {
	Connection con=Connect.getConnect();
	PreparedStatement ps;
	
	public boolean addCustomize(CustomizePojo customizePojo) {
		try {
			String q="insert into customize(name,contact,email,detail,image) values(?,?,?,?,?)";
			ps=con.prepareStatement(q);
			ps.setString(1,customizePojo.getName());
			ps.setString(2,customizePojo.getContact());
			ps.setString(3,customizePojo.getEmail());
			ps.setString(4,customizePojo.getDetail());
			ps.setString(5,customizePojo.getImage());
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
	
	public List<CustomizePojo> getAllCustomizeByEmail(String email){
		List<CustomizePojo> l=new ArrayList<CustomizePojo>();
		try {
			String q="select * from customize where email=?";
			ps=con.prepareStatement(q);
			ps.setString(1,email);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				CustomizePojo customizePojo=new CustomizePojo();
				customizePojo.setId(rs.getInt("id"));
				customizePojo.setName(rs.getString("name"));
				customizePojo.setContact(rs.getString("contact"));
				customizePojo.setEmail(rs.getString("email"));
				customizePojo.setDetail(rs.getString("detail"));
				customizePojo.setImage(rs.getString("image"));
				l.add(customizePojo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return l;
	}
}
