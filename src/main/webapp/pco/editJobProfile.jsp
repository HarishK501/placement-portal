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
<!-- pco -->  

<jsp:include page="nav.jsp"></jsp:include>

<div id="job-profiles-div" class="div-cards pad-h5 pad-v3">
    <h2 style="display: inline-block;">Edit Job Profile</h2>
   

     <form action="/ApmsWebApp/jobProfile?t=edit" method="POST">
        <input type="hidden" id="id" name="id" value="<%=p.id %>">
     	<div class="form-group">
             <label for="Title">Title</label>
             <input class="form-control" type="text" name="Title" id="Title" value="<%=p.title %>" required>
         </div>
         <div class="form-group">
             <label for="descriptions">Description</label>
             <textarea class="form-control" name="descriptions" rows="5" cols="10"> <%=p.descriptions %> </textarea>
         </div>
         <div class="form-group">
             <label for="type_int_fte">FTE/Intern</label>
             <input class="form-control" type="text" name="type_int_fte" id="type_int_fte" value="<%=p.type_int_fte %>" required>
         </div>
         <div class="form-group">
             <label for="CTC">Cost To Company(CTC)</label>
             <input class="form-control" type="number" name="CTC" id="CTC" value="<%=p.CTC %>" required>
         </div>
         <div class="form-group">
             <label for="organizations">Organization</label>
             <input class="form-control" type="text" name="organizations" id="organizations" value="<%=p.organizations%>" required>
         </div>
         <div class="form-group">
             <label for="location"> Location </label>
             <input class="form-control" type="text" name="location" id="location" value="<%=p.location %>" required>
         </div>
         <div class="form-group">
             <label for="end_date">Due Date</label>
             <input class="form-control" type="date" name="end_date" id="end_date" value="<%=p.end_date %>" required>
         </div>
         <div class="form-group">
             <label for="posted_on">Posted On</label>
             <input class="form-control" type="date" name="posted_on" id="posted_on" value="<%=p.posted_on %>" required>
         </div>
         <div class="form-group">
             <label for="depts">Department</label>
             <input class="form-control" type="text" name="depts" id="depts" value="<%=p.depts %>" required>
         </div>
         <div class="form-group">
             <label for="YOG">Year of Graduation</label>
             <input class="form-control" type="number" name="YOG" id="YOG" value="<%=p.YOG %>" required>
         </div>
         <div class="form-group">
             <label for="minimum_cgpa">CGPA</label>
             <input class="form-control" type="number" name="cgpa" id="cgpa" value="<%=p.minimun_cgpa %>" required>
         </div>
		 <div class="form-group">
             <label for="gender">Gender</label>
             <input class="form-control" type="text" name="gender" id="gender" value="<%=p.gender %>" required>
         </div>
         
         <div class="form-group">
             <label for="attached_doc">Attached Document</label>
             <input type="file" class="form-control-file" id="attached_doc" name="Attachments" >
         </div>
     
     

         <br>

         <button style="width: 150px;" type="submit" class="btn btn-warning"><i
                 class="fas fa-edit" style="margin-right: 5px"></i>Edit</button>

         <a href="/ApmsWebApp/home" style="width: 150px;" type="submit" class="btn btn-secondary"><i class="fas fa-times mar-r5"></i>
             Cancel</a>

     </form>

</div>

<jsp:include page="../partials/footer.jsp"></jsp:include>

