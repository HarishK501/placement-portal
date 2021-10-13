<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- student navbar -->
<jsp:include page="../partials/header.jsp">
	<jsp:param name="title" value=" " />
</jsp:include>

<nav class="navbar navbar-expand-lg navbar-dark pad-h5">
    <a class="navbar-brand logo" href="/">APMS</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/interviews">Interviews</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/offers">Offers</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/profile">My Profile</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user-circle"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/account"><i
                            class="fas dropdown-menu-icons fa-user-shield text-primary"></i> My Account</a>
                    <a class="dropdown-item" href="/logout"><i
                            class="fas dropdown-menu-icons fa-power-off text-danger"></i> Logout</a>
                </div>
            </li>
        </ul>
    </div>
</nav>