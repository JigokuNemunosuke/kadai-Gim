<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://yubinbango.github.io/yubinbango/yubinbango.js" charset="UTF-8"></script>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ジム会員システム</title>
		<link rel="stylesheet" href="./css/reset.css">
		<link rel="stylesheet" href="./css/destyle.css">
		<link rel="stylesheet" href="./css/default.css">
		<link rel="stylesheet" href="./css/change.css">
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
				<li class="header-main">
					<a href="/Gym/MainServlet">メインメニューへ戻る</a>
				</li>
				<li class="header-logout">
					<a href="/Gym/MainServlet?action=logout">ログアウト</a>
				</li>
			</ul>
		</header>

		<section class="menu-title">
			<h2>会員情報変更</h2>
		</section>

		<section class="change-caution">
			<p>会員区分は、毎月28日0:00時点で設定されている区分が翌月1日から適用になります。<br>
				月の途中での変更はできませんので、ご注意ください。<br>
			</p>
		</section>

		<!-- エラーメッセージ -->
		<div class="error-msg">
			<c:if test="${ not empty errorMsg }">
				<p>${errorMsg}</p>
			</c:if>
		</div>

		<form action="/Gym/ChangeServlet" method="post" class="h-adr">
			<input type="hidden" class="p-country-name" value="Japan">
			<input type="hidden" name="code" value="${customer.code}">
			
			<table class="change-table">
				<tr>
					<th>会員名</th>
					<td><c:out value="${customer.name}" /></td>
					<td><input type="text" name="name" class="textbox name" maxlength="32" placeholder="${customer.name}"></td>
				</tr>
				
				<tr>
					<th>電話番号</th>
					<td><c:out value="${customer.telno}" /></td>
					<td><input type="text" name="telno" class="textbox telno" maxlength="13" placeholder="${customer.telno}"></td>
				</tr>

				<tr>
					<th>郵便番号</th>
					<td><c:out value="${customer.postalcode}" /></td>
					<td><input type="text" name="postalcode" class="textbox p-postal-code" maxlength="8" placeholder="${customer.postalcode}"></td>
				</tr>

				<tr>
					<th>住所</th>
					<td><c:out value="${customer.address}" /></td>
					<td><input type="text" name="address" class="textbox p-region p-locality p-street-address p-extended-address" size="30" maxlength="40" placeholder="${customer.address}"></td>
				</tr>

				<tr>
					<th>会員区分</th>
					<td><c:out value="${customer.rank}" /></td>
					<td><select name="rank" class="textbox rank">
						<option value="${customer.rank}">選択して下さい</option>
						<option value="フルタイム">フルタイム</option>
						<option value="ナイトタイム">ナイトタイム</option>
						<option value="ホリデー">ホリデー</option>
					</select></td>
				</tr>
			</table>

			<div class="btn-wrap">
				<button type="button" class="btn-back" onclick="location.href='/Gym/MainServlet'">戻る</button>
				<button type="submit" class="btn-check">確認</button>
			</div>
		</form>
		
	<hooter>
		<div class="end"></div>
	</hooter>
	</body>
</html>