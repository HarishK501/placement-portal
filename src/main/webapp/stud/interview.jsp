<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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

    <div class="div-cards interview_1" id="interview_div">
      <h2 style="margin-top:20px; margin-left:80px;">Interviews</h2>

        <div class="mydiv1">

            <h3> SOFTWARE TEST ENGINEER</h3>
            <p>&#127970; Cognizoft <br> Date: 5th September, 2021 <br> Time: 10:30 am</p>
            <button  type="submit" class="btn btn-primary btn-sm">Status</button>


        </div>
        <div class="mydiv2">
            <h3>PRODUCT EVANGELIST</h3>
            <p> &#127970; Dell <br> Date: 25th September, 2021 <br> Time: 11:00 am</p>
            <button type="submit" class="btn btn-primary btn-sm">Status</button>
        </div>
    </div><br><br>

    <script>
      $(document).ready(() => {
        document.body.style.backgroundImage = "url(\"./public/images/image3.png\")";
        document.body.style.backgroundSize = "cover";
        document.body.style.backgroundAttachment = "fixed";
      });
    </script>


<jsp:include page="../partials/footer.jsp"></jsp:include>