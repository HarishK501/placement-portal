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
    <h2 style="display: inline-block;">Edit Job Profile</h2>
   

     <form action="/ApmsWebApp/jobProfile?t=edit" method="POST">
         <div class="form-group">
             <label for="Company">Company Name</label>
             <input class="form-control" type="text" name="Company" id="Company" value="Versa Networks" required>
         </div>
         <div class="form-group">
             <label for="Role">Role</label>
             <input class="form-control" type="text" name="Role" id="Role" value="Engineer/Sr Engineer- Cloud Managed Services" required>
         </div>
         <div class="form-group">
             <label for="Location">Location</label>
             <input class="form-control" type="text" name="Location" id="Location" value="Bangalore, Chennai" required>
         </div>
         <div class="form-group">
             <label for="Profile">Company Profile</label>
             <textarea class="form-control" name="Profile" rows="5" cols="10">The Cloud Managed Services engineer will be responsible for providing end to end management as well as technical support to debug diverse complex networking problems reported by customer on the Versa hosted platform/solution.</textarea>
         </div>
         <div class="form-group">
             <label for="Website">Website</label>
             <input class="form-control" type="url" name="Website" id="Website" value="https://versa-networks.com/" required>
         </div>
         <div class="form-group">
             <label for="Departments"> Courses allowed </label>
             <input class="form-control" type="text" name="Departments" id="Departments" value="The candidate must have a Bachelor’s/Master’s degree in IT/ Computer Science or equivalent." required>
         </div>
         <div class="form-group">
             <label for="Eligibility">Eligibility(CGPA)</label>
             <input class="form-control" type="text" name="Eligibility" id="Eligibility" value="Above 8" required>
         </div>
         <div class="form-group">
             <label for="Arrear">Arrear status</label>
             <input class="form-control" type="text" name="Arrear" id="Arrear" value="No Standing Arrear" required>
         </div>
         <div class="form-group">
             <label for="Technical">Technical Knowledge</label>
             <textarea class="form-control" name="Technical" rows="5" cols="10">
               Replicate the customer issues in lab environment.
               Work with engineering teams to replicate customer issues and test possible fixes.
               Work on problems of diverse scope across all solutions from Versa
               Incident/ticket lifecycle management
               Setting up infrastructure.
               Create knowledge articles.
               Ability to write bash/python scripts(optional)
             </textarea>
         </div>
         <div class="form-group">
             <label for="Skills">Essential Skills</label>
             <textarea class="form-control" name="Skills" rows="5" cols="10">
              Team player, can-do attitude and takes initiative.
              Ability to work independently as well as in a team (in start-up environment).
              Good communication skills to work with cross-functional groups.
              Strong skills in large-scale software design and development.
              Excellent verbal and written communication skills.
             </textarea>
         </div>
         <div class="form-group">
             <label for="Process">Placement Process</label>
             <textarea class="form-control" name="Process" rows="5" cols="10" >
               Round 1 - Online Assesments
               Round 2 - Technical Interview
               Round 3 -  HR Interview
             </textarea>
         </div>
         <div class="form-group">
             <label for="ctc">Cost To Company(CTC)</label>
             <input class="form-control" type="text" name="ctc" id="ctc" value="12LPA" required>
         </div>
         <div class="form-group">
             <label for="Attachments">Attachments</label>
             <input type="file" class="form-control-file" id="Attachments" name="Attachments" >
         </div>


         <br>

         <button style="width: 150px;" type="submit" class="btn btn-warning"><i
                 class="fas fa-edit" style="margin-right: 5px"></i>Edit</button>

         <a href="/ApmsWebApp/home" style="width: 150px;" type="submit" class="btn btn-secondary"><i class="fas fa-times mar-r5"></i>
             Cancel</a>

     </form>

</div>

<jsp:include page="../partials/footer.jsp"></jsp:include>

