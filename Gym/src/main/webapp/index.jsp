<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 文字コード -->
    <meta charset="UTF-8">
    <!-- Edge向けの設定 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 検索エンジンにインデックス -->
    <meta name="robots" content="index">
    <!-- 閲覧端末ごとに表示領域を適用 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ページの説明 -->
    <meta name="description" content="ジム会員システムは、インターネットで登録情報の変更やスクールの予約ができる、会員様向けのサイトです。"/>
    <title>ジム会員システム</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/destyle.css">
    <link rel="stylesheet" href="./css/default.css">
    <link rel="stylesheet" href="./css/index.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Zen+Kaku+Gothic+Antique:wght@500&display=swap');
    </style>

</head>
<body>
    <div class="index-contents">
        <!-- タイトル -->
        <section class="title">
                <h1>ジム会員システム</h1>
        </section>

        <!-- エラーメッセージ -->
        <div class="error-msg">
            <c:if test="${not empty loginErrorMsg}">
                <p>${loginErrorMsg}</p>
            </c:if>
        </div>
        
        <!-- フォーム -->
        <div class="form-wrap2">
            <div class="form-wrap">
                <form action="/Gym/LoginServlet" method="post">
                <div class="code">
                    <label for="code">会員番号</label><br>
                    <div class="code-form">
                        <input type="text" name="code" id="code"><br>
                    </div>
                </div>
                <div class="pass">
                    <label for="pass">パスワード</label><br>
                    <div class="pass-form">
                        <input type="password" name="pass" id="pass"><br>
                    </div>
                </div>
                <div class="submit">
                    <input type="submit" value="ログイン">
                </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>