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
		<link rel="stylesheet" href="./css/changeDone.css">
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
						<c:out value="${customer.name }" />
						<span class="sama">様</span>
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
				<h2>会員情報変更完了</h2>
			</section>

			<!-- エラーメッセージ -->
			<div class="error-msg">
				<c:if test="${ not empty errorMsg }">
					<p>${errorMsg}</p>
				</c:if>
			</div>

<p class="done-msg">会員情報を更新しました。</p>

	<table class="change-done-table">
		<tr>
			<th>会員番号</th>
			<td><c:out value="${customer.code}" /></td>
		</tr>
		<tr>
			<th>会員名</th>
			<td><c:out value="${customer.name}" /></td>
		</tr>
		<tr>
			<th>電話番号</th>
			<td><c:out value="${customer.telno}" /></td>
		</tr>
		<tr>
			<th>郵便番号</th>
			<td><c:out value="${customer.postalcode}" /></td>
		</tr>
		<tr>
			<th>住所</th>
			<td><c:out value="${customer.address}" /></td>
		</tr>
		<tr>
			<th>入会日</th>
			<td><c:out value="${customer.startdate}" /></td>
		</tr>
		<tr>
			<th>会員区分</th>
			<td><c:out value="${customer.rank}" /></td>
		</tr>
		<tr>
			<th>ステータス</th>
			<td><c:out value="${customer.status}" /></td>
		</tr>
	</table>
	<button type="button" class="btn-main" onclick="location.href='/Gym/MainServlet'">メインメニューへ</button>
	<hooter>
		<div class="end"></div>
	</hooter>
</body>
</html>