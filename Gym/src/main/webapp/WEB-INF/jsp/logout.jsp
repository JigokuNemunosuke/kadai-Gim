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
		<link rel="stylesheet" href="./css/logout.css">
	</head>
    
    <body>
        <div class="logout-msg">
            <p>ログアウトしました。</p>
            <p>ご利用ありがとうございました。</p>
        </div>
        <button type="button" class="btn-index" onclick="location.href='/Gym/LoginServlet'">ログイン画面へ</button>
        <hooter>
            <div class="end"></div>
        </hooter>
    </body>
</html>