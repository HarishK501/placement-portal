<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null)
		response.sendRedirect("/ApmsWebApp/login");
%>

<!-- pco -->  

<jsp:include page="nav.jsp"></jsp:include>

<div id="job-profiles-div" class="div-cards pad-h5 pad-v3">
    <h2 style="display: inline-block;">Add Job Profile</h2>
    
     <form action="/ApmsWebApp/jobProfile?t=add" method="POST">
         <div class="form-group">
             <label for="Company">Company Name</label>
             <input class="form-control" type="text" name="Company" id="Company" required>
         </div>
         <div class="form-group">
             <label for="Role">Role</label>
             <input class="form-control" type="text" name="Role" id="Role" required>
         </div>
         <div class="form-group">
             <label for="Location">Location</label>
             <input class="form-control" type="text" name="Location" id="Location" required>
         </div>
         <div class="form-group">
             <label for="Profile">Company Profile</label>
             <textarea class="form-control" name="Profile" rows="5" cols="10"></textarea>
         </div>
         <div class="form-group">
             <label for="Website">Website</label>
             <input class="form-control" type="text" name="Website" id="Website" required>
         </div>
         <div class="form-group">
             <label for="Departments"> Courses allowed </label>
             <input class="form-control" type="text" name="Departments" id="Departments" required>
         </div>
         <div class="form-group">
             <label for="Eligibility">Eligibility(CGPA)</label>
             <input class="form-control" type="text" name="Eligibility" id="Eligibility" required>
         </div>
         <div class="form-group">
             <label for="Arrear">Arrear status</label>
             <input class="form-control" type="text" name="Arrear" id="Arrear" required>
         </div>
         <div class="form-group">
             <label for="Technical">Technical Knowledge</label>
             <textarea class="form-control" name="Technical" rows="5" cols="10"></textarea>
         </div>
         <div class="form-group">
             <label for="Skills">Essential Skills</label>
             <textarea class="form-control" name="Skills" rows="5" cols="10"></textarea>
         </div>
         <div class="form-group">
             <label for="Process">Placement Process</label>
             <textarea class="form-control" name="Process" rows="5" cols="10"></textarea>
         </div>
         <div class="form-group">
             <label for="ctc">Cost To Company(CTC)</label>
             <input class="form-control" type="text" name="ctc" id="ctc" required>
         </div>
         <div class="form-group">
             <label for="Attachments">Attachments</label>
             <input type="file" class="form-control-file" id="Attachments" name="Attachments" >
         </div>


         <br>

         <button style="width: 150px;" type="submit" class="btn btn-primary"><i class="fas fa-plus mar-r5"></i> Add</button>
         <a href="/ApmsWebApp/home" style="width: 150px;" type="submit" class="btn btn-secondary"><i class="fas fa-times mar-r5"></i>
             Cancel</a>

     </form>

</div>

<jsp:include page="../partials/footer.jsp"></jsp:include>

