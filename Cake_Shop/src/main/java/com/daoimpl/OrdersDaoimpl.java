package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.helper.Connect;
import com.pojo.OrderPojo;

public class OrdersDaoimpl {
	Connection con=Connect.getConnect();
	PreparedStatement ps;
	
	
	public boolean addOrders(OrderPojo orderPojo) {
		try {
			String q="insert into orders(name,price,address,pid,email,quantity,tprice) values(?,?,?,?,?,?,?)";
			ps=con.prepareStatement(q);
			ps.setString(1,orderPojo.getPname());
			ps.setFloat(2,orderPojo.getPrice());
			ps.setString(3,orderPojo.getAddress());
			ps.setString(4,orderPojo.getPid());
			ps.setString(5,orderPojo.getEmail());
			ps.setInt(6, orderPojo.getQuantity());
			ps.setFloat(7,orderPojo.getTprice());
			int x=ps.executeUpdate();
			if(x>0) {
				return true;
			}
			else {
				return false;
			}
		} catch (Exception e) {
			// TODO: handle exceptio
			e.printStackTrace();
		}
		return false;
	}
	
	public List<OrderPojo> getOrdersByEmail(String email) {
	    List<OrderPojo> orders = new ArrayList<>();
	    try {
	        String q = "SELECT * FROM orders WHERE email = ?";
	        ps = con.prepareStatement(q);
	        ps.setString(1, email);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            OrderPojo order = new OrderPojo();
	            order.setId(rs.getInt("id"));
	            order.setPname(rs.getString("name"));
	            order.setPrice(rs.getFloat("price"));
	            order.setAddress(rs.getString("address"));
	            order.setPid(rs.getString("pid"));
	            order.setEmail(rs.getString("email"));
	            order.setQuantity(rs.getInt("quantity"));
	            order.setTprice(rs.getFloat("tprice"));
	            order.setDate(rs.getString("date"));
	            orders.add(order);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return orders;
	}
	
	public int totalOrders() {
		int total=0;
		try {
			String q="select count(*) as total from orders";
			ps=con.prepareStatement(q);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				total=rs.getInt("total");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return total;
	}
	
	public int totalCakeSold() {
		int total=0;
		try {
			String q="select sum(quantity) as total from orders";
			ps=con.prepareStatement(q);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				total=rs.getInt("total");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return total;
	}
	
	public float totalRevenue() {
		float total=0;
		try {
			String q="select sum(tprice) as total from orders";
			ps=con.prepareStatement(q);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				total=rs.getInt("total");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return total;
	}
	
	
	
	
	

}
