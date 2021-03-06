package com.nru.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class distance_daywise extends HttpServlet {
	
private static final long serialVersionUID = 1L;
    
    public distance_daywise() {super();}

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
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else{
			System.out.println("-->"+method+": 2");
			request.getRequestDispatcher("distance_daywise.jsp").forward(request, response);
		}
	}

}
