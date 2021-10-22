<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null)
		response.sendRedirect("/ApmsWebApp/login");
%>

<!-- student home page-->  
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
                    <th style="text-align: center;" scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row"><a href="/job?id=12356">Engineer/Sr Engineer- Cloud Managed Services</a></th>
                    <td>Versa Networks</td>
                    <td class="job-location-td">Bangalore, Chennai</td>
                    <td style="text-align: center;"><span class="status bg-primary">OPEN</span></td>
                </tr>
                <tr>
                    <th scope="row">SOFTWARE ANALYST</th>
                    <td>Mitsogo Technologies</td>
                    <td class="job-location-td">Bangalore, Chennai</td>
                    <td style="text-align: center;"><span class="status bg-success">Applied</span></td>
                </tr>
                <tr>
                    <th scope="row">R&D Development Associate Engineer</th>
                    <td>Dassault Systèmes</td>
                    <td class="job-location-td">Pune & Bangalore</td>
                    <td style="text-align: center;"><span class="status bg-success">Applied</span></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="row" style="margin: 0 2%;">
        <div class="col-lg-7" style="padding: 5px;">
            <div id="notifications-div" class="div-cards pad-h5 pad-v3">
                <h3 style="display: inline-block;">Announcements</h3>
                <a href="#" id="announcements-external-link" class="external-link"><i
                        class="fas fa-external-link-alt"></i></a>
                <br><br>
                <table class="table table-hover">
                    <tbody>
                        <tr>
                            <td>
                                <a style="color: black;text-decoration: none;" href="/post/123">
                                    <span style="display: block;">
                                        <h5>HCL Technologies Invites 2022 B.E/B. Tech Graduates</h5>
                                        Dear Students, Please find attached the JD from HCL...
                                    </span>
                                </a>
                            </td>
                            <td style="color: rgb(158, 155, 155);">Mon Aug 23 2021 20:37:20</td>
                            <!-- Date().substring(0, 24) -->
                        </tr>
                        <tr>
                            <td>
                                <h5>Versa 2nd drive: JD for MS</h5>Dear Students,
                                Please find attached the new job description...
                            </td>
                            <td style="color: rgb(158, 155, 155);">Sun Aug 22 2021 10:37:40</td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>
        <div class="col-lg-5" style="padding: 5px;">
            <div id="activities-div" class="div-cards pad-h5 pad-v3">
                <h3>Your Activities</h3><br>
                <table class="table">
                    <tbody>
                        <tr>
                            <td>Applied for Software Engineer role at Amazon</td>
                            <td>Mon Aug 23 2021 20:37:20</td>
                            <!-- Date().substring(0, 24) -->
                        </tr>
                        <tr>
                            <td>Updated profile</td>
                            <td>Sun Aug 22 2021 10:37:40</td>
                        </tr>
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