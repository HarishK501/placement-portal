<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<jsp:include page="partials/header.jsp">
	<jsp:param name="title" value="Login" />
</jsp:include>

<% 
	if (session.getAttribute("user") != null)
		response.sendRedirect("home");

%>

<div id="login-div" class="div-cards">
        <div class="row">
            <div class="col-lg-6" style="text-align: center; padding: 4% 3%;">
                <img id="login-img" src="https://joinsuperset.com/img/superset-lp-hero-illustration.svg" alt="icon">
            </div>

            <div id="login-form-div" class="col-lg-6" style="padding: 7%;"><br>
                <h1 class="logo">APMS</h1>
                <h4>Amrita Placement Management System</h4><br>
                <!-- <em>Placement management made easy</em> -->
                <form action="login" method="POST">
                    <div class="form-group">
                        <label for="reg_no">Username</label>
                        <input class="form-control" type="text" name="reg_no" id="reg_no"
                            placeholder="Enter your username" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input class="form-control" type="password" name="password" id="password"
                            placeholder="Enter your password" required>
                    </div>
                    
                    <div class="custom-control custom-checkbox">
                		<input type="checkbox" name="isPco" class="custom-control-input" id="customCheck1">
                		<label class="custom-control-label" for="customCheck1">Placement Coordinator</label>
            		</div>
                    <br>
                    
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
        });
    </script>
    
    <jsp:include page="partials/footer.jsp"></jsp:include>

