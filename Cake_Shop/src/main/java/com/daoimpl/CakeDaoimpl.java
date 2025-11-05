package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.helper.Connect;
import com.pojo.CakePojo;

public class CakeDaoimpl {
	Connection con=Connect.getConnect();
	PreparedStatement ps;
	
	public boolean addCake (CakePojo cakePojo)  {
		try {
			String q="insert into cake(name,price,discount,fprice,category,image,description)values(?,?,?,?,?,?,?)";
					ps=con.prepareStatement(q);
					ps.setString(1,cakePojo.getName());
					ps.setInt(2,cakePojo.getPrice());
					ps.setInt(3,cakePojo.getDiscount());
					ps.setInt(4,cakePojo.getFprice());
					ps.setString(5,cakePojo.getCategory());
					ps.setString(6,cakePojo.getImage());
					ps.setString(7,cakePojo.getDescription());
					
					int x=ps.executeUpdate();
					if(x>0) {
						return true;
					}
					else {
						return false;
					}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<CakePojo>  getAllCake(){
		List<CakePojo> l=new ArrayList<CakePojo>();
		try {
			String q="select * from cake";
			ps=con.prepareStatement(q);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				CakePojo cakePojo = new CakePojo();
				cakePojo.setId(rs.getInt("cid"));
				cakePojo.setName(rs.getString("name"));
				cakePojo.setPrice(rs.getInt("price"));
				cakePojo.setDiscount(rs.getInt("discount"));
				cakePojo.setFprice(rs.getInt("fprice"));
				cakePojo.setCategory(rs.getString("category"));
				cakePojo.setDescription(rs.getString("description"));
				cakePojo.setImage(rs.getString("image"));
				l.add(cakePojo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return l;
		}
	
	
	
	public CakePojo  getCakeById(int id){
		CakePojo cakePojo=new CakePojo();
		try {
			String q="select * from cake where cid=?";
			ps=con.prepareStatement(q);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				
				cakePojo.setId(rs.getInt("cid"));
				cakePojo.setName(rs.getString("name"));
				cakePojo.setPrice(rs.getInt("price"));
				cakePojo.setDiscount(rs.getInt("discount"));
				cakePojo.setFprice(rs.getInt("fprice"));
				cakePojo.setCategory(rs.getString("category"));
				cakePojo.setDescription(rs.getString("description"));
				cakePojo.setImage(rs.getString("image"));
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return cakePojo;
		}
	
	
	
	public boolean UpdateCakeByID (CakePojo cakePojo,int id)  {
		try {
			String q="update cake set name=?,price=?,discount=?,fprice=?,category=?,image=?,description=? where cid=?";
					ps=con.prepareStatement(q);
					ps.setString(1,cakePojo.getName());
					ps.setFloat(2,cakePojo.getPrice());
					ps.setInt(3,cakePojo.getDiscount());
					ps.setFloat(4,cakePojo.getFprice());
					ps.setString(5,cakePojo.getCategory());
					ps.setString(6,cakePojo.getImage());
					ps.setString(7,cakePojo.getDescription());
					ps.setInt(8, id);					
					int x=ps.executeUpdate();
					if(x>0) {
						return true;
					}
					else {
						return false;
					}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	public boolean deleteCakeByID (int id)  {
		try {
			String q="delete from cake where cid=?";
					ps=con.prepareStatement(q);
					
					ps.setInt(1, id);					
					int x=ps.executeUpdate();
					if(x>0) {
						return true;
					}
					else {
						return false;
					}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	
	
}
