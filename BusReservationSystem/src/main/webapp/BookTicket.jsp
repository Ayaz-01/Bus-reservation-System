<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@page import="java.sql.*"%>
     <%@page import="javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<title></title>
</head>
<body>
     <%
     RequestDispatcher dispatcher = null;
     int bid = Integer.parseInt(request.getParameter("bid"));
     System.out.println(bid+" inside bookingTic ");
     Connection conn = null;
		String source = null;
		String destination = null;
		String arrival = null;
		String departure = null;
		int uid = 0;
		try{
			 uid =	(int)session.getAttribute("userId");
		}catch(Exception e){
			
		}
		String duration = null;
		String seatno = null;
		int fare = 0;
		String pname = (String)session.getAttribute("name");
	    try {
	    	
  	Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost/project101db","root","root");
	    	PreparedStatement ps1 = conn.prepareStatement("select * from Busses where bid=?");
	    	ps1.setInt(1, bid);
	    	ResultSet rs1 = ps1.executeQuery();
	    	while(rs1.next()){
	    		source = rs1.getString("source");
	    		destination =  rs1.getString("destination");
	    		arrival =  rs1.getString("arrival");
	    		departure =  rs1.getString("departure");
	    		bid =  rs1.getInt("bid");
	    		String s =  rs1.getString("seats");
	    		String[] arr = s.split(",");
	    		seatno = arr[2];
	    		fare =  rs1.getInt("fare");
	    		duration = rs1.getString("duration");
	    	}
	    	
	     }catch(Exception ex) {
	    	
	    }
			     Connection conn1 = null;
			    try {
			    
 		    	Class.forName("com.mysql.cj.jdbc.Driver");
		       conn1 = DriverManager.getConnection("jdbc:mysql://localhost/project101db","root","root");
			    	PreparedStatement ps = conn.prepareStatement("insert into bookingrec(source,destination,arrival,departure,duration,seatno,fare,pname,bid,uid) values(?,?,?,?,?,?,?,?,?,?)");
			    	ps.setString(1, source);
			    	ps.setString(2, destination);
			    	ps.setString(3, arrival);
			    	ps.setString(4, departure);
			    	ps.setString(5, duration);
			    	ps.setString(6, seatno);
			    	ps.setInt(7, fare);
			    	ps.setString(8, pname);
			    	ps.setInt(9, bid);
			    	ps.setInt(10, uid);
			    	int out2 = ps.executeUpdate();
			    	//dispatcher = request.getRequestDispatcher("Show.jsp");
			    	if(out2>0) {
			    		     request.setAttribute("status9","Success");
			    			 dispatcher = request.getRequestDispatcher("Show.jsp");
				    		 dispatcher.forward(request, response);
			    	}else{
			    		request.setAttribute("status9","incorrect");
				    	dispatcher = request.getRequestDispatcher("Show.jsp");
				    	dispatcher.forward(request, response);
			    	}
			    	ps.close();
			     }catch(Exception ex) {
			    	
			    }
			    try{
			    	dispatcher = request.getRequestDispatcher("Show.jsp");
			    	dispatcher.forward(request, response);
			    }catch(Exception e){
			    	
			    }
			    finally{
			    	conn1.close();
			    	conn.close();
			    }
     %>

</body>
</html>