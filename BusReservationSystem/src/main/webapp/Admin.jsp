 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    /*
    For Authenticating if Admin logged in or not if not then
    redirect it back to login page
    */
  if(session.getAttribute("name")==null){
	  response.sendRedirect("login.jsp");
	  
  }

%>
    <%@page import="java.sql.*"%>
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
<input type="hidden" id="status6" value="<%= request.getAttribute("status10") %>">
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
	class="page-section-heading text-center text-uppercase text-secondary mb-0">Busses Available Details</h2>
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
			      <th scope="col">SeatsBooked</th>
			      <th scope="col">Delete Busses</th>
			    </tr>
			  </thead>
		           <% 
				        Connection conn1 = null;
                      
                        try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
				        conn1 = DriverManager.getConnection("jdbc:mysql://localhost/project101db","root","root");
				    	PreparedStatement ps1 = conn1.prepareStatement("select * from busses");
				    	ResultSet rs1 = ps1.executeQuery();
				    	int x =1;
				    	while(rs1.next()){
				    		System.out.println(x);
				    		x++;
				    		%>
		                 <tbody>
				    		 <tr>
						      <th scope="row"><%=rs1.getInt("bid")%></th>
						      <td><%=rs1.getString("source")%></td>
						      <td><%=rs1.getString("destination")%></td>
						      <td><%=rs1.getString("arrival")%></td>
						      <td><%=rs1.getString("departure")%></td>
						      <td><%=rs1.getString("duration")%></td>
						      <td><%=rs1.getString("seats")%></td>
						      <td><%=rs1.getString("fare")%></td>
						      <td><%=rs1.getString("SeatsBooked")%></td>
						      <td><a href="DeleteBusses.jsp?bid=<%=rs1.getInt("bid")%>">Delete Buss</a></td>
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
			<br/>
		<br/>
		<h2
	class="page-section-heading text-center text-uppercase text-secondary mb-0">Add Busses</h2>
	<br/>
	<div class=" form-control-sm">
	<form method="post" action="submit">
			  <div class="form-group">
			    <label for="formGroupExampleInput">BusId</label>
			    <input type="text" class="form-control" id="formGroupExampleInput" name="BusId" placeholder="Enter BusId eg:-709">
			  </div>
			  <br/>
			  <div class="form-group">
			    <label for="formGroupExampleInput2">source</label>
			    <input type="text" class="form-control" id="formGroupExampleInput2" name="source" placeholder="Enter source eg:-kalyan">
			  </div>
			  <br/>
			   <div class="form-group">
			    <label for="formGroupExampleInput2">Destination</label>
			    <input type="text" class="form-control" id="formGroupExampleInput2" name="Destination" placeholder="Enter Destination eg:-bangluru">
			  </div>
			   <br/>
			    <div class="form-group">
			    <label for="formGroupExampleInput2">arrival</label>
			    <input type="text" class="form-control" id="formGroupExampleInput2" name="arrival" placeholder="Enter arrival eg:-12:00pm  03/03/23">
			  </div>
			   <br/>
			    <div class="form-group">
			    <label for="formGroupExampleInput2">duration</label>
			    <input type="text" class="form-control" id="formGroupExampleInput2" name="duration" placeholder="Enter duration eg:-12h">
			  </div>
			   <br/>
			    <div class="form-group">
			    <label for="formGroupExampleInput2">departure</label>
			    <input type="text" class="form-control" id="formGroupExampleInput2" name="departure" placeholder="Enter departure eg:-12:00pm  03/03/23">
			  </div>
			   <br/>
			   
			    <div class="form-group">
			    <label for="formGroupExampleInput2">Seats</label>
			    <input type="text" class="form-control" id="formGroupExampleInput2" name="Seats" placeholder="Enter Seats eg:d1,d2,d3">
			  </div>
			   <br/>
			    <div class="form-group">
			    <label for="formGroupExampleInput2">fare</label>
			    <input type="text" class="form-control" id="formGroupExampleInput2" name="fare" placeholder="Enter fare eg:-100rs">
			  </div>
			   <br/>
			   </div>
			    <div class="form-group">
			    <label for="formGroupExampleInput2">SeatsBooked</label>
			    <input type="text" class="form-control" id="formGroupExampleInput2" name="SeatsBooked" placeholder="">
			  </div>
			  <br/>
			  <button  type="submit" class="btn btn-primary">Submit</button>
			</form>
	</div>
			<br/>
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
	var status = document.getElementById("status6").value;
	if(status == "correct") {
		swal("Congrats","Buses Created Succesfully","success");
	}else if(status == "incorrect"){
		swal("Warning","Bus ID Already Exist","warning");
	}else if(status == "failed"){
		swal("Warning","Please Fill every input","warning");
	}
	</script>
</body>
</html>