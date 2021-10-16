<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null)
		response.sendRedirect("/ApmsWebApp/login");
%>
 
<jsp:include page="nav.jsp"></jsp:include>

    <div id="job-application-form-div" class="div-cards pad-h5 pad-v3">
        <h3>Application for (--Job title--)</h3>
        <br>
        <form action="application?t=12367" method="POST">
            <p><i class="fas fa-info-circle text-warning"></i> <em> All your current details from your profile will be
                    submitted along with this form. Make sure your profile is up to date.</em></p>
            <label for="application-about-company">Please mention a few lines about the company after going through
                their website</label>
            <textarea class="form-control" name="aboutCompany" id="application-about-company" cols="30"
                rows="6" minlength="100" required></textarea>
            <br>

            <label>Resume</label><br>
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="choose-resume-option" name="customRadioInline" class="custom-control-input"
                    checked>
                <label class="custom-control-label" for="choose-resume-option">Choose from my resumes</label>
            </div>
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="upload-resume-option" name="customRadioInline" class="custom-control-input">
                <label class="custom-control-label" for="upload-resume-option">Add a new resume</label>
            </div>
            <br><br>

            <div class="row">
                <div id="choose-resumes-div" class="col-lg-6 form-group">
                    <label for="choose-resumes-div-options">Choose a resume</label>
                    <select id="choose-resumes-div-options" class="form-control" aria-label=".form-select-lg">
                        <option value="(--resume_id--)" selected>Resume</option>
                        <option value="resume2">Resume 2</option>
                        <option value="resume3">Resume 3</option>
                    </select>
                </div>
                <div id="upload-resume-div" class="col-lg-6 form-group" style="display: none;">


                			<label for="doc-src">Provide resume link</label>
                			<p><i class="fas fa-info-circle text-info"></i> <em> Make sure that the link is set to "Anyone can view".</em></p>
                			<input type="url" name="docSrc" id="doc-src" class="form-control">


                </div>
            </div>

            <br><br>
            <button style="width: 150px;" class="btn btn-primary">Submit</button>
        </form>
    </div><br>

    <script>
        $(document).ready(() => {

            $("#choose-resume-option").click(() => {
                $("#upload-resume-div").hide();
                $("#choose-resumes-div").fadeIn();
                $("#resume-upload-input").attr("required", "false")
            })

            $("#upload-resume-option").click(() => {
                $("#choose-resumes-div").hide();
                $("#upload-resume-div").fadeIn();
                $("#resume-upload-input").attr("required", "true")
            })

        });

    </script>
    
<jsp:include page="../partials/footer.jsp"></jsp:include>
