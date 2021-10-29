<%@page import="com.apms.obj.OfferObj"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%! @SuppressWarnings("unchecked") %>

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
            margin:4%;
            padding-bottom:30px;

        }
        .offers_1 .mydiv{
            position: relative;
            background-color:azure;
			border-radius: 30px;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            margin-top:30px;
            margin-bottom:10px;
            margin-left: 5%;
            margin-right: 5%;
        }

        .offers_1 .mydiv h3{
            padding-top:20px;
            position: relative;
            padding-left:30px;
            font-size:25px;
            font-weight: bold;
        }
        .offers_1 .mydiv p{
            position: relative;
            padding:2px;
            padding-top:3px;
            padding-left:30px;
            font-size:15px;
            font-weight: bold;
            color:grey ;

        }

    </style>

    <div class="div-cards offers_1" id="offers_div">
        <h2 style="margin-top:20px; margin-left:86px;">Offers</h2>
        <% ArrayList<OfferObj> offers = (ArrayList<OfferObj>) request.getAttribute("offers"); 
        for (OfferObj o:offers) {
       	%>
        <div class="mydiv">
            <h3> <a href="jobProfile?t=<%=o.id%>&n=true"><%=o.title %></a></h3>
            <p>&#127970; <%=o.company %> </p>

        </div>
        <%
        }
        %>
        
        
    </div>

    <script>
      $(document).ready(() => {
    	  document.body.style.backgroundImage = "url(\"./public/images/image3.png\")";
        document.body.style.backgroundSize = "cover";
        document.body.style.backgroundAttachment = "fixed";
      });
    </script>

<jsp:include page="../partials/footer.jsp"></jsp:include>
