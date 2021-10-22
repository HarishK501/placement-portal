<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null)
		response.sendRedirect("/ApmsWebApp/login");
%>



<% if (session.getAttribute("user").equals("1")) { %>  
	<jsp:include page="stud/nav.jsp"></jsp:include>
<% } else if (session.getAttribute("user").equals("2")) { %>
	<jsp:include page="pco/nav.jsp"></jsp:include>
<% } %> 

	<div class="div-cards pad-h5 pad-v3">
	    <h3>HCL Technologies Invites 2022 B.E/B. Tech Graduates</h3>
	    <br>
	    <div>
	        Dear Students,<br>
	        Please find attached the JD from HCL Technologies for BTech 2022 batch.<br>
	        Eligibility: B.Tech. CSE, ECE, EEE, EIE, Mechanical<br>
	        Only with 75% throughout in academics(10th, 12th / Diploma & UG)<br>
	        Compensation: 4.75 LPA<br><br>
	        Note :<br>
	        1. Probation period for selected SE/GET will be of 12 Months.<br>
	        2. Also will have a service agreement of 24 Months, if the student leaves before this
	        duration
	        he/she is required to
	        pay 1.25 lacs INR.<br><br>
	        <strong><em>Students who are eligible & interested should register on or before 25th August
	                2021, 5 pm</em></strong>
	        <br><br><br>
	        Regards,<br>
	        XYZ<br>
	        Joint Director, Placement<br>
	        Amrita Vishwa Vidyapeetham<br>
	    </div>
	    <br><br>
	
	    <div class="attached-docs-div">
	        <a class="btn btn-secondary attached-docs-download-button"
	            href="/JD Managed Services - Versa Networks.docx">Download <i
	                class="fas fa-download"></i></a>
	        <div class="content">
	            <i class="far fa-file-alt fa-5x text-primary"></i><br /><br />
	            <h6>JD - HCL Technologies.docx</h6>
	        </div>
	    </div><br>
	</div>
	<br>
	
	<script>
	    $(document).ready(() => {
	        document.body.style.backgroundImage = 'url("public/images/image4.png")';
	        document.body.style.backgroundSize = "cover";
	        document.body.style.backgroundAttachment = "fixed";
	    });
	</script>
	
<jsp:include page="partials/footer.jsp"></jsp:include>
