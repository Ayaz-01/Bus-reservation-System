<%@page import="java.sql.*"%>
<%@page import="com.masai.Dto.Users" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
try{
  if(session.getAttribute("userId") == null){
	  response.sendRedirect("login.jsp");
  }
}catch(Exception e){
	
}

%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Ak Bus Services</title>
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
<body id="page-top">
<input type="hidden" id="status2" value="<%= request.getAttribute("status2") %>">
<input type="hidden" id="status5" value="<%= request.getAttribute("status5") %>">
	<!-- Navigation-->
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
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">Bookings Record</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">About</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Contact</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="Logout">Logout</a></li>
					<li class="nav-item mx-0 mx-lg-1 bg-danger"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="UpdateProfile.jsp?id=<%=session.getAttribute("name")%>"><%=session.getAttribute("name")%></a></li>
					
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->
			<img class="masthead-avatar mb-5" src="assets/img/avataaars.svg"
				alt="..." />
			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">Welcome To AK Bus Services</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0">Experiance You Can Trust</p>
		</div>
	</header>
	<!-- Portfolio Section-->
	
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
			<!-- Portfolio Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">Your Booking Details</h2>
				<br/>
				<div id="">
				<table class="table">
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col">id</th>
				      <th scope="col">Destination</th>
				      <th scope="col">Departure</th>
				      <th scope="col">Duration</th>
				      <th scope="col">Arrival</th>
				      <th scope="col">Seat No</th>
				      <th scope="col">Cancel Ticket</th>
				    </tr>
				  </thead>
				 
				     <% 
				        Connection conn1 = null;
				        
                        try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
				        conn1 = DriverManager.getConnection("jdbc:mysql://localhost/project101db","root","root");
				    	PreparedStatement ps1 = conn1.prepareStatement("select * from bookingrec where uid=?");
				    	int userId = (int)session.getAttribute("userId");
				        System.out.println(userId);
				    	ps1.setInt(1, userId);
				    	ResultSet rs1 = ps1.executeQuery();
				    	int x =1;
				    	while(rs1.next()){
				    		System.out.println(x);
				    		x++;
				    		%>
		                 <tbody>
				    		 <tr>
						      <th scope="row"><%=rs1.getInt("id")%></th>
						      <td><%=rs1.getString("destination")%></td>
						      <td><%=rs1.getString("departure")%></td>
						      <td><%=rs1.getString("duration")%></td>
						      <td><%=rs1.getString("arrival")%></td>
						      <td><%=rs1.getString("seatno")%></td>
						      <td><a href="CancelTicket.jsp?id=<%=rs1.getInt("id")%>">Cancel Ticket</a></td>
						    </tr>
				    	</tbody>
				    	<% 
				    	
				    	}
                        }catch(Exception e){
                        	
                        }
				    	
				    	%>
				
				  
				</table>
				</div>
		</div>
		<br/>
		<br/>
		<h2
	class="page-section-heading text-center text-uppercase text-secondary mb-0">Search Busses</h2>
	<br/>
	<div class=" form-control-sm">
	<form method="post" action="search">
			  <div class="form-group">
			    <label for="formGroupExampleInput">Source</label>
			    <input type="text" class="form-control" id="formGroupExampleInput" name="source" placeholder="Enter Source eg:-kalyan">
			  </div>
			  <br/>
			  <div class="form-group">
			    <label for="formGroupExampleInput2">Destination</label>
			    <input type="text" class="form-control" id="formGroupExampleInput2" name="destination" placeholder="Enter Detination eg:-bangluru">
			  </div>
			  <br/>
			  <button type="submit" class="btn btn-primary">Search</button>
			</form>
	</div>
			<br/>
			
	</section>
	<!-- About Section-->
	<section class="page-section bg-primary text-white mb-0" id="about">
		<div class="container">
			<!-- About Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-white">About</h2>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- About Section Content-->
			<div>
				<div text-align="center">
					<p class="lead">The Bus Reservation System is designed to automate online ticket purchasing through an easy-to-use online bus booking system. Embed our online bus ticketing system into your website and enable your customers to book tickets for various routes and destinations. With the bus ticket reservation system, you can manage reservations, client data, and passenger lists. You can also schedule routes, set seat availability,etc.</p>
				</div>
			</div>
			<!-- About Section Button-->
		</div>
	</section>
	<!-- Contact Section-->
	<section class="page-section" id="contact">
		<div class="container">
			<!-- Contact Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">Contact
				Me</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Contact Section Form-->
			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">
					<!-- * * * * * * * * * * * * * * *-->
					<!-- * * SB Forms Contact Form * *-->
					<!-- * * * * * * * * * * * * * * *-->
					<!-- This form is pre-integrated with SB Forms.-->
					<!-- To make this form functional, sign up at-->
					<!-- https://startbootstrap.com/solution/contact-forms-->
					<!-- to get an API token!-->
					<form id="contactForm" data-sb-form-api-token="373988b0-75c2-4ff5-a899-318117135db7">
						<!-- Name input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="name" type="text"
								placeholder="Enter your name..." data-sb-validations="required" />
							<label for="name">Full name</label>
							<div class="invalid-feedback" data-sb-feedback="name:required">A
								name is required.</div>
						</div>
						<!-- Email address input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="email" type="email"
								placeholder="name@example.com"
								data-sb-validations="required,email" /> <label for="email">Email
								address</label>
							<div class="invalid-feedback" data-sb-feedback="email:required">An
								email is required.</div>
							<div class="invalid-feedback" data-sb-feedback="email:email">Email
								is not valid.</div>
						</div>
						<!-- Phone number input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="phone" type="tel"
								placeholder="(123) 456-7890" data-sb-validations="required" />
							<label for="phone">Phone number</label>
							<div class="invalid-feedback" data-sb-feedback="phone:required">A
								phone number is required.</div>
						</div>
						<!-- Message input-->
						<div class="form-floating mb-3">
							<textarea class="form-control" id="message" type="text"
								placeholder="Enter your message here..." style="height: 10rem"
								data-sb-validations="required"></textarea>
							<label for="message">Message</label>
							<div class="invalid-feedback" data-sb-feedback="message:required">A
								message is required.</div>
						</div>
						<!-- Submit success message-->
						<!---->
						<!-- This is what your users will see when the form-->
						<!-- has successfully submitted-->
						<div class="d-none" id="submitSuccessMessage">
							<div class="text-center mb-3">
								<div class="fw-bolder">Form submission successful!</div>
								To activate this form, sign up at <br /> <a
									href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
							</div>
						</div>
						<!-- Submit error message-->
						<!---->
						<!-- This is what your users will see when there is-->
						<!-- an error submitting the form-->
						<div class="d-none" id="submitErrorMessage">
							<div class="text-center text-danger mb-3">Error sending
								message!</div>
						</div>
						<!-- Submit Button-->
						<button class="btn btn-primary btn-xl disabled" id="submitButton"
							type="submit">Send</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="footer text-center">
		<div class="container">
			<div >
				<!-- Footer Social Icons-->
				<div text-align="center">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<a class="btn btn-outline-light btn-social mx-1" href="https://www.instagram.com/_ayaz_khan999/"><i
						class="fab fa-fw fa-instagram"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="https://twitter.com/AyazKhan1245"><i
						class="fab fa-fw fa-twitter"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="https://www.linkedin.com/in/ayaz-khan-875a48231/"><i
						class="fab fa-fw fa-linkedin-in"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="https://ayaz-portfolio-rho.vercel.app/"><i
						class="fab fa-fw fa-dribbble"></i></a>
				</div>
				<!-- Footer About Text-->
				
			</div>
		</div>
	</footer>
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; AYAZ KHAN Website 2023</small>
		</div>
	</div>
	

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>  
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    <script type="text/javascript">
    
    var status2 = document.getElementById("status5").value;
	var status = document.getElementById("status2").value;
	if(status == "Success") {
		swal("Congrats","Account Created Succesfully","success");
	}else if(status == "failed"){
		swal("Warning","Please Fill every input","warning");
	}else if(status == "incorrect"){
		swal("Sorry","Wrong Source or Destination","error");
	}
	else if(status2 == "correct"){
		swal("Congrats","Buss Canncelled Succesfully","success");
	}
	</script>
</body>
</html>
