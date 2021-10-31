<%--
  Created by IntelliJ IDEA.
  User: HJ
  Date: 2021-10-31
  Time: 오후 6:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>


<html>
<head>
    <title>Title</title>

    <script>
        function register() {
            alert("회원가입 완료")
            $(location).attr("href", "/")
        }
    </script>
</head>
<body>
<form action="register" method="post">
    <label>EMAIL
        <input type="text" name="email" id="email">
    </label>
    <label>PASSWORD
        <input type="password" name="password" id="password">
    </label>
    <label>NAME
        <input type="text" name="name" id="name">
    </label>
    <button type="button" onclick="register()">회원가입</button>
</form>

</body>
</html>
