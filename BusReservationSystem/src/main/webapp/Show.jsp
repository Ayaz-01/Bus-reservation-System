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

    <%
  if(session.getAttribute("name")==null){
	  response.sendRedirect("login.jsp");
	  
  }

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buss Reservation System</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
</head>
<body>

	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">Bus Reservation System</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
				<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="index.jsp">Back To Home</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">Bookings Record</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="Logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
<br/>
<br/>

<h2
	class="page-section-heading text-center text-uppercase text-secondary mb-0">Busses Booking Details</h2>
	<br/>
   <div>
			<table class="table">
			  <thead class="thead-dark">
			    <tr>
			      <th scope="col">BusId</th>
			      <th scope="col">source</th>
			      <th scope="col">destination</th>
			      <th scope="col">arrival</th>
			      <th scope="col">departure</th>
			      <th scope="col">duration</th>
			      <th scope="col">Seats</th>
			      <th scope="col">fare</th>
			      <th scope="col">Book Now</th>
			    </tr>
			  </thead>
		           <% 
				        
				        Connection conn1 = null;
     
                        try{
                        String id = (String)session.getAttribute("dest");
                        Class.forName("com.mysql.cj.jdbc.Driver");
				        conn1 = DriverManager.getConnection("jdbc:mysql://localhost/project101db","root","root");
				    	PreparedStatement ps1 = conn1.prepareStatement("select * from busses where destination=?");
				    	ps1.setString(1, id);
				    	ResultSet rs1 = ps1.executeQuery();
				    	int x =1;
				    	while(rs1.next()){
				    		System.out.println(x);
				    		x++;
				    		int bid =  rs1.getInt("bid");
				    		String source = rs1.getString("source");
				    		String destination = rs1.getString("destination");
				    		String arrival = rs1.getString("arrival");
				    		String departure = rs1.getString("departure");
				    		String duration = rs1.getString("duration");
				    		String seats = rs1.getString("seats");
				    		int fare = rs1.getInt("fare");
				    		%>
		                 <tbody>
				    		 <tr>
				    		 
						      <th scope="row"><%=bid%></th>
						      
						      <td><%=source%></td>
						     
						      <td><%=destination%></td>
						     
						      <td><%=arrival%></td>
						     
						      <td><%=departure%></td>
						    
						      <td><%=duration%></td>
						      
						      <td><%=seats%></td>
						     
						      <td><%=fare%></td>
						      <td><a href="BookTicket.jsp?bid=<%= rs1.getInt("bid") %>" >Book Ticket</a></td>
						    </tr>
				    	</tbody>
				    	<% 
				    	
				    	}
                        }catch(Exception e){
                        	e.printStackTrace();
                        }
				    	
				    	%>
			    </table>
	 </div>
	 </div>
	</section>
			    <!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
		<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>  
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    <script type="text/javascript">
    
   
	var status = document.getElementById("status7").value;
	if(status == "Success") {
		swal("Congrats","Buss Booked Succesfully","success");
	}
	</script>
</body>
</html>