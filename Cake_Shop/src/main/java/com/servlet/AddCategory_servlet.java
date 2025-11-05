package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daoimpl.CategoryDaoimpl;

/**
 * Servlet implementation class AddCategory_servlet
 */
@WebServlet("/AddCategory_servlet")
public class AddCategory_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategory_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("name");
		String desc=request.getParameter("desc");
		CategoryDaoimpl categoryDaoimpl=new CategoryDaoimpl();
		HttpSession session=request.getSession();
		if(categoryDaoimpl.addCategory(name, desc)) {
			session.setAttribute("msg", "category added successfully!!");
			response.sendRedirect("admin.jsp");
		}
		else {
			session.setAttribute("msg", "category not added successfully!!");
			response.sendRedirect("admin.jsp");
		}
	}

}
