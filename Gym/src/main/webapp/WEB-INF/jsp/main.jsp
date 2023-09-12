<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ジム会員システム</title>
		<link rel="stylesheet" href="./css/reset.css">
		<link rel="stylesheet" href="./css/destyle.css">
		<link rel="stylesheet" href="./css/default.css">
		<link rel="stylesheet" href="./css/main.css">
	</head>

	<body>
		<header class="header-wrap">
				<!-- タイトル -->
				<section class="title">
					<h1>ジム会員システム</h1>
				</section>

				<ul class="header-nav">
					<li class="header-name">
						<c:out value="${customer.name }" />
						<span class="sama">様</span>
					</li>
					<li class="header-logout">
						<a href="/Gym/MainServlet?action=logout">ログアウト</a>
					</li>
				</ul>
		</header>
		
		<section class="menu-title">
			<h2>メインメニュー</h2>
		</section>

		<!-- エラーメッセージ -->
		<div class="error-msg">
			<c:if test="${ not empty errorMsg }">
				<p>${errorMsg}</p>
			</c:if>
		</div>
		<div>
			<form action="/Gym/ConfirmServlet" method="get">
				<button type="submit" class="reset btn-menu btn-confirm">会員情報確認</button>
			</form>
		</div>
		<div>
			<form action="/Gym/ChangeServlet" method="get">
				<button type="submit" class="reset btn-menu btn-change">会員情報変更</button>
			</form>
		</div>
		<div>
			<form action="/Gym/ReservServlet" method="get">
				<button type="submit" class="reset btn-menu btn-reserv">スクール予約</button>
			</form>
		</div>
		<hooter>
			<div class="end"></div>
		</hooter>
	</body>
</html>