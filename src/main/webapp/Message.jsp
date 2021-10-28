<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
String message = (String) request.getAttribute("message");
%>

<jsp:include page="partials/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>

    <nav class="navbar navbar-expand-lg navbar-dark pad-h5">
        <a class="navbar-brand logo" href="${pageContext.request.contextPath}/home">APMS</a>
    </nav>
    
    <br>
    <div style="margin: 2% 5%"><%=message %></div>
    <script>
        $(document).ready(() => {
            document.body.style.backgroundColor = "aliceblue";
        });
    </script>
<jsp:include page="partials/footer.jsp"></jsp:include>