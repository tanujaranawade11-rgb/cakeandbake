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

/**
 * Servlet implementation class deleteCart_servlet
 */
@WebServlet("/deleteCart_servlet")
public class deleteCart_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteCart_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid=Integer.parseInt(request.getParameter("cid"));
		CartDaoimpl cartDaoimpl=new CartDaoimpl();
		HttpSession session=request.getSession(); 
				
		if(cartDaoimpl.deleteCartById(cid)) {
			session.setAttribute("msg", "delete cart successfully!!");
			response.sendRedirect("cart.jsp");
		}
		else {
			session.setAttribute("msg", "delete not  cart successfully!!");
			response.sendRedirect("cart.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
