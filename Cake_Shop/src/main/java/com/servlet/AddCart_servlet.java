package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daoimpl.CakeDaoimpl;
import com.daoimpl.CartDaoimpl;
import com.pojo.CakePojo;
import com.pojo.CartPojo;

/**
 * Servlet implementation class AddCart_servlet
 */
@WebServlet("/AddCart_servlet")
public class AddCart_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCart_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid=Integer.parseInt(request.getParameter("pid"));
		CakeDaoimpl cakeDaoimpl=new CakeDaoimpl();
		CakePojo cakePojo=cakeDaoimpl.getCakeById(pid);
		CartDaoimpl cartDaoimpl=new CartDaoimpl();
		HttpSession session=request.getSession();
		String email=(String) session.getAttribute("email");
		CartPojo cartPojo=new CartPojo(cakePojo.getName(),cakePojo.getFprice(),1,cakePojo.getFprice(),email,cakePojo.getImage());
		cartPojo.setPid(pid);
		cartPojo.setOprice(cakePojo.getPrice());
		int cid=cartDaoimpl.checkItemIsExistOrNot(pid, email);
		if(cartDaoimpl.checkItemIsExistOrNot(pid, email)>0) {
			
			if(cartDaoimpl.increaseQuantity(cid)) {
				session.setAttribute("msg", "quantity increased!");
				response.sendRedirect("cart.jsp");
			}
			else {
				session.setAttribute("msg", "something went wrong!");
				response.sendRedirect("home.jsp");
			}
		}
		else {
		if(cartDaoimpl.addCart(cartPojo)) {
			session.setAttribute("msg", "add to cart successfully!");
			response.sendRedirect("cart.jsp");
		}
		else {
			session.setAttribute("msg", "add to cart unsuccessfully!");
			response.sendRedirect("cart.jsp");
		}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
