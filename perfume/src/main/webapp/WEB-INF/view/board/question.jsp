<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>question</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
</head>

<body>

<div class="container" align="center">

	<button type="button" class="btn btn-outline-danger "
			onclick="location.href='${pageContext.request.contextPath}/board/questionForm'">문의글 입력</button>
	
	<button type="button" class="btn btn-outline-danger"
			onclick="location.href='${pageContext.request.contextPath}/board/questionList?pageNum=1'">문의글 리스트</button>	
	
	<button type="button" class="btn btn-outline-danger "
			onclick="location.href='${pageContext.request.contextPath}/home/index'">홈으로 돌아가기</button>

</div>

</body>
</html>