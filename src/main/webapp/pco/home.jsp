<%@page import="java.util.ArrayList"%>
<%@page import="com.apms.obj.AnnouncementObj"%>
<%! @SuppressWarnings("unchecked") %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- pco home page-->  

<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null)
		response.sendRedirect("/ApmsWebApp/login");
%>

<jsp:include page="nav.jsp"></jsp:include>

<div id="job-profiles-div" class="div-cards pad-h5 pad-v3">
        <h2 style="display: inline-block;">Job Profiles</h2>
        <a href="#" id="job-profiles-external-link" class="external-link"><i
                class="fas fa-external-link-alt"></i></a><br><br>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th scope="col">Job Profile</th>
                    <th scope="col">Company</th>
                    <th class="job-location-td" scope="col">Location</th>
                    <th style="text-align: center;" scope="col">No. of applicants</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row"><a href="jobProfile?t=1">Engineer/Sr Engineer- Cloud Managed Services</a></th>
                    <td>Versa Networks</td>
                    <td class="job-location-td">Bangalore, Chennai</td>
                    <td style="text-align: center;">278</td>
                </tr>
                <tr>
                    <th scope="row"><a href="jobProfile?t=2">SOFTWARE ANALYST</a></th>
                    <td>Mitsogo Technologies</td>
                    <td class="job-location-td">Bangalore, Chennai</td>
                    <td style="text-align: center;">352</td>
                </tr>
                <tr>
                    <th scope="row">R&D Development Associate Engineer</th>
                    <td>Dassault Systèmes</td>
                    <td class="job-location-td">Pune & Bangalore</td>
                    <td style="text-align: center;">370</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="row" style="margin: 0 2%;">
        <div class="col-lg-8" style="padding: 5px;">
            <div id="notifications-div" class="div-cards pad-h5 pad-v3">
                <h3 style="display: inline-block;">Announcements</h3>
                <a href="#" id="announcements-external-link" class="external-link"><i
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
                                        <%=a.content %>
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
        <div class="col-lg-4" style="padding: 5px; text-align: center;">
            <div id="activities-div" class="div-cards pad-h5 pad-v3">
                <a style="width: 250px; margin: 5px;" href="jobProfile?t=add" class="btn btn-success mar-r5">
                	<i class="fas fa-plus mar-r5"></i> Add job profile</a>
                <a style="width: 250px; margin: 5px;" href="announcement?t=post" class="btn btn-danger">
                	<i class="fas fa-bullhorn mar-r5"></i> Post Announcement</a>
                <a style="width: 250px; margin: 5px;" href="#" class="btn btn-warning">
                	<i class="fas fa-table mar-r5"></i> View Placements</a>
                <hr>
                <a style="width: 250px; margin: 5px;" href="/ApmsWebApp/account" class="btn btn-primary"><i
                        class="fas fa-user-shield mar-r5"></i> My Account</a>
                <a style="width: 250px; margin: 5px;" href="/logout" class="btn btn-dark"><i
                        class="fas fa-power-off mar-r5"></i> Logout</a>

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
