<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@page import="java.sql.*"%>
     <%@page import="javax.servlet.RequestDispatcher"%>
 <%@page import="javax.servlet.ServletException"%>
 <%@page import="javax.servlet.annotation.WebServlet"%>
 <%@page import="javax.servlet.http.HttpServlet"%>
 <%@page import="javax.servlet.http.HttpServletRequest"%>
 <%@page import="javax.servlet.http.HttpServletResponse"%>
 <%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

RequestDispatcher dispatcher = null;



	     Connection conn = null;
	    try {
	    	int id2 = Integer.parseInt(request.getParameter("id"));
         	 Class.forName("com.mysql.cj.jdbc.Driver");
		    conn = DriverManager.getConnection("jdbc:mysql://localhost/project101db","root","root");
	    	PreparedStatement ps = conn.prepareStatement("DELETE FROM bookingrec WHERE id=?");
	    	ps.setInt(1, id2);
	    	
	    	
	    	int out1 = ps.executeUpdate();
	    	dispatcher = request.getRequestDispatcher("index.jsp");
	    	if(out1>0) {
	    		request.setAttribute("status5", "correct");
	    			 dispatcher = request.getRequestDispatcher("index.jsp");
		    		 dispatcher.forward(request, response);
	    	}
	    	
	     }catch(Exception ex) {
	    	
	    }try{
	    	dispatcher = request.getRequestDispatcher("index.jsp");
	    	dispatcher.forward(request, response);
	    }catch(Exception e){
	    	
	    }
	    
		
%>
</body>
</html>