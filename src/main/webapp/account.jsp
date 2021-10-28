<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null)
		response.sendRedirect("/ApmsWebApp/login");
%>

<!-- student account page-->

<% if (session.getAttribute("user").equals("1")) { %>  
	<jsp:include page="stud/nav.jsp"></jsp:include>
<% } else if (session.getAttribute("user").equals("2")) { %>
	<jsp:include page="pco/nav.jsp"></jsp:include>
<% } %> 

	<style>
        .accounts_1 {
            padding: 20px;
        }

        img {
            position: relative;
            left: 50px;
            height: 200px;
            width: 200px;
            margin:20px;
        }

        #accounts_name {
            position: relative;
            left: 150px;
        }

        #accounts_student {
            position: relative;
            left: 150px;
            padding: 5px;
        }

        .accounts_icon {
            padding: 5px;
        }

        .container {
            border: 2px solid black;
        }

        #accounts_col1 {
            background-color: #B0E0E6;
        }
    </style>

    <div class="div-cards accounts_1" id="accounts_div">
        <h3 id="accounts_divh3">My Account</h3><br>
        <div class="row" id="accounts_row1">
            <div class="col col-lg-3" id="accounts_col1">
                <img src="public/images/photo1.png" class="img-rounded" id="accounts_col1img">
                <p class="lead" id="accounts_name">Name</p>
                <!-- <span class="border border-dark" id="accounts_student">Student</span> -->
                <hr style="width:100%;text-align:left;margin-left:0">
                <i class="fa fa-phone accounts_icon" style="font-size:20px" id="accounts_contact">
                </i>&nbsp;&nbsp;&nbsp;&nbsp;Contact Details
                <br>
                <i class="fa fa-lock accounts_icon" style="font-size:20px"
                    id="accounts_col1lock"></i>&nbsp;&nbsp;&nbsp;&nbsp;Password
                <br>
                <!--<i class="fa fa-lock accounts_icon" style="font-size:20px">&nbsp;&nbsp;&nbsp;&nbsp;Connected Accounts</i>
                    <hr style="width:100%;text-align:left;margin-left:0">-->
            </div>
            <div class="col col-lg-9" id="accounts_col2">
                <p class="lead" id="accounts_contact"><strong>Contact Details</strong></p>
                <hr style="width:100%;text-align:left;margin-left:0">
                <div class="row" id="accounts_row2">
                    <div class="col col-lg-4" id="accounts_col2div">
                        <p class="lead" id="accounts_contact">Mobile Number</p>
                    </div>
                    <div class="col col-lg-8" id="accounts_col3div">
                        <p class="lead" id="accounts_contact">9234567892</p>
                    </div>
                </div>
                <hr style="width:100%;text-align:left;margin-left:0">
                <div class="row" id="accounts_row3">
                    <div class="col col-lg-4" id="accounts_col4div">
                        <p class="lead" id="accounts_contact">Email</p>
                    </div>
                    <div class="col col-lg-8" id="accounts_col5div">
                        <p class="lead" id="accounts_contact">asdk@gmail.com</p>
                    </div>
                </div>
                <hr style="width:100%;text-align:left;margin-left:0">
                <br>
                <br>
                <br>
                <p class="lead" id="accounts_contact"><strong>Password</strong></p>
                <hr style="width:100%;text-align:left;margin-left:0">
                <div class="row" id="accounts_row4">
                    <div class="col col-lg-4" id="accounts_col6div">
                        <p class="lead" id="accounts_contact">Password</p>
                    </div>
                    <div class="col col-lg-4" id="accounts_col7div">
                        <p class="lead" id="accounts_contact">**********</p>
                    </div>
                    <div class="col col-lg-4" id="accounts_col8div">
                        <a href="account?action=change_password">Change Password</a>

                    </div>
                </div>
                <hr style="width:100%;text-align:left;margin-left:0">
                <br>
            </div>
        </div>
    </div>
    <br>
    <script>
        $(document).ready(() => {
            document.body.style.backgroundImage = 'url("public/images/image1.png")';
            document.body.style.backgroundSize = "cover";
            document.body.style.backgroundAttachment = "fixed";
        });
    </script>
    
<jsp:include page="partials/footer.jsp"></jsp:include>
