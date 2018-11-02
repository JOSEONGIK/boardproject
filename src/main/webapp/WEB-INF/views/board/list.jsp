<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<style>
.form-horizontal {
	width: 100%;
	margin: 0 auto;
	justify-content: flex-end;
}
}
</style>
<!-- row -->
<div class="row tm-content-row tm-mt-big">
	<div class="col-xl-12 col-lg-12 tm-md-12 tm-sm-12 tm-col">
		<div class="bg-white tm-block h-100">
			<div class="row">
				<div class="col-md-12 col-sm-12">
					<h2 class="tm-block-title d-inline-block">Board</h2>

				</div>
				<div class="col-md-4 col-sm-12 text-right">
					<a href="/board/register" class="btn btn-small btn-primary">Register</a>
				</div>

			</div>
			<div class="table-responsive">
				<table
					class="table table-hover table-striped tm-table-striped-even mt-3">
					<thead>
						<tr class="tm-bg-gray">
							<th scope="col">&nbsp;</th>
							<th scope="col" class="text-center">bno</th>
							<th scope="col" class="text-center">title</th>
							<th scope="col" class="text-center">writer</th>
							<th scope="col" class="text-center">hit</th>
							<th scope="col" class="text-center">regdate</th>
							<th scope="col" class="text-center">updatedate</th>
							<th scope="col">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="board">
							<tr>
								<th scope="row"><input type="checkbox"
									aria-label="Checkbox"></th>
								<td class="text-center"><c:out value="${board.bno}"></c:out></td>
								<td><a href="${board.bno}" class='board'> <c:out
											value="${board.title}" /></a></td>
								<td class="text-center"><c:out value="${board.writer}"></c:out></td>
								<td class="text-center">0</td>
								<td class="text-center"><fmt:formatDate
										pattern="yyyy-MM-dd hh:mm:ss" value="${board.regdate}" /></td>
								<td class="text-center"><fmt:formatDate
										pattern="yyyy-MM-dd hh:mm:ss" value="${board.updatedate}" /></td>
								<td><i class="fas fa-trash-alt tm-trash-icon"></i></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="tm-table-actions-col-right">

				<span class="tm-pagination-label">Page</span>
				<nav aria-label="Page navigation" class="d-inline-block">
					<ul class="pagination tm-pagination">
						<c:if test="${pageObj.prev}">
							<li class="page-item active"><a href="${pageObj.start-1}" class="page-link" >Prev</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageObj.start}" end="${pageObj.end}">

							<li class="page-item" data-page='${num}'><a
								class="page-link" href="${num}"><c:out value="${num}" /></a></li>
						</c:forEach>
						<c:if test="${pageObj.next}">
							<li class="page-item"><a class="page-link"
								href="${pageObj.end+1}">Next</a></li>
						</c:if>
					</ul>
				</nav>

				<div class="panel-body">
					<div class="table-responsive">
						<form id='searchForm' class='form-horizontal'>
							<select name="type">
                  <option <c:out value="${pageObj.type == null?'selected':'' }"/>>--</option>
                  <option value="t"<c:out value="${pageObj.type == 't'?'selected':'' }"/>>제목</option>
                  <option value="c"<c:out value="${pageObj.type == 'c'?'selected':'' }"/>>내용</option>
                  <option value="w"<c:out value="${pageObj.type == 'w'?'selected':'' }"/>>작성자</option>
                  <option value="tc"<c:out value="${pageObj.type == 'tc'?'selected':'' }"/>>제목+내용</option>
                  <option value="tcw"<c:out value="${pageObj.type == 'tcw'?'selected':'' }"/>>제목+내용+작성자</option>
							</select> <input type="text" name="keyword" value="${pageObj.keyword}"/>
							<input type='hidden' name='page' value="${pageObj.page}"/>
							<input type='hidden' name='total' value="${pageObj.total}"/>
							<button id="searchBtn">SEARCH</button>
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


<form id="actionForm" action="/board/list" method="get">
	<input type="hidden" name="page" id="page" value="${pageObj.page}">
	<input type="hidden" name="keyword" id="keyword" value="${pageObj.keyword}" >
   <input type="hidden" name="type" id ="type" value="${pageObj.type}">
      <input type="hidden" name="total" id ="total" value="${pageObj.total}">
</form>
<%@include file="../includes/footer.jsp"%>


<script type="text/javascript">
	$(document)
			.ready(
					function() {
						
						 $("#searchBtn").on("click",function(e){
						      
						      var searchTypeValue =$("select[name='type'] option:selected").val();
						      
						      var searchKeyword = $("input[name='keyword']").val();
						      console.log(searchKeyword);
						      if(searchKeyword.trim().length == 0){
						         
						         alert("검색어없음");
						         
						         return;
						      }
						      
						      actionForm.attr("action","/board/list");
						      $("#keyword").val(searchKeyword);
						      actionForm.find("input[name='type']").val(searchTypeValue);
						      $("#page").val(1);
						      
						      actionForm.submit();
						      
						   });


						var result = '<c:out value="${result}"/>';
						checkModal(result);
						history.replaceState({}, null, null);

						function checkModal(result) {
							if (result === '' || history.state) {
								return;	}

							if (result === 'SUCCESS') {
								$(".modal-body").html("작업이 완료되었습니다.");
							}
							$("#myModal").modal("show");
						}
						$("#regBtn").on("click", function() {

							self.location = "/board/register"
						})

						var actionForm = $("#actionForm");
						var pageNum = ${pageObj.page};

						$(".board")
								.on(
										"click",
										function(e) {

											e.preventDefault();

											var bno = $(this).attr("href");
											actionForm
													.append("<input type='hidden' name='bno' value='"+bno+"'>");
											actionForm.attr("action",
													"/board/read").attr(
													"method", "get").submit();

										});//중요..이걸로 링크연결함

						$(
								'.pagination tm-pagination li[data-page ='
										+ pageNum + ']').addClass("active");

						$('.page-link').on(
								"click",
								function(e) {

									e.preventDefault();
									var target = $(this).attr("href");
									console.log(target);
									$("#page").val(target);
									actionForm.attr("action", "/board/list")
											.attr("method", "get").submit();
								})
					});
</script>