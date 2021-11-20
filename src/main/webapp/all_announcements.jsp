<%@page import="java.util.ArrayList"%>
<%@page import="com.apms.obj.AnnouncementObj"%>
<%! @SuppressWarnings("unchecked") %>
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

<div class="div-cards pad-v3" style="padding: 2% 7%">
				<h2>Announcements</h2><br />
				<table class="table table-hover table-striped">
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

<script>
	    $(document).ready(() => {
	        document.body.style.backgroundImage = 'url("public/images/image4.png")';
	        document.body.style.backgroundSize = "cover";
	        document.body.style.backgroundAttachment = "fixed";
	    });
</script>

				

<jsp:include page="partials/footer.jsp"></jsp:include>