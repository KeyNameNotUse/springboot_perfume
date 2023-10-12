<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 삭제 확인</title>
<!-- bootstrap link -->
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
<div class="container">
	<div class="row">
		<div class="col text-center">
			<form action="${pageContext.request.contextPath}/board/questionDeletePro"
			name="del" method="post">
			<input type="hidden" name="num" value="${num}"> <!-- 게시글 num을 hidden으로 받음 -->
				<p class="fs-4">문의글을 삭제하시겠습니까?</p>
				<button type="submit" class="btn btn-outline-danger">
					삭제
				</button>
				
				<!-- admin으로 접속했을경우, questionView가 아니라 qeustionManagement로 이동하기 -->
				<c:choose>
				 <c:when test="${id eq 'admin'}">
					<button type="button" class="btn btn-outline-secondary"
					onclick="location.href='${pageContext.request.contextPath}/board/questionManagement?num=${num}'">
					취소
					</button>			</c:when>
				
				<c:otherwise>
				<button type="button" class="btn btn-outline-secondary"
				onclick="location.href='${pageContext.request.contextPath}/board/questionView?num=${num}'">
					취소
				</button>				</c:otherwise>
				</c:choose>

				
			</form>
		</div>
	</div>
</div>
</body>
</html>