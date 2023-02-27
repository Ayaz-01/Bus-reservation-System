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

import com.masai.Dto.Users;

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
			    		int id = rs.getInt("id");
			    		String name = rs.getString("username");
			    		String email = rs.getString("email");
			    		boolean access = rs.getBoolean("Admin");
			    		System.out.println(access);
//			    		String mobNo = rs.getString("mobileno");
//			    		boolean admin = rs.getBoolean("admin");
//			    		Users user = new Users(id,name,email,pass,mobNo,admin);
			    		session.setAttribute("email", email);
			    		session.setAttribute("name", name);
			    		session.setAttribute("userId", id);
			    		if(access==true) {
			    			System.out.println("access granted");
			    			 dispatcher = request.getRequestDispatcher("Admin.jsp");
			    			 dispatcher.forward(request, response);
			    		}else {
			    			 dispatcher = request.getRequestDispatcher("index.jsp");
				    		 dispatcher.forward(request, response);
			    		}
			    	}else {
			    		 dispatcher = request.getRequestDispatcher("login.jsp");
			    		request.setAttribute("status", "incorrect");
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
	     else {
	    	 dispatcher = request.getRequestDispatcher("login.jsp");
	    	 request.setAttribute("status", "failed");
	    	 dispatcher.forward(request, response);
	     }
	}

}
