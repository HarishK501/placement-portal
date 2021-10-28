<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null)
		response.sendRedirect("/ApmsWebApp/login");
%>



<% 
String user = (String) session.getAttribute("user");
if (user.equals("1")) { %>  
	<jsp:include page="stud/nav.jsp"></jsp:include>
<% } else if (session.getAttribute("user").equals("2")) { %>
	<jsp:include page="pco/nav.jsp"></jsp:include>
<% } %> 

	<div class="div-cards pad-h5 pad-v3">
	    <h2>Change Password</h2>
	    <div style="width:50%">
	     <form action="account?action=change_password" method="post">
             <br>
             <label for="oldpasswd">Old password</label>
             <input class="form-control" placeholder="Enter your old password" type="password" name="oldpasswd"
                 id="oldpasswd" required><br>

			 <label for="newpasswd">New password</label>
             <input id="newpasswd" class="form-control" type="password" name="newpasswd"
                 pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                 title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
                 placeholder="Enter your new password" required /> <br>
                 
             <label for="confirm-passwd">Confirm new password</label>
             <input class="form-control" type="password" name="confirm_passwd"
                 placeholder="Re-type the new passowrd" id="confirm-passwd" required />
             <br><br>
             <button style="width:30%" class="btn btn-success" type="submit"><i class="fas fa-edit"></i> Change</button>
         </form>
		</div>
	</div>
	<br>
	
	<script>
	    $(document).ready(() => {
	        document.body.style.backgroundImage = 'url("public/images/image4.png")';
	        document.body.style.backgroundSize = "cover";
	        document.body.style.backgroundAttachment = "fixed";
	        
	        var password = document.getElementById("newpasswd"),
	        confirm_password = document.getElementById("confirm-passwd");
		    function validatePassword() {
		        if (password.value != confirm_password.value) {
		            confirm_password.setCustomValidity("Passwords don't Match");
		        } else {
		            confirm_password.setCustomValidity("");
		        }
		    }
	
		    password.onchange = validatePassword;
		    confirm_password.onkeyup = validatePassword;
		    
		    });
	</script>
	
<jsp:include page="partials/footer.jsp"></jsp:include>
