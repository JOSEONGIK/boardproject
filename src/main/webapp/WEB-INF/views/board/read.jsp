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

				<div class='row'>
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-comments fa-fw"></i><span style="font-size:25px">Reply</span>
								<br>
								<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
							</div>

							<div class="panel-body">
								<ul class="chat">
									<li class="left clearfix" data-rno='12'>
										<div>
											<div class="header">
												<Strong class="primary-font">user00</Strong> 
												<small class="pull-right text-muted">2018-01-01 13:13</small>
											</div>
											
										</div>
								</ul>
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>

					<div class="ml-auto col-xl-8 col-lg-8 col-md-8 col-sm-7 pl-0">
						<form role="form" action="/board/modify" method="get">
							<input type="hidden" name="page" value="${pageObj.page}">
							<input type="hidden" name="bno" value="${board.bno}">
							<button type='submit' class="btn btn-success btn-sm">MODIFY</button>
						</form>

						<form role="form" action="/board/list" method="get">
							<input type="hidden" name="page" value="${pageObj.page}">
							<input type="hidden" name="keyword" id="keyword"
								value="${pageObj.keyword}"> <input type="hidden"
								name="type" id="type" value="${pageObj.type}"> <input
								type="hidden" name="total" id="total" value="${pageObj.total}">
							<button type='submit' class="btn btn-info btn-sm">List</button>
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
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
			<div class="form-group"><label>Reply</label><input class="form-control" name='reply' value='New Reply!!!!'></div>
			<div class="form-group"><label>Replyer</label><input class="form-control" name='replyer' value='replyer'></div>
			<div class="form-group"><label>Reply Date</label><input class="form-control" name='regdate' value='regdate'></div>
			</div>
			<div class="modal-footer">
				<button id='modalRegisterBtn' type="button" class="btn btn-success btn-sm">Register</button>
				<button id='modalModBtn' type="button" class="btn btn-warning btn-sm">Modify</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger btn-sm">Remove</button>
				<button id='modalCloseBtn' type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
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
	$(document).ready(function() {



		var pageNum = 1;
		var replyPageFooter = $(".panel-footer");
		
		function showReplyPage(replyCnt){
			
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= replyCnt){
				endNum = Math.ceil(replyCnt/10.0);
			}
			if(endNum * 10 < replyCnt){
				next =true;
			}
			
			var str = "<ul class='pagination pull-right'>";
			
			if(prev){
				str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
			}
			
			for(var i = startNum ; i <= endNum; i++){
				var active = pageNum == i? "active":"";
				
				str+= "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
			
			if(next){
				str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1) +"'>Next</a></li>";
			}
			str += "</ul></div>";
			
			console.log(str);
			
			replyPageFooter.html(str);
					
		}

		
		replyPageFooter.on("click", "li a", function(e){
			e.preventDefault();
			console.log("page clikc");
			
			var targetPageNum = $(this).attr("href");
			
			console.log("targetPageNum: " + targetPageNum);
			
			pageNum = targetPageNum;
			
			showList(pageNum);
			
		})
		
		var bnoValue = '<c:out value="${board.bno}"/>';
		var replyUL = $(".chat");
		
		showList(1);
		
		function showList(page){
			replyService.getList({bno:bnoValue,page: page|| 1}, function(replyCnt, list){
				
				console.log("replyCnt: " + replyCnt);
				console.log("list: " + list);
				console.log(list);
				
				if(page == -1){
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
				
				var str = "";
				if(list == null || list.length == 0){
					replyUL.html("");
					
					return;
				}
				
				for ( var i = 0, len = list.length || 0; i < len; i++){
					str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					str +="<div class='header'><Strong class='primary-font'>"+list[i].replyer+"</Strong>";
					str +="<small class='pull-right text-muted'>"+ replyService.displayTime(list[i].regdate) +"</small></div>";
					str +="<p>"+list[i].reply+"</p></div></li>";
				}
				
				replyUL.html(str);
				showReplyPage(replyCnt);
			}); //end function
		}//end showList
	
		
		replyService.get(10, function(data) {
			console.log(data);
		});

		/* 	replyService.update({
		 rno : 22,
		 bno : bnoValue,
		 reply : "Modified Reply...."
		 }, function(result){
		 alert("수정 완료...");
		
		 });
		
		
		 replyService.remove(23, function(count){
		
		 console.log(count);
		
		 if (count === "success"){
		 alert("REMOVED");
		 }
		 },function(err){
		 alert('ERROR....');
		 });
		
		 replyService.getList({bno:bnoValue, page:1}, function(list){
		
		 for(var i = 0, len = list.lenght||0; i < len; i++){
		 console.log(list[i]);
		 }
		 });
		
		 replyService.add(
		 {reply:"JS Test", replyer:"tester", bno:bnoValue},
		 function(result){
		 alert("RESULT: " + result);
		 }
		 );    */

		 
		 var modal = $(".modal");
		 var modalInputReply = modal.find("input[name='reply']");
		 var modalInputReplyer = modal.find("input[name='replyer']");
		 var modalInputregdate = modal.find("input[name='regdate']");
		 
		 var modalModBtn = $("#modalModBtn");
		 var modalRemoveBtn = $("#modalRemoveBtn");
		 var modalRegisterBtn = $("#modalRegisterBtn");
		 var modalCloseBtn = $("modalCloseBtn");
		 
		
		 
		 $(".chat").on("click", "li", function(e){
			 
			 var rno = $(this).data("rno");

			 replyService.get(rno, function(reply){
				 
				 modalInputReply.val(reply.reply);
				 modalInputReply.val(reply.replyer);
				 modalInputregdate.val(replyService.displayTime(reply.regdate))
				 .attr("readonly","readonly");
				 modal.data("rno", reply.rno);
				 
				 modal.find("button[id !='modalCloseBtn']").hide();
				 modalModBtn.show();
				 modalRemoveBtn.show();
				 
				 $(".modal").modal("show");
			 });
		 });
		 
		 $("#addReplyBtn").on("click", function(e){
			 
			 modal.find("input").val("");
			 modalInputregdate.closest("div").hide();
			 modal.find("button[id !='modalCloseBtn']").hide();
			 
			 modalRegisterBtn.show();
			 
			 $(".modal").modal("show");
		 });
		 
		
		 modalRemoveBtn.on("click", function(e){
			
			 var rno = modal.data("rno");
			 
			 replyService.remove(rno, function(result){
				
				 alert(result); 
				 modal.modal("hide");
				 showList(pageNum);
			
			 });
			 
		 });
		 
		 modalModBtn.on("click", function(e){
			 
			 var reply = {rno:modal.data("rno"), reply : modalInputReply.val()};
			 
			 replyService.update(reply, function(result){
				 
				 alert(result);
				 modal.modal("hide");
				 showList(pageNum);
			 });
		 });
		 
		 modalRegisterBtn.on("click", function(e){
			 
			 var reply = {
					 reply : modalInputReply.val(),
					 replyer : modalInputReplyer.val(),
					 bno:bnoValue};
			 
			 replyService.add(reply, function(result){
				 
				 alert(result);
				 
				 modal.find("input").val("");
				 modal.modal("hide");
				 
				 showList(-1);
				 
			 
			 });
		 });
			 
		 
		 
 		var actionForm = $("#actionForm");

		$("button[btn-default='modify']").on("click", function(e) {

			actionForm.attr("action", "/board/modify").submit();
		})

		var result = '<c:out value="${result}"/>';
		var msg = $("#myModal");

		checkModal(result);
		history.replaceState({}, null, null);

		function checkModal(result) {

			if (result === '' || history.state) {
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