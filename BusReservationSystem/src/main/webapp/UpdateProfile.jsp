  <%@page import="java.sql.*"%>
     <%@page import="javax.servlet.RequestDispatcher"%>
 <%@page import="javax.servlet.ServletException"%>
 <%@page import="javax.servlet.annotation.WebServlet"%>
 <%@page import="javax.servlet.http.HttpServlet"%>
 <%@page import="javax.servlet.http.HttpServletRequest"%>
 <%@page import="javax.servlet.http.HttpServletResponse"%>
 <%@page import="javax.servlet.http.HttpSession"%>
 
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ak Bus Services</title>
<link rel="import" href="">

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<input type="hidden" id="status4" value="<%= request.getAttribute("status6") %>">

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					
					<div class="signup-form">
						<h2 class="form-title">Update</h2>
						
						<form method="post" action="update" class="register-form"
							id="register-form">
							<%
						Connection conn1 = null;
						try{
	                        Class.forName("com.mysql.cj.jdbc.Driver");
					        conn1 = DriverManager.getConnection("jdbc:mysql://localhost/project101db","root","root");
					    	PreparedStatement ps1 = conn1.prepareStatement("select * from users where id=?");
					    	int userId = (int)session.getAttribute("userId");
					        System.out.println(userId);
					    	ps1.setInt(1, userId);
					    	ResultSet rs1 = ps1.executeQuery();
					    	int x =1;
					    	while(rs1.next()){
					    		System.out.println(rs1.getString("email"));
					    		x++;
							%>
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" value="<%=rs1.getString("username") %>" placeholder="Your Name" />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" value="<%=rs1.getString("email") %>" placeholder="Your Email" />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" value="<%=rs1.getString("password") %>" id="pass" placeholder="Password" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password"  value="<%=rs1.getString("password") %>" name="re_pass" id="re_pass"
									placeholder="Repeat your password" />
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="contact" value="<%=rs1.getString("mobileno") %>" id="contact"
									placeholder="Contact no" />
							</div>
							
							   <%
							}
						}catch(Exception e){
							
						}
						
						%>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							
							<div class="form-group form-button">
								<input type="submit" name="Update" id="signup"
									class="form-submit" value="Update" />
							</div>
						</form>
						
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.jpg" alt="sing up image">
						</figure>
						<a href="index.jsp" class="signup-image-link">Back to HomePage</a>
					</div>
				</div>
			</div>
		</section>
	            

	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>  
	
	<script type="text/javascript">
	var status = document.getElementById("status4").value;
	if(status == "Success") {
		swal("Congrats","Account Updated Succesfully","success");
	}else if(status == "failed"){
		swal("Warning","Please Fill every input","warning");
	}
	</script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>