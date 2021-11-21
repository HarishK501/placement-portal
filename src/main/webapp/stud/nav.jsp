<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	if (session.getAttribute("user") == null)
		response.sendRedirect("login");
%>


<!-- student navbar -->
<jsp:include page="../partials/header.jsp">
	<jsp:param name="title" value=" " />
</jsp:include>

<nav class="navbar navbar-expand-lg navbar-dark pad-h5">
    <a class="navbar-brand logo" href="${pageContext.request.contextPath}/home">APMS</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/home">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/applied">Applied Jobs</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/interviews">Interviews</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/offers">Offers</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/profile">My Profile</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user-circle"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/account"><i
                            class="fas dropdown-menu-icons fa-user-shield text-primary"></i> My Account</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i
                            class="fas dropdown-menu-icons fa-power-off text-danger"></i> Logout</a>
                </div>
            </li>
        </ul>
    </div>
</nav>