<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글: ${question.num}</title>
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
	<div class="container"><h3 class="display-4 text-center m-5"> 관리자전용 문의글 답변 페이지 입니다. </h3></div>
	<div class="row ">	
	<div class="col">
	
	
			<div class="mb-3">
			<label for="subject">카테고리</label>
				<c:if test="${question.quesubject eq 1}"><input class="form-control" type="text" value="[상품]" disabled></c:if>
				<c:if test="${question.quesubject eq 2}"><input class="form-control" type="text" value="[배송]" disabled></c:if>
				<c:if test="${question.quesubject eq 3}"><input class="form-control" type="text" value="[주문및결제]" disabled></c:if>
				<c:if test="${question.quesubject eq 4}"><input class="form-control" type="text" value="[회원]" disabled></c:if>
				<c:if test="${question.quesubject eq 5}"><input class="form-control" type="text" value="[기타]" disabled></c:if>
			</div>
			
			
			<div class="mb-3">	
				<label for="name">작성자</label>
				<input type="text" class="form-control" value="${question.id}" disabled>
			</div>
			<div class="mb-3">	
				<label for="name">작성일</label>
				<input type="text" class="form-control" 
				<fmt:formatDate value="${question.regdate}" var="dateValue" pattern="yyyy-MM-dd HH:mm"/>
				value="${dateValue}" disabled>
			</div>			
			<div class="mb-3">
				<label for="title">제목</label>
				<input type="text" class="form-control" value="${question.quetitle}" disabled>
			</div>
			<div class="mb-3">
				<label for="content">내용</label>
				<textarea class="form-control" rows="15" disabled>${question.quecontent}</textarea>
			</div>
			
			<c:choose>	
			<c:when test="${question.queimage eq null || question.queimage eq ' '}">
			<div class="mb-3">
				<label for="image"></label>
				<input type="text" class="form-control" value="[사진등록을 하지 않았습니다]" disabled>
			</div></c:when>
			
			<c:otherwise>
			<div class="mb-3">
			<img class="mb-3 text-center" alt="첨부사진"
					src="${pageContext.request.contextPath}/view/board/images/${question.queimage}" width="50%"  />

			</div></c:otherwise>	
			</c:choose>

<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  	<button class="btn btn-outline-dark" type="button"
  	onclick="location.href='${pageContext.request.contextPath}/board/questionDeleteForm?num=${question.num}'">
  	문의글 삭제</button>
  	

<!-- admin일때는 questionManagement로 돌아가게 만들기, 아닐경우 questionList로 돌아가기  -->
	<c:choose>
	<c:when test="${id eq 'admin'}">
  		<button class="btn btn-outline-warning" type="button"
  		onclick="location.href='${pageContext.request.contextPath}/board/questionManagement?pageNum=${pageInt}'">
  		목록으로 돌아가기</button>	</c:when>
	<c:otherwise>
  		<button class="btn btn-outline-warning" type="button" id="button"
  		onclick="location.href='${pageContext.request.contextPath}/board/questionList?pageNum=${pageInt}'">
  		목록으로 돌아가기</button>	</c:otherwise>
	</c:choose>

</div>
</div>



<!-- 관리자 답변 -->
<div class="col">

<!-- 구분선  -->
<hr role="diviner" />
<br>
<br>


<form action="${pageContext.request.contextPath}/board/insertQuestionCommentPro" 
									method="post" onsubmit="return checkForm()">							
<input type="hidden" name="num" value="${question.num}">
	<!-- 답변 입력칸 -->
	<div class="mb-3 row">
  		<textarea class="form-control " id="textarea" rows="5"
  		cols="30" name="textarea" 
        oninput='this.style.height = ""; this.style.height = this.scrollHeight + "px"' 
        style="resize: none; padding: 8px; max-height: 300px; margin-right: 10px;"
        placeholder="답변을 작성하세요"
  		></textarea>
  	<!-- 답변 입력 버튼 -->
   		<input type="submit" class="btn btn-outline-dark" value="답변 입력"
   		style="margin-top: 10px ;padding: 4px 6px; ">
	</div>
</form>

<form action="${pageContext.request.contextPath}/board/questionCommentDeletePro" method="post" >
	<!-- 입력된 답변 출력 -->
	<c:forEach var="qc" items="${qc}">
<input type="hidden" name="ser" value="${qc.ser}">
<input type="hidden" name="num" value="${question.num}">	
 	<div class="mb-3 row fst-italic">
		<textarea class="form-control" rows="5" id="text" style="resize: none" disabled>${qc.content}</textarea>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end mt-1">
		<fmt:formatDate value="${qc.regdate}" var="dateValue" pattern="yyyy-MM-dd HH:mm"/>${dateValue}</div>
	</div>
	</c:forEach>
	<!-- 답변 삭제 버튼 -->	
	<div class="mb-3 row">
		<button class="btn btn-outline-danger" type="submit">답변 삭제</button>
	</div>
</form>	
	
	
</div>
</div>
	<br>
	<br>
	<hr role="diviner" />
	<br>
	<br>
</div>



<script>
    var isCommentEntered = false; // 댓글 입력 여부를 저장하는 변수

    //페이지 로드 시 실행되는 함수
    window.onload = function() {
        var content = document.getElementById('text');
        if (content.textContent.trim() !== "") {
            alert("답글이 이미 입력되었습니다.");
            isCommentEntered = true; // 이미 댓글이 입력되었다고 표시
        }
    }

    function checkForm() {
        //이미 댓글이 입력되었다면 입력을 막음
        if (isCommentEntered) {
            alert("답글이 이미 입력되었습니다.");
            return false;
        }

        //댓글입력하지않고 '답변입력'누르면 실행안되게.
        if (document.getElementById('textarea').value.trim() == "") {
            alert("입력을 완료하십시오");
            return false;
        }

        return true; // 댓글 입력 및 빈 입력 상황이 아니면 제출 허용
    }
</script>

</body>
</html>