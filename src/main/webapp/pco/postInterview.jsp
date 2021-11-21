<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null)
		response.sendRedirect("/ApmsWebApp/login");
%>

<!-- pco -->  

<jsp:include page="nav.jsp"></jsp:include>
         <div id="announcement-form-div" class="div-cards pad-h5 pad-v3">
        <h3>Post Interview</h3>
        <form action="/ApmsWebApp/jobProfile?t=post" method="POST">
            <div class="form-group">
                <label for="announcement-title-input">Student ID</label>
                <input type="text" name="rollno" id="announcement-title-input" class="form-control" required>
            </div>
            <br>
            <div class="form-group">
                <label for="announcement-content-input">Job ID</label>
                <input type="text" name="jobid" id="announcement-title-input" class="form-control" required>
            </div>
            <br>
            <div class="form-group">
                <label for="announcement-content-input">Date of interview</label>
                <input type="text" name="date" id="announcement-title-input" class="form-control" required>
            </div>
            <br>
            <div class="form-group">
                <label for="announcement-content-input">Time of interview</label>
                <input type="text" name="time" id="announcement-title-input" class="form-control" required>
            </div>
            <br>
            <br>
              <button style="width: 150px;" type="submit" class="btn btn-dark"><i
                 class="fas fa-paper-plane mar-r5"></i>Post</button>

                <a href="/ApmsWebApp/home" style="width: 150px;" type="submit" class="btn btn-secondary"><i class="fas fa-times mar-r5"></i>
                    Cancel</a>
        </form>
    </div>


    <script>
        $(document).ready(() => {
            $("#customCheck1").click(() => {
                $("#announcement-upload-file-div").toggleClass("hide")
            });
        });
    </script>

<jsp:include page="../partials/footer.jsp"></jsp:include>
