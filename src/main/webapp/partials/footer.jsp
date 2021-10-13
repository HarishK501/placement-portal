<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer>
    <i class="far fa-copyright fa-xs"></i> <span id="year"></span>  APMS CBE
</footer>
<script>
    $(document).ready(() => {
        let year = new Date().getFullYear();
        document.getElementById("year").innerText = year;
        $('.dropdown').on('show.bs.dropdown', function () {
            $(this).find('.dropdown-menu').first().stop(true, true).slideDown(100);
        });
        $('.dropdown').on('hide.bs.dropdown', function () {
            $(this).find('.dropdown-menu').first().stop(true, true).slideUp(100);
        });
    })
</script>
</body>

</html>