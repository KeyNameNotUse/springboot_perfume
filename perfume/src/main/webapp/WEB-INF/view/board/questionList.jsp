<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일대일 문의게시판</title>
</head>
<body>
	
	<div class="container mb-5" align="center">
	<p class="lead"><strong>${member.id}</strong>님 문의글을 작성해보세요
		<br><small>주말 제외 평균 3일 이내에 답변이 달립니다</small></p>
	</div>
	
	<div class="container">
	<table class="table table-hover">
		<thead>
			<tr align="center">
				<th scope="col" width="5%">No</th>
				<th scope="col" width="10%">분류</th>
				<th scope="col" width="30%">제목</th>
				<th scope="col" width="10%">작성일</th>
				<th scope="col" width="10%">답변 유무</th>
			</tr>
		</thead>


<c:forEach var="q" items="${questionListById}">
		<tbody>
			<tr align="center">
			
				<c:set var="boardNum" value="${boardNum}"/>
				<th scope="row">${boardNum}</th>
				<c:set var="boardNum" value="${boardNum-1}"/>		
			
				<c:if test="${q.quesubject eq 1}"><td>[상품]</td></c:if>
				<c:if test="${q.quesubject eq 2}"><td>[배송]</td></c:if>
				<c:if test="${q.quesubject eq 3}"><td>[주문및결제]</td></c:if>
				<c:if test="${q.quesubject eq 4}"><td>[회원]</td></c:if>
				<c:if test="${q.quesubject eq 5}"><td>[기타]</td></c:if>			
				<td><a
					href="${pageContext.request.contextPath}/board/questionView?num=${q.num}"
					style="color: black;">${q.quetitle}</a></td>
				<td><fmt:formatDate value="${q.regdate}" var="dateValue" pattern="yyyy-MM-dd HH:mm"/>${dateValue}</td>
				<td>
	<!-- 답변이 이미 달린 문의글은 답변완료버튼 보이게  -->		
				<c:forEach var="yy" items="${yy}">				
				<c:if test="${q.num eq yy.num }">
					<button class="btn btn-sm btn-outline-primary" disabled>      
					답변완료</button></c:if>
				</c:forEach></td>
			</tr>
		</tbody>
</c:forEach>
	</table>
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
				href="${pageContext.request.contextPath}/board/questionList?pageNum=${start-bottomLine+(bottomLine-1)}"          
				class="btn btn-sm btn-outline-primary">이전</a> 					<!-- 1페이지 아니라 5페이지로 이동하게  -->         
			</c:if>

		<!-- 현재 페이지 표시 -->
		<c:forEach var="p" begin="${start}" end="${end}">
			<a
				href="${pageContext.request.contextPath}/board/questionList?pageNum=${p}"
				class="btn <c:if test="${pageInt==p}"> btn-sm btn-outline-secondary </c:if> ml-3 mr-3">${p}</a>
		</c:forEach>

		<!-- 다음 버튼 -->
		<c:if test="${end >= maxPage}">
			<a href="#" class="btn btn-sm btn-outline-danger disabled">다음</a>
		</c:if>
		<c:if test="${end <  maxPage}">
			<a
				href="${pageContext.request.contextPath}/board/questionList?pageNum=${start+bottomLine}"
				class="btn btn-sm btn-outline-primary">다음</a>
		</c:if>
	</div>
	

</body>
</html>