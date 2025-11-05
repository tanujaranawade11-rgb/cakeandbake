package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daoimpl.CartDaoimpl;
import com.daoimpl.OrdersDaoimpl;
import com.daoimpl.ProfileImpl;
import com.pojo.CartPojo;
import com.pojo.OrderPojo;
import com.pojo.Profilepojo;

/**
 * Servlet implementation class PlaceOrderServlet
 */
@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pid=request.getParameter("payment_id");
		CartDaoimpl cartDaoimpl=new CartDaoimpl();
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		List<CartPojo> lc=cartDaoimpl.getCartByEmail(email);
		ProfileImpl profileImpl=new ProfileImpl();
		Profilepojo profilepojo=profileImpl.getProfileByEmail(email);
		String address=profilepojo.getState()+","+profilepojo.getCity()+","+profilepojo.getStreet()+","+profilepojo.getPincode()+". Landmark:- "+profilepojo.getLandmark();
		OrdersDaoimpl ordersDaoimpl=new OrdersDaoimpl();
		for(CartPojo c:lc) {
			
			OrderPojo orderPojo=new OrderPojo();
			orderPojo.setPname(c.getName());
			orderPojo.setPrice(c.getPrice());
			orderPojo.setQuantity(c.getQuantity());
			orderPojo.setEmail(email);
			orderPojo.setPid(pid);
			orderPojo.setAddress(address);
			orderPojo.setTprice(c.getPrice()*c.getQuantity());
			
			ordersDaoimpl.addOrders(orderPojo);
		}
		response.sendRedirect("confirm.jsp");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
