<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%! @SuppressWarnings("unchecked") %>
    
<%@page import="java.util.ArrayList"%>
<%@page import="com.apms.obj.ActivityObj"%>

<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null)
		response.sendRedirect("/ApmsWebApp/login");
%>

<jsp:include page="nav.jsp"></jsp:include>

<div class="div-cards pad-v3" style="padding: 2% 7%">
                <h2>My Activities</h2><br>
                <table class="table">
                    <tbody>
                    <% 
					ArrayList<ActivityObj> activities = (ArrayList<ActivityObj>) request.getAttribute("activities");
                    if (activities.isEmpty()) {
                    %>
                    <tr>
                   		<td colspan="2" style="text-align: center;"><em>-- No activities yet --</em></td>
                    </tr>
                    <%
                    } else {
                    for (ActivityObj a:activities){
					%>
                        <tr>
                            <td><%=a.activity %></td>
                            <td><%=a.datetime %></td>
                        </tr>
                    <% }} %>
                    </tbody>
                </table>
            </div>

<jsp:include page="../partials/footer.jsp"></jsp:include>