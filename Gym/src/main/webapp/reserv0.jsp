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
		<link rel="stylesheet" href="./css/reserv.css">
	</head>

	<body>

		<header>
			<div class="header-wrap">
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
				<h2>スクール予約</h2>
			</section>
			<div class="error-msg">
				<c:if test="${ not empty errorMsg }">
					<p>${errorMsg}</p>
				</c:if>
			</div>

			<section class="section1">
				<h3 class="about-title">ヨガスクール</h3>
				<figure class="about">
					<div class="img-set">
						<img class="yoga-img" src="./css/img/yoga1.jpg" alt="ヨガの画像1" />
						<img class="yoga-img" src="./css/img/yoga2.jpg" alt="ヨガの画像2" />
						<img class="yoga-img" src="./css/img/yoga3.jpg" alt="ヨガの画像3" />
					</div>
					<figcaption class="about-caption">
						<p>当ジムでは、毎日3回・無料のヨガスクールを実施しています。<br>
							持ち物などは特にありませんので、手ぶらでOK！<br>
							簡単で挑戦しやすいポーズから始めますので、運動前・運動後のストレッチに最適です。<br>
							前日までのご予約で、下記のフォームからいつでもお申込み可能ですので、是非ご参加ください！！<br>
						</p>
						<br>
						<p>時間：毎日　11時・14時・18時<br>
							場所：レクリエーションルーム1<br>
							１コマ30分間<br>
							※開始5分前にルームに集合してください。
						</p>
					</figcaption>
				</figure>
			</section>
			<!-- Calendly inline widget begin -->
			<div class="calendly-inline-widget contents-left" data-url="https://calendly.com/gymsystem/fitness?hide_event_type_details=1" style="min-width:320px;height:630px;"></div>
			<script type="text/javascript" src="https://assets.calendly.com/assets/external/widget.js" async></script>
			<!-- Calendly inline widget end -->
			
		<hooter>
			<div class="end"></div>
		</hooter>
	</body>
</html>