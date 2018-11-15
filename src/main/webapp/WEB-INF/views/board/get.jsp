<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript"></script>
$(document).ready(function(){})
var operForm = $("#operForm");

$("button[data-oper='modify]").on("click", function(e{

operForm.attr("action","/board/modify").submit();

});

</body>
</html>