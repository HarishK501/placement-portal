<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null)
		response.sendRedirect("/ApmsWebApp/login");
%>

<jsp:include page="nav.jsp"></jsp:include>

	<style>
    .container {
      max-width: 1920px;
      width: 85%;
    }

    .profile {
      padding-top: 3%;
    }

    .content {
      overflow-x: hidden;
      overflow-y: hidden;
    }

    .section-cards {
      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }

    .vertical-menu a {
      background-color: #eee;
      /* Grey background color */
      color: black;
      /* Black text color */
      display: block;
      /* Make the links appear below each other */
      padding: 12px;
      /* Add some padding */
      text-decoration: none;
      /* Remove underline from links */
    }

    .vertical-menu a:hover {
      background-color: #ccc;
      /* Dark grey background on mouse-over */
    }

    .vertical-menu a.active {
      background-color: #318ac5;
      /* Add a green color to the "active/current" link */
      color: white;
    }

    .profile-pic {
      height: 180px;
      width: 180px;
      padding: 10px;
      margin: 5px;
    }
  </style>

  <div class="container profile">
    <div class="row">

      <div class="col-sm-3 menu">
        <div id="job-profiles-div" class="pad-h5 pad-v3">
          <div class="section-cards vertical-menu">
            <a href="#" class="active">Profile</a>
            <a href="#about">About</a>
            <a href="#Contact">Contact</a>
            <a href="#Address">Address</a>
            <a href="#Current-Courses">Current Courses</a>
            <a href="#Previous-Education">Previous Education</a>
            <a href="#internship-experince">Internship and experince</a>
            <a href="#Technical-Skills">Technical Skills</a>
            <a href="#Projects">Projects</a>
            <a href="#Resume">Resume</a>
          </div>
        </div>
      </div>

      <div class="col-sm-9 content">
        <div id="Info" class="div-cards pad-h5 pad-v3">
          <h5>About: </h5>
          <hr>

          <div class="row">
            <div class="col-sm-8">
              <b>Pranesh M</b> <br>
              2022 Passout Batch · <br>
              CB.EN.U4CSE18044 <br>
              7th Semester, B.Tech <br>
              Computer Science & Engineering, Department of Engineering <br>
              Amrita Vishwa Vidyapeetham, Coimbatore Campus <br>
              <br>
            </div>

            <div class="col-sm-4">
              <img class="profile-pic" src="https://ample.amrita.edu/resources/product/images/profile_pic_blue.png"
                alt="Profile Pic">
            </div>

          </div>
          <button style="width: 150px;" type="submit" class="btn btn-warning btn-sm"><i class="fas fa-edit"
              style="margin-right: 5px"></i>Edit</button>
        </div>

        <div id="Contact" class="div-cards pad-h5 pad-v3">
          <h5>Contact:</h5>
          <hr>
          Contact No : 95008689556<br>
          Email: pranesh2903@gmail.com <br>
          Personal Email: praneshmj17@gmail.com <br>
          <br>
          <button style="width: 150px;" type="submit" class="btn btn-warning btn-sm"><i class="fas fa-edit"
              style="margin-right: 5px"></i>Edit</button>
        </div>

        <div id="Address" class="div-cards pad-h5 pad-v3">
          <h5>Address:</h5>
          <hr>
          Permanent Address : 12 , alangadu, 6th street , karuvampalayam Tiruppur, Tamil Nadu, India, 641604 <br>
          Current Address : 12 , alangadu, 6th street , karuvampalayam Tiruppur, Tamil Nadu, India, 641604 <br>
          <br>
          <button style="width: 150px;" type="submit" class="btn btn-warning btn-sm"><i class="fas fa-edit"
              style="margin-right: 5px"></i>Edit</button>
        </div>

        <div id="Current-Courses" class="div-cards pad-h5 pad-v3">
          <h5>Current / Ongoing Course:</h5>
          <hr>
          <h6><b>Engineering:</b></h6>
          Computer Science & Engineering <br>
          B.Tech, <br>
          Department of Engineering <br>
          CB.EN.U4CSE18044 | 2022 Passout Batch <br>
          Jul 2018 — May 2022 <br>
          Amrita Vishwa Vidyapeetham, Coimbatore Campus <br>
          <br>
          <button style="width: 150px;" type="submit" class="btn btn-warning btn-sm"><i class="fas fa-edit"
              style="margin-right: 5px"></i>Edit</button>

        </div>

        <div id="Previous-Education" class="div-cards pad-h5 pad-v3">
          <h5>Previous Education:</h5>
          <hr>
          <h6> <b>Class 12th:</b></h6>
          Abacus International Montessori School <br>
          CBSE <br>
          12th,SCIENCE | Full Time <br>
          2017 — 2018 <br>
          <br>
          <h6><b>Class 10th:</b></h6>
          Abacus International Montessori School <br>
          CBSE <br>
          10th | Full Time <br>
          2015 — 2016 <br>
          <br>
          <button style="width: 150px;" type="submit" class="btn btn-warning btn-sm"><i class="fas fa-edit"
              style="margin-right: 5px"></i>Edit</button>
        </div>

        <div id="internship-experince" class="div-cards pad-h5 pad-v3">
          <h5>Internship and Experince:</h5>
          <hr>
          <h6> <i>No details available !</i></h6>
          <br>
          <button style="width: 150px;" type="submit" class="btn btn-warning btn-sm"><i class="fas fa-edit"
              style="margin-right: 5px"></i>Edit</button>

        </div>
        <div id="Technical-Skills" class="div-cards pad-h5 pad-v3">
          <h5>Technical Skills:</h5>
          <hr>
          <h6> <i>No details available !</i></h6>
          <br>
          <button style="width: 150px;" type="submit" class="btn btn-warning btn-sm"><i class="fas fa-edit"
              style="margin-right: 5px"></i>Edit</button>

        </div>
        <div id="Projects" class="div-cards pad-h5 pad-v3">
          <h5>Projects:</h5>
          <hr>
          <h6> <i>No details available !</i></h6>
          <br>
          <button style="width: 150px;" type="submit" class="btn btn-warning btn-sm"><i class="fas fa-edit"
              style="margin-right: 5px"></i>Edit</button>

        </div>
        <div id="languages" class="div-cards pad-h5 pad-v3">
          <h5>Languages:</h5>
          <hr>
          <h6> <i>No details available !</i></h6>
          <br>
          <button style="width: 150px;" type="submit" class="btn btn-warning btn-sm"><i class="fas fa-edit"
              style="margin-right: 5px"></i>Edit</button>

        </div>
        <div id="accomplishments" class="div-cards pad-h5 pad-v3">
          <h5>Accomplishments:</h5>
          <hr>
          Awards and Recognition <br> <i>No details available !</i>
          <hr>
          Certification <br> <i>No details available !</i>
          <hr>
          Confreence and Workshop <br> <i>No details available !</i>
          <hr>
          Scholarship <br> <i>No details available !</i>
          <hr>
          <button style="width: 150px;" type="submit" class="btn btn-warning btn-sm"><i class="fas fa-edit"
              style="margin-right: 5px"></i>Edit</button>
        </div>

        <div id="Resume" class="div-cards pad-h5 pad-v3">
          <h5>Resume:</h5>
          <hr>
          <h6> <i>No details available !</i></h6>
          <br>
          <button style="width: 150px;" type="submit" class="btn btn-warning btn-sm"><i class="fas fa-edit"
              style="margin-right: 5px"></i>Edit</button>

        </div>

      </div>

    </div>




  </div>

  <script>
    $(document).ready(() => {
      document.body.style.backgroundImage = 'url("../images/image1.png")';
      document.body.style.backgroundSize = "cover";
      document.body.style.backgroundAttachment = "fixed";
    });
  </script>


<jsp:include page="../partials/footer.jsp"></jsp:include>