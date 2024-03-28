<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css">
<link rel="icon" type="image/png" href="/img/favicon.png">
<style>
table {      
      width: 800px;      
   }

#writeform {
	td {
     text-align :center;
     padding :10px;
     
    &:nth-of-type(1) { 
     	width : 150px; 
       background-color : black;
       color            : white; 
    }
    &:nth-of-type(2) { width: 250px;  }
    &:nth-of-type(3) { 
     	width: 150px; 
      background-color: black;
      color: white;
    }
     &:nth-of-type(4) { width: 250px;  }    
  }
   
  tr:nth-of-type(4) td[colspan] {
   	height: 250px;
   	width: 600px;   
   	text-align: left;
   	vertical-align: baseline;
  }
   
  tr:last-child td {
   	background-color: white;
   	color: black;   
  }
  
  input[type=text], textarea {
  	width: 100%;
  }
  
  textarea {
  	height: 245px;
  }
}
	
</style>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
</head>
<body>
	<main>
		<%@include file="/WEB-INF/include/menus.jsp"%>
		<h2>게시물 내용 수정</h2>
			<form action="/Board/Update" method="post">
				<input type="hidden" name="bno" value="${boardVo.bno}">
				<input type="hidden" name="menu_id" value="${boardVo.menu_id}">
				<table id="writeform">
					<tr>
						<td>글번호</td>
						<td>${boardVo.bno}</td>
						<td>조회수</td>
						<td>${boardVo.hit}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${boardVo.writer}</td>
						<td>작성일</td>
						<td>${boardVo.regdate}</td>
					</tr>
					<tr>
						<td>제목</td>
						<td colspan="3">
							<input type="text" name="title" value="${boardVo.title}">
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3">
							<textarea name="content">${boardVo.content}</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<input class="btn btn-primary btn-sm" type="submit" value="수정">
							<a class="btn btn-primary btn-sm" href="/Board/List?menu_id=${boardVo.menu_id}" role="button">목록</a>
							<a class="btn btn-outline-dark btn-sm" href="javascript:history.back()" role="button">이전으로</a>
							<a class="btn btn-outline-dark btn-sm" href="/" role="button">home</a>
						</td>
					</tr>
				</table>
			</form>
	</main>
</body>

<!-- <script>
	const goListEl = document.getElementById("goList");
	
	goListEl.addEventListener('click', function(e) {
		//alert("Ok");
		location.href = '/Users/List';
	});
</script> -->

</html>