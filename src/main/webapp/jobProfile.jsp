<%@page import="com.apms.obj.JobProfileObj"%>
<%! @SuppressWarnings("unchecked") %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null)
		response.sendRedirect("/ApmsWebApp/login");
%>
     
<% 
	JobProfileObj p = (JobProfileObj) request.getAttribute("jobprofile");
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
	            <a href="jobProfile?t=edit-<%=p.id%>" class="btn btn-dark pco-options" style="width: 150px"><i
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
	                        <th>Title</th>
	                        <td><%=p.title %></td> 
	                    </tr>
	                    <tr>
	                        <th>Description</th>
	                        <td>
	                            <%=p.discriptions %>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>FTE/Intern</th>
	                        <td><%=p.type_int_fte %></td>
	                    </tr>
	                    <tr>
	                        <th>CTC</th>
	                        <td>
	                            <%=p.CTC %>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>Organization</th>
	                        <td>
	                            <%=p.organizations %>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>Location</th>
	                        <td>
	                            <%=p.location %>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>Due Date</th>
	                        <td><%=p.end_date %></td>
	                    </tr>
	                    <tr>
	                        <th>Posted On</th>
	                        <td>
	                           <%=p.posted_on %>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>Departments</th>
	                        <td>
	                             <%=p.depts %>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>Year of Graduation</th>
	                        <td>
	                            <%=p.YOG %>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>Minimun CGPA</th>
	                        <td>
	                            <%=p.minimun_cgpa %>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>Gender</th>
	                        <td>
	                            <%=p.gender %>
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
    