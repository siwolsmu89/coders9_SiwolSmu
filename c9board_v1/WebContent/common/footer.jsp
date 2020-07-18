<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="row justify-content-center mt-5 mb-3">
	<div class="col-9">
		<div style="border: 1px solid lightgray;" onmouseover="showFooter()"></div>
	</div>
</div>
<div id="footer-info" class="row justify-content-center">
	<div class="col-5 text-center mt-3 mb-3">
		<div class="text-muted" style="padding: 0;">
			<h6 style=" margin-bottom: 0;">board_v1 Info</h6>
			<small>Working Period : 2020/07/06 ~ </small>
		</div>
	</div>
</div>
<script type="text/javascript">

	function showFooter() {
		document.querySelector(".footer #footer-info").style.display="";
	}
	
	function hideFooter() {
		document.querySelector(".footer #footer-info").style.display="none";
	}

</script>