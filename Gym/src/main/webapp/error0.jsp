<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ジム会員システム</title>
		<link rel="stylesheet" href="./css/reset.css">
		<link rel="stylesheet" href="./css/destyle.css">
		<link rel="stylesheet" href="./css/default.css">
		<link rel="stylesheet" href="./css/error.css">
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
				<h2>システムエラー</h2>
			</section>

			<!-- エラーメッセージ -->
            <div class="error-msg">
                <c:if test="${ not empty SystemErrorMsg }">
	                <p>${SystemErrorMsg}</p>
                </c:if>
            </div>
    <button type="button" class="btn-index" onclick="location.href='/Gym/LoginServlet'">ログイン画面へ</button>
    <hooter>
        <div class="end"></div>
    </hooter>
    </body>
</html>