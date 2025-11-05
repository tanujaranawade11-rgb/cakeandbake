package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.helper.Connect;
import com.pojo.CartPojo;

public class CartDaoimpl {
Connection con=Connect.getConnect();
PreparedStatement ps;
public boolean addCart(CartPojo cartPojo) {
	try {
		String q="insert into cart(name,price,quantity,tprice,email,image,pid,oprice)values(?,?,?,?,?,?,?,?)";
		ps=con.prepareStatement(q);
		ps.setString(1,cartPojo.getName());
		ps.setFloat(2,cartPojo.getPrice());
		ps.setInt(3,cartPojo.getQuantity());
		ps.setFloat(4,cartPojo.getTprice());
		ps.setString(5,cartPojo.getEmail());
		ps.setString(6,cartPojo.getImage());
		ps.setInt(7,cartPojo.getPid());
		ps.setFloat(8,cartPojo.getOprice());
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

public List<CartPojo> getCartByEmail(String email){
	List<CartPojo> l=new ArrayList<CartPojo>();
	try {
		String q="select * from cart where email=?";
		ps=con.prepareStatement(q);
		ps.setString(1,email);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			CartPojo cartPojo=new CartPojo();
			cartPojo.setCid(rs.getInt("cid"));
			cartPojo.setName(rs.getString("name"));
			cartPojo.setPrice(rs.getFloat("price"));
			cartPojo.setQuantity(rs.getInt("quantity"));
			cartPojo.setTprice(rs.getFloat("tprice"));
			cartPojo.setImage(rs.getString("image"));
			l.add(cartPojo);
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return l;
}
public boolean deleteCartById(int id) {
	try {
		String q="delete from cart where cid=?";
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
public float getTotalCartPriceByEmail(String email) {
	float tprice=0;
	try {
		String q="select sum(tprice) as tprice from cart where email=?";
		ps=con.prepareStatement(q);
		ps.setString(1,email);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			tprice=rs.getFloat("tprice");
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return tprice;
}

public float getTotalOriginalCartPriceByEmail(String email) {
	float tprice=0;
	try {
		String q="select sum(oprice*quantity) as price from cart where email=?";
		ps=con.prepareStatement(q);
		ps.setString(1,email);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			tprice=rs.getFloat("price");
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return tprice;
}

public boolean increaseQuantity(int cid) {
	try {
		String q="update cart set quantity=quantity+1 where cid=?";
		ps=con.prepareStatement(q);
		ps.setInt(1, cid);
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

public boolean decreaseQuantity(int cid) {
	int quantity=getQuantityByCart(cid);
	if(quantity>1) {
	try {
		String q="update cart set quantity=quantity-1 where cid=?";
		ps=con.prepareStatement(q);
		ps.setInt(1, cid);
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
	}
	return false;
}

public int getQuantityByCart(int cid) {
	int quantity=0;
	try {
		String q="select quantity from cart where cid=?";
		ps=con.prepareStatement(q);
		ps.setInt(1,cid);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			quantity=rs.getInt("quantity");
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return quantity;
}

public int checkItemIsExistOrNot(int pid,String email) {
	int cid=0;
	try {
		String q="select cid from cart where pid=? and email=?";
		ps=con.prepareStatement(q);
		ps.setInt(1,pid);
		ps.setString(2,email);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			cid=rs.getInt("cid");
		}
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return cid;
}
}
