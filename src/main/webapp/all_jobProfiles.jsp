<%@page import="java.util.ArrayList"%>
<%@page import="com.apms.obj.JobProfileObj"%>
<%! @SuppressWarnings("unchecked") %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
    
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

<div class="div-cards pad-v3" style="padding: 2% 7%">
		<h2>Job Profiles</h2><br />
		<table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th scope="col">Job Profile</th>
                    <th scope="col">Company</th>
                    <th class="job-location-td" scope="col">Location</th>
                    <th style="text-align: center;" scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
            <% 
			ArrayList<JobProfileObj> jobProfiles = (ArrayList<JobProfileObj>) request.getAttribute("jobProfiles");
            for (JobProfileObj a:jobProfiles){
            %>
            	<tr>
            		<th scope="row"><a href="jobProfile?t=<%=a.id %>"><%=a.title %></a></th>
            		<td><%=a.organizations %></td>
            		<td class="job-location-td"><%=a.location %></td>
            		<td style="text-align: center;">
            		<%
            		Date today = new Date();
            		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd"); 
            		Date endDate = ft.parse(a.end_date);
            		int x = endDate.compareTo(today);
            		
            		if (x == 0) {
            		%> <span class="status bg-warning">Closes today</span>
            		<% } else if (x > 0) {
            		%> <span class="status bg-primary">Open</span>
            		<% } else {	%>
            			<span class="status bg-dark">Closed</span>
            		<% } %>
            		</td>
            	</tr>
                
                <% } %>
            </tbody>
        </table>
</div>

<script>
	    $(document).ready(() => {
	        document.body.style.backgroundImage = 'url("public/images/image1.png")';
	        document.body.style.backgroundSize = "cover";
	        document.body.style.backgroundAttachment = "fixed";
	        $("th > a").css("color", "#000");
	    });
</script>

				

<jsp:include page="partials/footer.jsp"></jsp:include>