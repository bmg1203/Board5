<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	//JSTL(JSP Standard Tag Library) c:forEach를 위한 설치
	//%를 사용해서도 반복문 등을 적용 가능하지만 JSTL을 사용해 편리성을 높임
	//c로 시작하는 문법은 url의 문법으로 해석해라 라는 뜻
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/list.jsp</title>
<link rel="stylesheet" href="/css/common.css">
<link rel="icon" type="image/png" href="/img/favicon.png">
<style>
	#board {
		td {
			padding: 10px;
			/*width: 150px;*/
			text-align: center;
		}
		
		tr:first-child {
			background-color: black;
			color: white;
			font-weight: bold;
			/*scss 문법을 이용한 표현(script로 설치 필요)*/
			td{
				border-color: #9ee2ff;
				text-align: center;
			}
			
		}
		/* tr 안에 td를 사용하려면 추가 적인 설정이 필요 아니면 그냥 원래 css 처럼 아래와 같이 사용 */
		/* tr:first-child > td {border-color: white}  */
		
		/*적용 안됨*/
		tr:nth-child(2) td {
	     text-align: right;
	  }
	  
	  td:nth-child(1) {	width: 80px; }
	  td:nth-child(2) {	
	  	width: 340px;
	  	text-align: left; 
	  }
	  td:nth-child(3) {	width: 100px; }
	  td:nth-child(4) {	width: 150px; }
	  td:nth-child(5) {	width: 80px; }
  }
</style>
<!-- css내부에 css적용할 수 있는 scss 문법 적용 -->
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
</head>
<body>
	<!-- jstl(java standard tag library)를 사용해 목록을 출력 - c:foreach -->
	<main>
		<%@include file="/WEB-INF/include/menus.jsp"%>
	
		<h2>게시물 목록</h2>
		<table id="board">
			<tr>
				<td>글번호</td>
				<td>글제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<tr>
				<td colspan="5">
					[<a href="/Board/WriteForm">새 글 추가</a>]
					&nbsp;&nbsp;&nbsp;
					[<a href="/Board/WriteForm2?menu_id=${menu_id}">새 글 추가2</a>]
					&nbsp;&nbsp;&nbsp;
					[<a href="/">home</a>]
				</td>
			</tr>
			<!-- 추가 후 menuList를 부를 때 빈값이 넘어오는 오류로 insert도 모델을 사용하도록 수정 -->
			<c:forEach var="boardVo" items="${boardList}"> <!-- menuList를 할 때 forEach는 무시지만 %는 오류이기 때문에 forEach 사용 -->
				<tr>
					<td>${boardVo.bno}</td>
					<td>
						<a href="/Board/View?bno=${boardVo.bno}">
							${boardVo.title}
						</a>
					</td>
					<td>${boardVo.writer}</td>
					<td>${boardVo.regdate}</td>
					<td>${boardVo.hit}</td>
					<!-- <td><a href="/Menus/Delete?menu_id=${menuVo.menu_id}">삭제</a></td>
					<td><a href="/Menus/UpdateForm?menu_id=${menuVo.menu_id}">수정</a></td> -->
				</tr>
			</c:forEach>
		</table>
	</main>
</body>
</html>