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
                    <a class="nav-link" href="/account">My Account</a>
                </li>
                <li class="nav-item">
                    <a id="logout-button" class="nav-link" role="button" href="/logout"><i
                            class="fas fa-power-off text-danger"></i>
                    </a>
                </li>
            </ul>
        </div>
    </nav>