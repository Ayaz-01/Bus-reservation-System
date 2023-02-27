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

import com.masai.Dto.Buss;

/**
 * Servlet implementation class Search
 */
@WebServlet("/search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String source = request.getParameter("source");
	     String destination = request.getParameter("destination");
	     System.out.println(source+" "+destination);
	     RequestDispatcher dispatcher = null;
	     HttpSession session = request.getSession();
	     
	     if(source!="" && destination!="") {
			     Connection conn = null;
			    try {
//			    	Class.forName("com.mysql.cj.jdbc.Driver");
			        conn = DbUtils.connectToDatabase();
			    	PreparedStatement ps = conn.prepareStatement("select * from busses where source=? and destination=?");
			    	ps.setString(1, source);
			    	ps.setString(2, destination);
			    	
			    	ResultSet rs = ps.executeQuery();
			    	dispatcher = request.getRequestDispatcher("index.jsp");
			    	if(rs.next()) {
			    		String dest = rs.getString("destination");
			    		 session.setAttribute("dest", dest);
			    		 request.setAttribute("status2", "Success");
			    		 dispatcher = request.getRequestDispatcher("Show.jsp");
			    	}else {
			    		request.setAttribute("status2", "incorrect");
			    	}
			    	dispatcher.forward(request, response);
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
	     else {
	    	 dispatcher = request.getRequestDispatcher("index.jsp");
	    	 request.setAttribute("status2", "failed");
	    	 dispatcher.forward(request, response);
	     }
	}

}
