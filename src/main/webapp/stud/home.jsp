<%@page import="com.apms.obj.JobProfileObj"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="com.apms.obj.AnnouncementObj"%>
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

    <div class="row" style="margin: 0 2%;">
        <div class="col-lg-7" style="padding: 5px;">
            <div id="notifications-div" class="div-cards pad-h5 pad-v3">
                <h3 style="display: inline-block;">Announcements</h3>
                <a href="/ApmsWebApp/announcement?t=view_all" id="announcements-external-link" class="external-link"><i
                        class="fas fa-external-link-alt"></i></a>
                <br><br>
                <table class="table table-hover">
                    <tbody>
                    <% 
					ArrayList<AnnouncementObj> announcements = (ArrayList<AnnouncementObj>) request.getAttribute("announcements");
                    for (AnnouncementObj a:announcements){
					%>
                        <tr>
                            <td>
                                <a style="color: black;text-decoration: none;" href="announcement?t=view&id=<%=a.id %>">
                                    <span style="display: block;">
                                        <h5><%=a.title %></h5>
                                        <span style="color: grey"><%=a.content %></span>
                                    </span>
                                </a>
                            </td>
                            <td style="color: rgb(158, 155, 155);"><%=a.datetime %></td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>

            </div>
        </div>
        <div class="col-lg-5" style="padding: 5px;">
            <div id="activities-div" class="div-cards pad-h5 pad-v3">
                <h3 style="display: inline-block;">My Activities</h3>
                <a href="/ApmsWebApp/account?action=view_activities" id="activities-external-link" class="external-link"><i
                        class="fas fa-external-link-alt"></i></a>
                <br><br>
                <table class="table">
                    <tbody>
                    <% 
					ArrayList<ActivityObj> activities = (ArrayList<ActivityObj>) request.getAttribute("activities");
                    if (activities.isEmpty()) {
                    %>
                    <tr>
                   		<td colspan="2" style="text-align: center;"><em>-- No activities yet --</em></td>
                    </tr>
                    <%
                    } else {
                    for (ActivityObj a:activities){
					%>
                        <tr>
                            <td><%=a.activity %></td>
                            <td><%=a.datetime %></td>
                        </tr>
                    <% }} %>
                    </tbody>
                </table>
            </div>
        </div>
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

