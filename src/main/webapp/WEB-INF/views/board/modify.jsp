<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<style>
form {
	width: 100%;
}
</style>

<!-- row -->
<div class="row tm-mt-big">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
		<div class="bg-white tm-block">
			<div class="row">
				<div class="col-12">
					<h2 class="tm-block-title d-inline-block">Board Read Page</h2>
				</div>
			</div>


			<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12">
				<form role="form" action="/board/modify" method="post">

					<div class="form-group">
						<label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">
							Bno </label> <input
							class="form-control validate col-xl-12 col-lg-12 col-md-12 col-sm-12"
							name="bno" value='${board.bno}' readonly="readonly"
							data-large-mode="true">
					</div>

					<div class="form-group">
						<label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">
							Title </label> <input
							class="form-control validate col-xl-12 col-lg-12 col-md-12 col-sm-12"
							name="title" value='${board.title}' data-large-mode="true">

					</div>

					<div class="form-group">
						<label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">
							Writer </label> <input
							class="form-control validate col-xl-12 col-lg-12 col-md-12 col-sm-12"
							name="writer" value='${board.writer}' readonly="readonly"
							data-large-mode="true">

					</div>

					<div class="form-group">
						<label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">
							Content </label> <input
							class="form-control validate col-xl-12 col-lg-12 col-md-12 col-sm-12"
							name="content" value='${board.content}' data-large-mode="true">

					</div>

					<div class="form-group">
						<div class="ml-auto col-xl-8 col-lg-8 col-md-8 col-sm-7 pl-0">
							<button type="submit" data-oper='modify' class="btn btn-default">MODIFY
							</button>
						</div>


						<div class="form-group">
							<div class="ml-auto col-xl-8 col-lg-8 col-md-8 col-sm-7 pl-0">
								<button type="submit" data-oper='remove' class="btn btn-default">DELETE
								</button>
							</div>


							<div class="form-group">
								<div class="ml-auto col-xl-8 col-lg-8 col-md-8 col-sm-7 pl-0">
									<button data-oper='list' class="btn btn-info">List</button>
								</div>


							</div></form>
							
<%-- 								<form role="form" action="/board/remove" method="post">
								<input type='hidden' name='bno' value='${board.bno}'>
								<button type="submit" date-oper='remove' class="btn btn-default">DELETE</button>
							</form> //이 값은 폼태그로 싸지 않고 자체적으로 폼을 활용할 때 --%>
			</div>
		</div>
	</div>
</div>

<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	
	var formObj = $("form");
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		if(operation === 'remove'){
			formObj.attr("action", "/board/remove");
		}else if(operation === 'list'){
			self.location = "/board/list";
			return;
		}
		formObj.submit();
		
	});
	
});

</script>