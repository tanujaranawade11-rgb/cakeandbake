package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.helper.Connect;
import com.pojo.CategoryPojo;

public class CategoryDaoimpl {
	Connection con=Connect.getConnect();
	PreparedStatement ps;
	
	public boolean addCategory(String name,String desc) {
		try {
			ps=con.prepareStatement("insert into category(name,descp) values(?,?)");
			ps.setString(1, name);
			ps.setString(2, desc);
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
	
	public List<CategoryPojo> getAllCategory() {
		List<CategoryPojo> l=new ArrayList<CategoryPojo>();
		try {
			ps=con.prepareStatement("select * from category");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				CategoryPojo categoryPojo=new CategoryPojo();
				categoryPojo.setId(rs.getInt("id"));
				categoryPojo.setName(rs.getString("name"));
				categoryPojo.setDesc(rs.getString("descp"));
				l.add(categoryPojo);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return l;
	}
}
