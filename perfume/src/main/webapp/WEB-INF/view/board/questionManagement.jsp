<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 관리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>

	<div class="container mb-5" align="center">
	<h3> 문의글 관리 페이지</h3>
	</div>

	<div class="container">
	
	<!-- 문의글 분류 선택하기  -->	
	<div class="d-flex justify-content-center">
	<div>
		<button class="btn btn-outline-dark btn-sm" type="button"
		onclick="filterQuestionsByCategory('all')" >[전체]</button></div>	
	<div>
		<button class="btn btn-outline-dark btn-sm" type="button"
		onclick="filterQuestionsByCategory('1')" >[상품]</button></div>	
	<div>
		<button class="btn btn-outline-dark btn-sm" type="button"
		onclick="filterQuestionsByCategory('2')" >[배송]</button></div>	
	<div>
		<button class="btn btn-outline-dark btn-sm" type="button"
		onclick="filterQuestionsByCategory('3')" >[주문및결제]</button></div>	
	<div>
		<button class="btn btn-outline-dark btn-sm" type="button"
		onclick="filterQuestionsByCategory('4')" >[회원]</button></div>	
	<div>
		<button class="btn btn-outline-dark btn-sm" type="button"
		onclick="filterQuestionsByCategory('5')" >[기타]</button></div>	
	</div>


	<!-- 테이블 시작 -->
	<table class="table table-hover">
		<thead>
			<tr align="center">
				<th scope="col" width="5%">No</th>
				<th scope="col" width="10%">분류</th>
				<th scope="col" width="10%">아이디</th>
				<th scope="col" width="30%">제목</th>
				<th scope="col" width="10%">작성일</th>
				<th scope="col" width="10%">답변</th>
			</tr>
		</thead>


<c:forEach var="q" items="${questionListAdmin}">
		<tbody>
			<tr align="center" class="question-item" data-quesubject="${q.quesubject}">

				<c:set var="boardNum" value="${boardNum}"/>
				<th scope="row">${boardNum}</th>				
				<c:set var="boardNum" value="${boardNum-1}"/>
						
				<c:if test="${q.quesubject eq 1}"><td>[상품]</td></c:if> 
				<c:if test="${q.quesubject eq 2}"><td>[배송]</td></c:if>
				<c:if test="${q.quesubject eq 3}"><td>[주문및결제]</td></c:if>
				<c:if test="${q.quesubject eq 4}"><td>[회원]</td></c:if>
				<c:if test="${q.quesubject eq 5}"><td>[기타]</td></c:if>			
				
				<td>${q.id}</td>
				<td><a
					href="${pageContext.request.contextPath}/board/questionCommentForm?num=${q.num}"
					style="color: black;">${q.quetitle}</a></td>
				<td><fmt:formatDate value="${q.regdate}" var="dateValue" 
					 pattern="yyyy-MM-dd HH:mm"/>${dateValue}</td>					 
	<!-- 답변이 이미 달린 문의글은 답변완료버튼 보이게  -->	
				<td>	
				<c:forEach var="yy" items="${yy}">				
				<c:if test="${q.num eq yy.num }">
					<button class="btn btn-sm btn-outline-primary" disabled>      
					<i class="bi bi-suit-heart-fill"></i>답변완료</button></c:if>
				</c:forEach></td>

			</tr>
		</tbody>
</c:forEach>
	</table>
	<!-- 테이블 끝 -->	
	
	</div>


	<!-- 페이지 표시 -->
	<br>
	<div class="text-center">
		<!-- 이전 버튼 -->
		<c:if test="${start < bottomLine}">
			<a href="#" class="btn btn-sm btn-outline-danger disabled">이전</a>
		</c:if>
		<c:if test="${start > bottomLine}">
			<a
				href="${pageContext.request.contextPath}/board/questionManagement?pageNum=${start-bottomLine+(bottomLine-1)}"          
				class="btn btn-sm btn-outline-primary">이전</a> 					<!-- 1페이지 아니라 5페이지로 이동하게  -->         
			</c:if>

		<!-- 현재 페이지 표시 -->
		<c:forEach var="p" begin="${start}" end="${end}">
			<a
				href="${pageContext.request.contextPath}/board/questionManagement?pageNum=${p}"
				class="btn <c:if test="${pageInt==p}"> btn-sm btn-outline-secondary </c:if> ml-3 mr-3">${p}</a>
		</c:forEach>

		<!-- 다음 버튼 -->
		<c:if test="${end >= maxPage}">
			<a href="#" class="btn btn-sm btn-outline-danger disabled">다음</a>
		</c:if>
		<c:if test="${end <  maxPage}">
			<a
				href="${pageContext.request.contextPath}/board/questionManagement?pageNum=${start+bottomLine}"
				class="btn btn-sm btn-outline-primary">다음</a>
		</c:if>
	</div>
	
	
	
<script>
function filterQuestionsByCategory(category) {
    var questionItems = document.querySelectorAll('.question-item');
    
    questionItems.forEach(function(item) {
        if (item.getAttribute('data-quesubject') === category) {
            item.style.display = 'table-row';
        } else if (category === 'all') {
        	item.style.display = 'table-row'; 	
        } else {
            item.style.display = 'none'; // 다른 카테고리의 질문은 숨김
        }
    });
}
</script>

</body>
</html>