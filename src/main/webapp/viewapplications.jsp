<%@page import="java.util.ArrayList"%>
<%@page import="com.apms.obj.ApplicationObj"%>
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

<% if (session.getAttribute("user").equals("1")) { %>  
	<jsp:include page="stud/nav.jsp"></jsp:include>
<% } else if (session.getAttribute("user").equals("2")) { %>
	<jsp:include page="pco/nav.jsp"></jsp:include>
<% } %> 
<% 
String regno = (String) request.getAttribute("regNo");
String name = (String) request.getAttribute("fullname");
String email= (String) request.getAttribute("email");
String phone = (String) request.getAttribute("phone");
String dept = (String) request.getAttribute("dept");
String sec = (String) request.getAttribute("section");
String gender = (String) request.getAttribute("gender");
String title= (String) request.getAttribute("title");
String condition=(String) request.getAttribute("app_status");
%>

<div class="div-cards pad-v3" style="padding: 2% 7%">
		<h2>Applications for Job <%=title %></h2><br />
		<table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th scope="col">Reg.No</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Department</th>
                    <th scope="col">Section</th>
                    <th scope="col">Gender</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
            <% 
			ArrayList<ApplicationObj> applications = (ArrayList<ApplicationObj>) request.getAttribute("applications");
            for (ApplicationObj a:applications){
            %>
            	<tr>
            		<td><%=a.rollno %></td>
            		<td><%=a.fullname %></td>
            		<td><%=a.email %></td>
            		<td><%=a.phone %></td>
            		<td><%=a.dept %></td>
            		<td><%=a.sec%></td>
            		<td><%=a.gender %></td>
            		<% if (a.status.equals("Inprogress")) { %>
				         <th><span class="status bg-primary">Open</span></th>
				      <% } else { %>
				         <th><span class="status bg-dark">Closed</span></th>
				      <% } %>
            		
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