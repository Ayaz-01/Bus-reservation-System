package com.masai.registration;

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
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String uemail = request.getParameter("username");
	     String upass = request.getParameter("password");
	     
	     RequestDispatcher dispatcher = null;
	     HttpSession session = request.getSession();
	     
	     if(uemail!="" && upass!="") {
			     Connection conn = null;
			    try {
//			    	Class.forName("com.mysql.cj.jdbc.Driver");
			        conn = DbUtils.connectToDatabase();
			    	PreparedStatement ps = conn.prepareStatement("select * from users where email=? and password=?");
			    	ps.setString(1, uemail);
			    	ps.setString(2, upass);
			    	
			    	ResultSet rs = ps.executeQuery();
			    	dispatcher = request.getRequestDispatcher("login.jsp");
			    	if(rs.next()) {
			    		session.setAttribute("name", rs.getString("username"));
			    		 dispatcher = request.getRequestDispatcher("index.jsp");
			    	}else {
			    		request.setAttribute("status", "incorrect");
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
	    	 dispatcher = request.getRequestDispatcher("login.jsp");
	    	 request.setAttribute("status", "failed");
	    	 dispatcher.forward(request, response);
	     }
	}

}
