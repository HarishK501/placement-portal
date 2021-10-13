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
        <h3>Post Announcement</h3>
        <form action="/ApmsWebApp/announcement" method="POST">
            <p><i class="fas fa-info-circle text-warning"></i> <em> Announcements cannot be altered in future.</em></p>

            <div class="form-group">
                <label for="announcement-title-input">Title</label>
                <input type="text" name="title" id="announcement-title-input" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="announcement-content-input">Content</label>
                <textarea class="form-control" name="content" id="announcement-content-input" cols="30" rows="6"
                    required></textarea>
            </div>

            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Add file</label>
            </div>

            <div id="announcement-upload-file-div" class="form-group hide">
                <br>
                <div>
                    <div class="custom-file" style="width: 400px;">
                        <div class="form-group">
                			<label for="doc-name">File Name</label>
                			<input type="text" name="docName" id="doc-name" class="form-control">
            			</div>
            			
            			<div class="form-group">
                			<label for="doc-src">Source</label>
                			<input type="url" name="docSrc" id="doc-src" class="form-control">
            			</div>
                    </div>
                </div>
            </div>

            <br>

            <button style="width: 150px;" type="submit" class="btn btn-dark">
            <i class="fas fa-paper-plane mar-r5"></i> Post</button>

                <a href="/ApmsWebApp/home" style="width: 150px;" type="submit" class="btn btn-secondary"><i class="fas fa-times mar-r5"></i>
                    Cancel</a>
        </form>
    </div><br>

    <script>
        $(document).ready(() => {
            $("#customCheck1").click(() => {
                $("#announcement-upload-file-div").toggleClass("hide")
            });
        });
    </script>

<jsp:include page="../partials/footer.jsp"></jsp:include>