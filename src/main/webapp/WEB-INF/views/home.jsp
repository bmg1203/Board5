<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css">
<link rel="icon" type="image/png" href="./img/favicon.png">
</head>
<style>
	h2 {
		color: #ff81a3;
	}
	
	#menu, #user, #board {
		display: flex;
		margin: 0;
	}
	#title {
		font-weight: bold;
		font-size: large;
		color: #656565;
	}
	h2 {
		font-weight: bold;
	}
	a {
		margin-right: 10px;
	}
	hr {
		border-width: 3px;
	}
</style>
<body>
	<main>
		<h2 class="stroke">Home</h2>
		<div id="title">메뉴 옵션</div>
		<hr style="color: #dbb1ff">
		<div id="menu">
			<a class="btn btn-outline-primary" href="/Menus/WriteForm">새 메뉴 추가</a>
			<a class="btn btn-outline-primary" href="/Menus/WriteForm2">새 메뉴 추가 2</a>
			<a class="btn btn-outline-primary" href="/Menus/List">메뉴 목록</a>
		</div>	
		<div>&nbsp;</div>
		
		<div id="title">사용자 옵션</div>	
		<hr style="color: #ffb1b1">
		<div id="user">
			<div><a class="btn btn-outline-primary" href="/Users/List">사용자 목록</a></div>
			<div><a class="btn btn-outline-primary" href="/Users/WriteForm">사용자 추가</a></div>
		</div>
		<div>&nbsp;</div>
		
		<div id="title">게시물 옵션</div>
		<hr style="color: #9ee2ff">
		<div id="board">
			<div><a class="btn btn-outline-primary" href="/Board/List?menu_id=MENU01"">게시물 목록</a></div>
			<div><a class="btn btn-outline-primary" href="/Board/WriteForm?menu_id=MENU01">게시물 등록</a></div>
			<div><a class="btn btn-outline-primary" href="/Board/WriteForm2?menu_id=MENU01">게시물 등록2</a></div>
		</div>
	</main>
</body>
</html>