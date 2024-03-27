<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css">
<link rel="icon" type="image/png" href="/img/favicon.png">
<style>
	td {
		padding: 10px;
		width: 700px;
		text-align: center;
	}
	td:not([colspan]):first-child {
		background-color: black;
		color: white;
		font-weight: bold;
	}
	td:nth-of-type(1) {
		width: 200px;
	}
	input:not(input[type=submit], input[type=button]) {
		width: 100%;
	}
	input[type=submit], input[type=button] {
		width: 100px;
	}
	
	input[readonly] {
		background: #ebebeb;
	}
	
	tr:not(tr:last-child) > td:last-child {
		text-align: left;
	}
	
</style>
</head>
<body>
	<main>
		<h2>게시물 상세 정보</h2>
			<table>
				<tr>
					<td>글번호</td>
					<td>${boardVo.bno}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${boardVo.title}</td>
				</tr>
				<tr>
					<td>메뉴</td>
					<td>${boardVo.menu_id}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${boardVo.writer}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${boardVo.content}</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${boardVo.regdate}</td>
				</tr>
				<tr>
					<td>조회수</td>
					<td>${boardVo.hit}</td>
				</tr>
				<tr>
					<td colspan="2">
						<a class="btn btn-primary btn-sm" href="/Board/WriteForm" role="button">새 글 쓰기</a>
						<a class="btn btn-primary btn-sm" href="/Board/WriteForm" role="button">새 글 쓰기2</a>
						<a class="btn btn-primary btn-sm" href="/Board/UpdateForm?bno=${boardVo.bno}" role="button">글 수정</a>
						<a class="btn btn-danger btn-sm" href="/Board/Delete?bno=${boardVo.bno}" role="button">글 삭제</a>
						<a class="btn btn-primary btn-sm" href="/Board/List?menu_id=MENU01" role="button">게시물 목록</a>
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