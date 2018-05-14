package com.nru.test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = "GET";
		myAction(request, response, method);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = "POST";
		myAction(request, response, method);
	}
	
	public void myAction(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("email") == null){
			System.out.println("-->"+method+": 1");
			if(request.getParameter("txt_email_id") == null){
				System.out.println("-->"+method+": 2");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else{
				System.out.println("-->"+method+": 3");
				String email = request.getParameter("txt_email_id").toString();
				String password = request.getParameter("txt_password").toString();
				System.out.println(email+" ---- "+password);
				session.setAttribute("email", email);
				session.setAttribute("password", password);
				request.getRequestDispatcher("main.jsp").forward(request, response);
			}
		}else{
			System.out.println("-->"+method+": 4");
			request.getRequestDispatcher("main.jsp").forward(request, response);
		}
	}
}
