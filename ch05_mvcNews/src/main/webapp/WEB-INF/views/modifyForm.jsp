<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<script type="text/javascript">
window.onload=function(){
	const myForm = document.getElementById('modify_form');
	myForm.onsubmit=function(){
		let items = document.querySelectorAll('.input-check');
		for(let i=0;i<items.length;i++){
			if(items[i].value.trim()==''){
				let label = document.querySelector('label[for="'+items[i].id+'"]');
				let label_text = label.textContent;
				/*
				받침 유무에 따라 조사 처리
				한글은 초성 19개, 중성 21개, 종성 28개로 구성
				
				한글은 유니코드로 표시하면 0,28,56 ... 번째 글자는 종성이 없음. 따라서 28로 나누어서 0이면 종성이 없음
				label text의 마지막 문자 유니코드에서 '가'의 유니코드를 뺀 값을 28로 나누었을 때,
				나머지 값이 0보다 크면 종성(받침)이 있는 것임
				charCodeAt(index) index에 해당하는 문자의 유니코드 반환
				*/
				let post = (label_text.charCodeAt(label_text.length-1) - '가'.charCodeAt(0)) % 28 > 0 ? '은' : '는';
				alert(label_text + post + ' 필수 입력');
				items[i].value = '';
				items[i].focus();
				return false;
			}	
		}
	};
};
</script>                     
</head>
<body>
<div class="page-main">
    <h2>뉴스 수정</h2>
	<form id="modify_form" action="modify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${newsVO.num}">
    	<ul>
    		<li>
    			<label for="title">제목</label>
    			<input type="text" name="title"
    			       id="title" size="30" value="${newsVO.title}"
    			       maxlength="50" class="input-check">
    		</li>
    		<li>
    			<label for="writer">작성자</label>
    			<input type="text" name="writer"
    			       id="writer" size="10" value="${newsVO.writer}"
    			       maxlength="10" class="input-check">
    		</li>
    		<li>
    			<label for="passwd">비밀번호</label>
    			<input type="password" name="passwd"
    			       id="passwd" size="12"
    			       maxlength="12" class="input-check">
    		</li>
    		<li>
    			<label for="email">이메일</label>
    			<input type="email" name="email"
    			       id="email" size="30" value="${newsVO.email}"
    			       maxlength="50" class="input-check">
    		</li>
    		<li>
    			<label for="article">내용</label>
    			<textarea rows="5" cols="40" name="article"
    			       id="article" class="input-check">${newsVO.article}</textarea>
    		</li>
    		<li>
    			<label for="filename">사진</label>
    			<input type="file" name="filename" id="filename"
    			 accept="image/gif,image/png,image/jpeg">
    			 <br>
    			<img src="${pageContext.request.contextPath}/upload/${newsVO.filename}" width="100" style="margin-left:125px;">
    		</li>
    	</ul> 
    	<div class="align-center">
    		<input type="submit" value="수정">
    		<input type="button" value="목록"
    		    onclick="location.href='list.do'">
    	</div>                           
	</form>
</div>
</body>
</html>






