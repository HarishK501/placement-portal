<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<jsp:include page="partials/header.jsp">
	<jsp:param name="title" value="Login" />
</jsp:include>

<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") != null)
		response.sendRedirect("home");

%>

<div id="login-div" class="div-cards">
        <div class="row">
            <div class="col-lg-6" style="text-align: center; padding: 4% 3%;">
                <img id="login-img" src="https://joinsuperset.com/img/superset-lp-hero-illustration.svg" alt="icon">
            </div>

            <div id="login-form-div" class="col-lg-6" style="padding: 5%;"><br>
                <h1 class="logo">APMS</h1>
                <h4>Amrita Placement Management System</h4><br>
                <div class="custom-control custom-radio custom-control-inline">
                	<input type="radio" id="student-select" name="customRadioInline" class="custom-control-input"
                    checked>
                	<label class="custom-control-label" for="student-select">Student</label>
            	</div>
            	<div class="custom-control custom-radio custom-control-inline">
                	<input type="radio" id="pco-select" name="customRadioInline" class="custom-control-input">
                	<label class="custom-control-label" for="pco-select">Placement Coordinator</label>
            	</div>
            	<br><br>

                <form id="stud_form" action="login?p=1" method="POST">
                    <div id="stud_usrname" class="form-group">
                        <label for="reg_no">Username</label>
                        <input class="form-control" type="text" name="reg_no" id="reg_no"
                            placeholder="Enter your registration number" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input class="form-control" type="password" name="password" id="password"
                            placeholder="Enter your password" required>
                    </div>
                              
                    <button type="submit" class="btn btn-success">Sign In</button>
                    <a href="#" class="btn btn-outline-secondary">Forgot Password?</a>
                </form>
                
                <form id="pco_form" action="login?p=2" method="POST" style="display: none;">
                    <div id="pco_usrname" class="form-group">
                        <label for="email">Email Id</label>
                        <input class="form-control" type="email" name="email" id="email"
                            placeholder="Enter your email id" required>
                    </div>  
                    
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input class="form-control" type="password" name="password" id="password"
                            placeholder="Enter your password" required>
                    </div>                    
                    <button type="submit" class="btn btn-primary">Sign In</button>
                    <a href="#" class="btn btn-outline-secondary">Forgot Password?</a>
                </form>
                <br>
            </div>
        </div>
    </div>
    <br>


    <script>
        $(document).ready(() => {
            document.body.style.backgroundColor = "aliceblue";
            document.body.style.backgroundImage = "url(\"public/images/image1.png\")";
            document.body.style.backgroundSize = "cover";
            document.body.style.backgroundAttachment = "fixed";
            
            $("#student-select").click(() => {
                $("#pco_form").hide();
                document.body.style.backgroundColor = "aliceblue";
                $("#stud_form").fadeIn();
            });

            $("#pco-select").click(() => {
                $("#stud_form").hide();
                document.body.style.backgroundColor = "#bec5cf";
                $("#pco_form").fadeIn();
            });
        });
    </script>
    
    <jsp:include page="partials/footer.jsp"></jsp:include>

