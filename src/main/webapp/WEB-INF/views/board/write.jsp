<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	textarea {
		width: 100%;
		height: 100px;
		overflow-y: scroll;
	}
	tr:nth-child(2) > td:nth-child(2) {
		text-align: left;
	}
	tr:nth-child(3) > td:nth-child(2) {
		text-align: left;
	}
</style>
</head>
<body>
	<main>
		<%@include file="/WEB-INF/include/menus.jsp"%>
		<h2>새글 등록</h2>
		<form action="/Board/Write" method="post">
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td>메뉴</td>
					<td>
						<select name="menu_id">
							<option value="">===선택===</option>
							<c:forEach var="menu" items="${menuList}">
								<option value="${menu.menu_id}" name="${menu.menu_id}">${menu.menu_name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
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
						<input type="submit" value="작성">
						<input type="button" value="목록" id="goList">
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