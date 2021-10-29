<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%! @SuppressWarnings("unchecked") %>
    
<%@page import="java.util.ArrayList"%>
<%@page import="com.apms.obj.InterviewObj"%>

<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null)
		response.sendRedirect("/ApmsWebApp/login");
%>

<jsp:include page="nav.jsp"></jsp:include>

	<style>
        .div-cards {

            background-color: rgba(255, 255, 255, 0.95);
			border-radius: 30px;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            display:grid;
            margin:3%;

        }
        .interview_1 .mydiv1{
            position: relative;
            background-color:azure;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            margin-top:30px;
            margin-bottom:10px;
            margin-left: 5%;
            margin-right: 5%;
        }
        .interview_1 .mydiv2{
            position: relative;
            background-color: azure;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		    margin-top:30px;
            margin-bottom:30px;
            margin-left: 5%;
            margin-right: 5%;
        }
        .interview_1 .mydiv1 h3{
            padding-top:20px;
            position: relative;
            padding-left:30px;
            font-size:25px;
            font-weight: bold;
        }
        .interview_1 .mydiv1 p{
            position: relative;
            padding:2px;
            padding-top:3px;
            padding-left:30px;
            font-size:15px;
            font-weight: bold;
            color:grey ;

        }
        .interview_1 .mydiv2 h3{
            position: relative;
            padding-top:20px;
            padding-left:30px;
            font-size:25px;
            font-weight: bold;
        }
        .interview_1 .mydiv2 p{
            position: relative;
            padding:2px;
            padding-top:3px;
            padding-left:30px;
            font-size:15px;
            font-weight: bold;
            color:grey ;

        }
        .interview_1 .mydiv1 a{

            margin-left:5px;
            margin-bottom:15px;
            margin-right:40px;
            margin-top:40px;

            padding:8px;
            padding-left:15px;
            padding-right: 15px;

            color: #f7eeee;
            background-color:#0d41b3;
            border-radius: 30px;
        }
        .interview_1 .mydiv2 a{
            margin-left:5px;
            margin-bottom:15px;
            padding:8px;
            padding-left:15px;
            padding-right: 15px;
            color: #f7eeee;
            background-color:#0d41b3;
            border-radius: 30px;
        }
        button{
          margin-left:30px;
          margin-bottom:15px;
          margin-right:40px;
          width: 120px;
          color:#0d41b3;
        }

    </style>
<% 
String title = (String) request.getAttribute("organization");
String organization = (String) request.getAttribute("title");
String ondate= (String) request.getAttribute("ondate");
String ontime = (String) request.getAttribute("ontime");
String interview_status = (String) request.getAttribute("interview_status");
%>

    <div class="row" style="margin: 0 2%;">
        <div class="col-lg-12" style="padding: 5px;">
        <br>
            <div id="notifications-div" class="div-cards pad-h5 pad-v3">
                <h3 style="display: inline-block;">Interviews</h3>
                <br><br>
                <table class="table">
                    <tbody>
                    <% 
					ArrayList<InterviewObj> interviews = (ArrayList<InterviewObj>) request.getAttribute("interviews");
                    for (InterviewObj a: interviews){
					%>
                        <tr>
                            <td>
                                   
                                        <h3><%=a.title %></h3>

                            </td>
                            
                            

                        </tr>
                         <tr>
                            <td>
                                   
                                        <h4><%=a.organization %></h4>

                            </td>
                            
                            <td style="color: rgb(158, 155, 155);"><%=a.ondate %></td>
                            <td style="color: rgb(158, 155, 155);"> <%=a.ontime %></td>

                        </tr>
                         <tr>
                            <td>
                                   
                                        <h5><%=a.interview_status %></h5>

                            </td>
                           

                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
	</div>
    <script>
      $(document).ready(() => {
        document.body.style.backgroundImage = "url(\"./public/images/image3.png\")";
        document.body.style.backgroundSize = "cover";
        document.body.style.backgroundAttachment = "fixed";
      });
    </script>


<jsp:include page="../partials/footer.jsp"></jsp:include>