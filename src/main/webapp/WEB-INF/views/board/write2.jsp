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
 #writeform {
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
		
		textarea {
			width: 100%;
			height: 250px;
			overflow-y: scroll;
		}
		tr:nth-child(2) > td:nth-child(2) {
			text-align: left;
		}
		tr:nth-child(3) > td:nth-child(2) {
			text-align: left;
		}
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
</head>
<body>
	<main>
		<%@include file="/WEB-INF/include/menus.jsp"%>
		<h2>새글 등록2</h2>
		<form action="/Board/Write2" method="post">
			<!-- menu_id를 넘기기 위해서 input의 hidden 사용 -->
			<input type="hidden" value="${menu_id}" name="menu_id">
			<table id="writeform">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title"></td>
				</tr>
				<!-- <tr>
					<td>메뉴</td>
					<td name="menu_id" value="${menu_id}">
						${menu_id}
					</td>
					<td><input type="hidden" value="${menu_id}" name="menu_id"></td>
				</tr> -->
				<tr>
					<td>작성자</td>
					<td>
						<select name="writer">
							<option value="">===선택===</option>
							<c:forEach var="user" items="${userList}">
								<option value="${user.userid}" name="${user.userid}">${user.userid}</option>
							</c:forEach>
						</select>
					</td>
					<!-- <td><input type="text" name="writer"></td> -->
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content"></textarea></td>
				</tr>
				<tr>
					<td colspan="4">
						<input class="btn btn-primary" type="submit" value="작성">
						<input type="button" class="btn btn-primary" value="목록" id="goList">
						<a class="btn btn-dark" href="/" value="home">home</a>
					</td>
				</tr>
			</table>
		</form>
	</main>
</body>

<script>
	const goListEl = document.getElementById("goList");
	
	goListEl.addEventListener('click', function(e) {
		//alert("Ok");
		location.href = '/Board/List?menu_id=MENU01';
	});
</script>

</html>