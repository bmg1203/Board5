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
   
   
	
	/*td:not([colspan]):first-child, td:not([colspan]):nth-child(3){
		font-weight: bold;
	}
	
	tr:not(tr:last-child) > td:last-child, td:nth-child(2) {
		text-align: left;
	}
	tr:nth-child(4) {height: 250px;}*/
}
	
</style>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
</head>
<body>
	<main>
		<%@include file="/WEB-INF/include/menus.jsp"%>
		<h2>게시물 내용 조회</h2>
			<table id="writeform">
				<tr>
					<td>글번호</td>
					<td>${boardVo.bno}</td>
					<td>조회수</td>
					<td>${boardVo.hit}</td>
				</tr>
				<tr>
					<td>작성자, 메뉴</td>
					<td>
						<span>${boardVo.writer}, </span>
						<span>${boardVo.menu_id}</span>
					</td>
					<td>작성일</td>
					<td>${boardVo.regdate}</td>
				</tr>
				<!-- <tr>
					<td>제목</td>
					<td>${boardVo.title}</td>
					<td>메뉴</td>
					<td>${boardVo.menu_id}</td>
				</tr>-->
				<tr>
					<td>제목</td>
					<td colspan="3">${boardVo.title}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3">${boardVo.content}</td>
				</tr>
				<tr>
					<td colspan="4">
						<a class="btn btn-primary btn-sm" href="/Board/WriteForm" role="button">새 글 쓰기</a>
						<a class="btn btn-primary btn-sm" href="/Board/WriteForm2?menu_id=${boardVo.menu_id}" role="button">새 글 쓰기2</a>
						<a class="btn btn-primary btn-sm" href="/Board/UpdateForm?bno=${boardVo.bno}&menu_id=${boardVo.menu_id}" role="button">글 수정</a>
						<a class="btn btn-danger btn-sm" href="/Board/Delete?bno=${boardVo.bno}&menu_id=${boardVo.menu_id}" role="button">글 삭제</a>
						<a class="btn btn-primary btn-sm" href="/Board/List?menu_id=${boardVo.menu_id}" role="button">게시물 목록</a>
						<a class="btn btn-outline-dark btn-sm" href="javascript:history.back()" role="button">이전으로</a>
						<a class="btn btn-outline-dark btn-sm" href="/" role="button">home</a>
					</td>
				</tr>
			</table>
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