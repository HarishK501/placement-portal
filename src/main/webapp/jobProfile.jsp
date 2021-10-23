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

	<style>
	    th {
	        width: 15%;
	    }
	    .pco-options {
	        margin: 3px 5px;
	    }
	</style>
	
	<div id="job-profile" class="div-cards pad-h5 pad-v3">
	    <h3>Engineer/Sr Engineer- Cloud Managed Services</h3>
	    <% if (session.getAttribute("user").equals("2")) { %>
	        <br>
	        <div>
	            <a href="jobProfile?t=edit" class="btn btn-dark pco-options" style="width: 150px"><i
	                    class="fas fa-edit" style="margin-right: 5px"></i> Edit</a>
	            <a href="#" class="btn btn-success pco-options" style="width: 200px"><i
	                    class="fas fa-table" style="margin-right: 5px"></i> View Applications</a>
	            <a href="#" class="btn btn-primary pco-options" style="width: 200px"><i
	                    class="fas fa-user-tie" style="margin-right: 5px"></i> Post Interview</a>
	            <a href="#" class="btn btn-danger pco-options" style="width: 150px"><i
	                    class="fas fa-trash-alt" style="margin-right: 5px"></i> Delete job</a>
	        </div>
	        <% } %>
	            <br />
	            <!-- TODO: get details from database --> 
	            <span class="status bg-primary">OPEN</span>
	            <em style="margin-left: 3%">Closes in 3 days</em>
	            <br /><br />
	            <table class="table">
	                <tbody>
	                    <tr>
	                        <th>Company</th>
	                        <td>Versa Networks</td>
	                    </tr>
	                    <tr>
	                        <th>Website</th>
	                        <td>
	                            <a target="blank" href="https://www.versa-networks.com/">Link</a>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>Location</th>
	                        <td>Bangalore, Chennai</td>
	                    </tr>
	                    <tr>
	                        <th>Summary</th>
	                        <td>
	                            The Cloud Managed Services engineer will be responsible for
	                            providing end to end management as well as technical support
	                            to debug diverse complex networking problems reported by
	                            customer on the Versa hosted platform/solution.
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>Educational Qualification</th>
	                        <td>
	                            The candidate must have a Bachelor's/Master's degree in IT/
	                            Computer Science or equivalent.
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>Professional Qualification</th>
	                        <td>
	                            Advanced Routing/switching skills /CCNP skills or equivalent
	                            level of experience. Versa certification will be highly
	                            preferred (SD-WAN Associate / SD-WAN Specialist)
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>Experience</th>
	                        <td>5+ years of hands-on experience.</td>
	                    </tr>
	                    <tr>
	                        <th>Roles and Responsibilities</th>
	                        <td>
	                            Monitor and take corrective actions for hosted environment.
	                            <br />Helps customer to solve reported product and network
	                            problems of varied complexity. <br />Replicate the customer
	                            issues in lab environment. <br />Work with engineering teams
	                            to replicate customer issues and test possible fixes.
	                            <br />Work on problems of diverse scope across all solutions
	                            from Versa <br />Incident/ticket lifecycle management
	                            <br />Setting up infrastructure. <br />Create knowledge
	                            articles. <br />Ability to write bash/python
	                            scripts(optional)
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>Essential Skills</th>
	                        <td>
	                            Experience in configuration and troubleshooting networks and
	                            security appliances. <br />Experience in Threat Analysis and
	                            Security Incident handling <br />Certifications like CEH ,
	                            GIAC (Global Information Assurance Certification) ,CCSP will
	                            be added advantage
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>Competancy</th>
	                        <td>
	                            Team player, can-do attitude and takes initiative.
	                            <br />Ability to work independently as well as in a team (in
	                            start-up environment). <br />Good communication skills to
	                            work with cross-functional groups. <br />Strong skills in
	                            large-scale software design and development. <br />Excellent
	                            verbal and written communication skills.
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	            <br /><br />
	
	            <div class="attached-docs-div">
	                <a class="btn btn-secondary attached-docs-download-button"
	                    href="/JD Managed Services - Versa Networks.docx">Download <i
	                        class="fas fa-download"></i></a>
	                <div class="content">
	                    <i class="far fa-file-alt fa-5x text-primary"></i><br /><br />
	                    <h6>JD Managed Services - Versa Networks.docx</h6>
	                </div>
	            </div>
	
	            <br /><br />
	            <% if (session.getAttribute("user").equals("1")) { %>
	                <a href="/application?jobid=(--job-id)" class="btn btn-primary" style="width: 150px"><i
	                        class="fas fa-plus" style="margin-right: 5px"></i> APPLY</a>
	                <% } %>
	</div>
	<br />
	
	<script>
	    $(document).ready(() => {
	        document.body.style.backgroundImage = 'url("public/images/image4.png")';
	        document.body.style.backgroundSize = "cover";
	        document.body.style.backgroundAttachment = "fixed";
	    });
	</script>

<jsp:include page="partials/footer.jsp"></jsp:include>
    