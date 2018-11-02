<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
				<form role="form" action="/board/list" method="get">

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
							name="title" value='${board.title}' readonly="readonly"
							data-large-mode="true">

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
							name="content" value='${board.content}' readonly="readonly"
							data-large-mode="true">
					</div>
				</form>

				<div class="ml-auto col-xl-8 col-lg-8 col-md-8 col-sm-7 pl-0">
					<form role="form" action="/board/modify" method="get">
						<input type="hidden" name="page" value="${pageObj.page}">
						<input type="hidden" name="bno" value="${board.bno}">
						<button type='submit' class="btn btn-default">MODIFY</button>
					</form>

					<form role="form" action="/board/list" method="get">
						<input type="hidden" name="page" value="${pageObj.page}">
						<input type="hidden" name="keyword" id="keyword" value="${pageObj.keyword}" >
  						 <input type="hidden" name="type" id ="type" value="${pageObj.type}">
  						 <input type="hidden" name="total" id ="total" value="${pageObj.total}">
						<button type='submit' class="btn btn-default">List</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</div>
</div>

<!-- /.panel-body -->
<!-- /.panel -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Complete Register</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>

		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<%@include file="../includes/footer.jsp"%>

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript">
$(document).ready(function(){
    
	$(document).ready(function(){
		
		var actionForm = $("#actionForm");
		
		$("button[btn-default='modify']").on("click", function(e){
			
			actionForm.attr("action", "/board/modify").submit();
		})
		
	})
	

	   var result = '<c:out value="${result}"/>';
	   var msg = $("#myModal");
	         
	   checkModal(result);
	   history.replaceState({},null,null);
	         
	   function checkModal(result){
	            
	      if(result === '' || history.state){
	       return;   
	      }
	            
	      if (result === 'SUCCESS') {
	         $(".modal-body").html("작업성공!");
	         msg.modal('show');
	            
	      }
	   }
	   
	   
	       
	});
	//수정해야함 token이 안맞아서 모달창이 안뜸
</script>