package com.masai.Dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Submit
 */
@WebServlet("/submit")
public class Submit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 RequestDispatcher dispatcher = null;
	     HttpSession session = request.getSession();
	    try {
		int bussid = Integer.parseInt(request.getParameter("BusId"));
	     String source = request.getParameter("source");
	     String arrival = request.getParameter("arrival");
	     String departure = request.getParameter("departure");
	     String destination = request.getParameter("Destination");
	     String seats = request.getParameter("Seats");
	     int fare = Integer.parseInt(request.getParameter("fare"));
	     String seatsbooked = "";
	     if(request.getParameter("SeatsBooked")!=null) {
	      seatsbooked = request.getParameter("SeatsBooked");
	     }
	    
	     String duration = request.getParameter("duration");
	    
	     
	     if( source!="" && arrival!="" && departure!="" && destination!="" && seats!="" && seatsbooked!="" && duration!="" ) {
			     Connection conn = null;
			    try {
//			    	Class.forName("com.mysql.cj.jdbc.Driver");
			        conn = DbUtils.connectToDatabase();
			    	PreparedStatement ps = conn.prepareStatement("insert into busses values(?,?,?,?,?,?,?,?,?)");
			    	ps.setInt(1, bussid);
			    	ps.setString(2, source);
			    	ps.setString(3, destination);
			    	ps.setString(4, arrival);
			    	ps.setString(5, departure);
			    	ps.setString(6, duration);
			    	ps.setString(7, seats);
			    	ps.setString(8, seatsbooked);
			    	ps.setInt(9, fare);
			    	
			    	
			    	int out = ps.executeUpdate();
			    	dispatcher = request.getRequestDispatcher("Admin.jsp");
			    	if(out>0) {
			    		request.setAttribute("status10", "correct");
			    		 dispatcher = request.getRequestDispatcher("Admin.jsp");
			    		 dispatcher.forward(request, response);
			    		 
			    	}else {
			    		request.setAttribute("status10", "incorrect");
			    		 dispatcher = request.getRequestDispatcher("Admin.jsp");
			    	
			    		dispatcher.forward(request, response);
			    	}
			    	
			    }catch(Exception ex) {
			    	ex.printStackTrace();
			    }finally {
			    	try {
						DbUtils.closeConnection(conn);
					} catch (SQLException e) {
						e.printStackTrace();
					}
			    }
	     }
	    }catch(Exception e) {
	    	
	    }
	 request.setAttribute("status10", "failed");
   	 dispatcher = request.getRequestDispatcher("Admin.jsp");
   	 dispatcher.forward(request, response);
	}

}
