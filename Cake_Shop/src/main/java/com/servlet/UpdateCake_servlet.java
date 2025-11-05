package com.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.daoimpl.CakeDaoimpl;
import com.pojo.CakePojo;

/**
 * Servlet implementation class UpdateCake_servlet
 */
@WebServlet("/UpdateCake_servlet")
@MultipartConfig
public class UpdateCake_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCake_servlet() {
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
		String price1=request.getParameter("price");
		System.out.println(price1);
		
		int price=Integer.parseInt(request.getParameter("price"));
		int discount=Integer.parseInt(request.getParameter("discount"));
		int fprice=Integer.parseInt(request.getParameter("fprice"));
		String category=request.getParameter("category");
		String description=request.getParameter("description");
		Part image=request.getPart("image");
		
		int cid=Integer.parseInt(request.getParameter("cid"));
		
		String path=request.getRealPath("images")+File.separator+"cake"+File.separator+image.getSubmittedFileName();
		System.out.println(path);
		FileOutputStream fos=new FileOutputStream(path);
		InputStream i=image.getInputStream();
		byte[] b=new byte[i.available()];
		i.read(b);
		fos.write(b);
		fos.close();
		
		CakePojo cakePojo=new CakePojo(name, price, discount, fprice, category, image.getSubmittedFileName(),description);
		CakeDaoimpl cakeDaoimpl=new CakeDaoimpl();
		HttpSession session=request.getSession();
		if(cakeDaoimpl.UpdateCakeByID(cakePojo, cid)) {
			session.setAttribute("msg","Cake updated successfully!!");
			response.sendRedirect("admin.jsp");
		}
		else {
			session.setAttribute("msg","Cake not updated successfully!!");
			response.sendRedirect("admin.jsp");

		}
	}

}
