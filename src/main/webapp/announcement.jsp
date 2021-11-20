<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
String title = (String) request.getAttribute("title");
String content = (String) request.getAttribute("content");
String postedBy = (String) request.getAttribute("postedBy");
String dateTime = (String) request.getAttribute("datetime");
String docLink = "#";
if (request.getAttribute("attachment") != null) {
	docLink = (String) request.getAttribute("attachment");
}

%>

	<div class="div-cards pad-h5 pad-v3">
	    <h3>
	    <%=title %>
	    </h3>
	    <p style="color:blue">
	    <%=postedBy %><br>
	    <%=dateTime %>
	    </p>
	    <br>
	    <div>
	        <%=content %>
	    </div>
	    <br><br>

		<% if (!docLink.equals("#")) { %>  
			<div class="attached-docs-div">
				<a class="btn btn-secondary attached-docs-download-button"
					href="<%=docLink %>">Download <i
						class="fas fa-download"></i></a>
				<div class="content">
					<i class="far fa-file-alt fa-5x text-primary"></i><br /><br />
	
					<% if (title.length() < 20) { %>  
						<h6><%=title %> - Document</h6>
					<% } else { %>
						<h6><%=title.substring(0, 20)+"..." %> - Document</h6>
					<% } %> 
					
				</div>
			</div><br>
		<% } %>
	
	    
	</div>
	<br>
	
	<script>
	    $(document).ready(() => {
	        document.body.style.backgroundImage = 'url("public/images/image4.png")';
	        document.body.style.backgroundSize = "cover";
	        document.body.style.backgroundAttachment = "fixed";
	    });
	</script>
	
<jsp:include page="partials/footer.jsp"></jsp:include>
