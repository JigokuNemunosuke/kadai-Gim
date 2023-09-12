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
		<link rel="stylesheet" href="./css/changeConfirm.css">
	</head>

	<body>
		<header>
			<div class="header-wrap">
				<!-- タイトル -->
				<section class="title">
					<h1>ジム会員システム</h1>
				</section>

				<ul class="header-nav">
					<li class="header-name">
						<c:out value="${customer.name }" />様
					</li>
					<li class="header-main">
						<a href="/Gym/MainServlet">メインメニューへ戻る</a>
					</li>
					<li class="header-logout">
						<a href="/Gym/MainServlet?action=logout">ログアウト</a>
					</li>
				</ul>
			</div>
		</header>
		
			<section class="menu-title">
				<h2>会員情報変更確認</h2>
			</section>

			<!-- エラーメッセージ -->
			<div class="error-msg">
				<c:if test="${ not empty errorMsg }">
					<p>${errorMsg}</p>
				</c:if>
			</div>

	<table class="change-confirm-table">
		<tr>
			<th><br></th>
			<th>変更前</th>
			<th>変更後</th>
			<tr>
				<th>会員名</th>
				<td><c:out value="${customer.name}" /></td>
				<td><c:out value="${changeCon.name}" /></td>
			</tr>
			<tr>
				<th>電話番号</th>
				<td><c:out value="${customer.telno}" /></td>
				<td><c:out value="${changeCon.telno}" /></td>
			</tr>
			<tr>
				<th>郵便番号</th>
				<td><c:out value="${customer.postalcode}" /></td>
				<td><c:out value="${changeCon.postalcode}" /></td>
			</tr>
			<tr>
				<th>住所</th>
					<td><c:out value="${customer.address}" /></td>
					<td><c:out value="${changeCon.address}" /></td>
			</tr>
			<tr>
				<th>会員区分</th>
					<td><c:out value="${customer.rank}" /></td>
					<td><c:out value="${changeCon.rank}" /></td>
			</tr>
	</table>
	
			<form action="/Gym/ChangeServlet" method="get">
				<input type="hidden" name="action" value="done">
				<input type="hidden" name="name" value="${changeCon.name}" />
				<input type="hidden" name="telno" value="${changeCon.telno}" />
				<input type="hidden" name="postalcode" value="${changeCon.postalcode}" />
				<input type="hidden" name="address" value="${changeCon.address}" />
				<input type="hidden" name="rank" value="${changeCon.rank}" />

				<div class="btn-wrap">
					<button type="button" class="btn-back" onclick="location.href='/Gym/ChangeServlet'">変更画面に戻る</button>
					<button type="submit" class="btn-change">変更</button>
				</div>
			</form>
	<hooter>
		<div class="end"></div>
	</hooter>
	</body>
</html>