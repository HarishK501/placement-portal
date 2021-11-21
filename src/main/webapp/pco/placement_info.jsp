<%@page import="java.util.ArrayList"%>
<%@page import="com.apms.obj.PlacementObj"%>

<%! @SuppressWarnings("unchecked") %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null)
		response.sendRedirect("/ApmsWebApp/login");
%>

<%
String notPlacedPercent = (String) request.getAttribute("notPlacedPercent");
%>

<jsp:include page="nav.jsp"></jsp:include>

	<style>
		#placement-pie-chart {
			height: 200px;
			margin: 10px auto;
    		width: 200px;
    		border-radius: 50%;
    		position: relative;
    		background: conic-gradient(orange 0.0% <%=notPlacedPercent %>%, #318ac5 <%=notPlacedPercent %>%);
    		
		}
	</style>



	<div class="row pad-v3" style="margin: 0 2%;">
        <div class="col-lg-8" style="padding: 5px;">
            <div class="div-cards pad-h5 pad-v3">
                <h3 style="display: inline-block;">Placement Status</h3>
                <a href="/ApmsWebApp/announcement?t=view_all" id="announcements-external-link" class="external-link"><i
                        class="fas fa-external-link-alt"></i></a>
                <br><br>
                <table class="table table-striped table-hover">
                	<thead>
	                	<tr>
		                    <th scope="col">Job Profile</th>
		                    <th scope="col">Company</th>
		                    <th scope="col">No. of applicants</th>
		                    <th scope="col">No. of offers</th>
	                	</tr>
                	</thead>
                    <tbody>
                    <% 
					ArrayList<PlacementObj> jobProfilesInfo = (ArrayList<PlacementObj>) request.getAttribute("jobProfilesInfo");
                    for (PlacementObj a:jobProfilesInfo) {
					%>
                        <tr>
                            <th scope="row"><a href="jobProfile?t=<%=a.jobId %>"><%=a.jobTitle %></a></th>
            				<td><%=a.company %></td>
            				<td><%=a.numApplicants %></td>
            				<td><%=a.numPlaced %></td>

                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-lg-4" style="padding: 5px;">
            <div class="div-cards pad-h5 pad-v3" style="text-align: center;">
                <div id="placement-pie-chart"></div>
                <br>
                <div>
                	<i class="fas fa-square" style="color: #318ac5"></i> Placed - <%=100 - Integer.parseInt(notPlacedPercent) %>%
                	<br>
                	<i class="fas fa-square" style="color: orange"></i> Not Placed - <%=Integer.parseInt(notPlacedPercent) %>%
                </div>
            </div>
			
			<div class="div-cards pad-h5 pad-v3" style="text-align: center;">
				<table class="table table-striped table-hover">
                	<thead>
	                	<tr>
		                    <th scope="col">Department</th>
		                    <th scope="col">Pop Count</th>
		                    <th scope="col">Placed Count</th>
	                	</tr>
                	</thead>
                	<%
                	String value;
                	%>
                    <tbody>
                    	<tr>
                    		<td>CSE</td>
                    		<% value = (String) request.getAttribute("cseStrength"); %>
                    		<td><%=value %></td>
                    		<% value = (String) request.getAttribute("csePlaced"); %>
                    		<td><%=value %></td>
                    	</tr>
                    	<tr>
                    		<td>ECE</td>
                    		<% value = (String) request.getAttribute("eceStrength"); %>
                    		<td><%=value %></td>
                    		<% value = (String) request.getAttribute("ecePlaced"); %>
                    		<td><%=value %></td>
                    	</tr>
                    	<tr>
                    		<td>EEE</td>
                    		<% value = (String) request.getAttribute("eeeStrength"); %>
                    		<td><%=value %></td>
                    		<% value = (String) request.getAttribute("eeePlaced"); %>
                    		<td><%=value %></td>
                    	</tr>
                    	<tr>
                    		<td>MEC</td>
                    		<% value = (String) request.getAttribute("mecStrength"); %>
                    		<td><%=value %></td>
                    		<% value = (String) request.getAttribute("mecPlaced"); %>
                    		<td><%=value %></td>
                    	</tr>
                    </tbody>
                </table>
			</div>
        </div>
    </div>
    <br><br>
    
    <script>
        $(document).ready(() => {
            document.body.style.backgroundImage = "url(\"./public/images/image4.png\")";
            document.body.style.backgroundSize = "cover";
            document.body.style.backgroundAttachment = "fixed";
            $("th > a").css("color", "#000");
        });
    </script>

<jsp:include page="../partials/footer.jsp"></jsp:include>
