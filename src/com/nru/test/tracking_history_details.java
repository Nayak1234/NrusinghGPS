package com.nru.test;

import java.io.IOException;
import java.sql.Connection;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class tracking_history_details extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public tracking_history_details() {super();}
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = "GET";
		myAction(request, response, method);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = "POST";
		myAction(request, response, method);
	}
	public void myAction(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
		System.out.println("-- tracking_history_details is invoked --");
		Utilities util	= new Utilities();
		Connection con 	= util.getConnection();
		String deviceid = request.getParameter("id").toString().trim();
		String uniqueId = request.getParameter("uniqueId").toString().trim();
		String name 	= request.getParameter("name").toString().trim();
		String status 	= request.getParameter("status").toString().trim();
		
		String query = " "
				+ " SELECT id,deviceid,latitude,longitude,speed,address,servertime FROM positions "
				+ " WHERE deviceid = '1' "
				+ " AND servertime >= '2018-05-09 00:01:01' "
				+ " AND servertime <= '2018-05-09 23:59:59' "; 
		Vector values = util.selectQuery(query, 6, con);
		System.out.println("@@@values: "+values);
		
	}
}
