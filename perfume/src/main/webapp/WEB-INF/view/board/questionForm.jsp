<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 작성</title>

</head>
<body>
	<div class="container">
		<form method="post" action="${pageContext.request.contextPath}/board/questionPro"
		enctype="multipart/form-data" onsubmit="return blankchk();">
		
		
			<div class="mt-3 mb-3">
				<!-- 게시글 종류 선택 -->
				<select class="form-select" aria-label="카테고리" name="selectSubject" id="selectSubject">
				  <option selected>게시글 종류 선택</option>
				  <option value="1">상품</option>
				  <option value="2">배송</option>
				  <option value="3">주문및결제</option>
				  <option value="4">회원</option>
				  <option value="5">기타</option>
				</select>
			</div>
			
			
			<div class="mb-3">			
				<p>작성자: ${member.id}</p>
			</div>
			<div class="mb-3">
				<label for="title">제목</label>
				<input type="text" class="form-control" name="title" id="title">
			</div>
			<div class="mb-3">
				<label for="content">내용</label>
				<textarea class="form-control" cols="30" rows="10" name="content" id="content"
				oninput='this.style.height = ""; this.style.height = this.scrollHeight + "px"' 
        		style="resize: none; max-height: 300px; "></textarea>
			</div>
			<div class="mb-3">
				<label for="image">사진 첨부</label>
				<input class="form-control" type="file" name="f" id="image">
			</div>
			
			<div class="text-center">
			<button type="submit" class="btn btn-outline-dark" id="subBtn">
				<i class="fa-solid fa-pencil"></i> 등록
			</button>
			
			<button type="button" class="btn btn-outline-danger"
			onclick="location.href='${pageContext.request.contextPath}/home/index'">
				홈으로 돌아가기
			</button>
			
			</div>
		</form>
	</div>
	
	<script>
      function blankchk() {
    	if(		document.getElementById( 'selectSubject' ).value != 1 && 
    			document.getElementById( 'selectSubject' ).value != 2 && 
    			document.getElementById( 'selectSubject' ).value != 3 && 
    			document.getElementById( 'selectSubject' ).value != 4 && 
    			document.getElementById( 'selectSubject' ).value != 5) {
        	alert("문의글 종류를 선택해주세요.")
          	return false;
        }
    	  
    	if(document.getElementById( 'title' ).value.trim() == "") {
        	alert("제목을 입력해주세요.")
        	return false;
        }
        else if(document.getElementById( 'content' ).value.trim() == "") {
        	alert("내용을 입력해주세요.")
        	return false;
        }
        else return true;
      }
    </script>
	
</body>
</html>

    
    
    
    