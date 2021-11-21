<%@page import="com.apms.obj.JobProfileObj"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="com.apms.obj.AppliedObj"%>
<%@page import="com.apms.obj.ActivityObj"%>
<%! @SuppressWarnings("unchecked") %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null)
		response.sendRedirect("/ApmsWebApp/login");
%>

<!-- student home page-->  
<jsp:include page="nav.jsp"></jsp:include>

<style>
.announcement-title { 
    display: block;
}

.announcement-content { 
	color: grey;
}

</style>

	<div id="job-profiles-div" class="div-cards pad-h5 pad-v3">
        <h2 style="display: inline-block;">Job Profiles</h2>
        <a href="/ApmsWebApp/jobProfile?t=view_all" id="job-profiles-external-link" class="external-link"><i
                class="fas fa-external-link-alt"></i></a><br><br>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th scope="col">Job Profile</th>
                    <th scope="col">Company</th>
                    <th class="job-location-td" scope="col">Status</th>
                    <th style="text-align: center;" scope="col">Applied_on</th>
                </tr>
            </thead>
            <tbody>
            <% 
			ArrayList<AppliedObj> Appliedjob = (ArrayList<AppliedObj>) request.getAttribute("appliedJobs");
            for (AppliedObj a:Appliedjob){
            %>
            	<tr>
            		<th scope="row"><a href="jobProfile?t=<%=a.job_id %>"><%=a.job_title %></a></th>
            		<td><%=a.company_name %></td>
            		<td class="job-location-td"><%=a.app_status %></td>
            		<td style="text-align: center;" class="job-location-td"><%=a.applied_on %></td>
            	</tr>
                
                <% } %>
            </tbody>
        </table>
    </div>

    
    <br><br>

    <script>
        $(document).ready(() => {
            document.body.style.backgroundImage = "url(\"./public/images/image2.png\")";
            document.body.style.backgroundSize = "cover";
            document.body.style.backgroundAttachment = "fixed";
            $("th > a").css("color", "#000");
        });
    </script>

<jsp:include page="../partials/footer.jsp"></jsp:include>

