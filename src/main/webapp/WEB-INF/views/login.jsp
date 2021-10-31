<%--
  Created by IntelliJ IDEA.
  User: HJ
  Date: 2021-10-31
  Time: 오후 6:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="login" method="post">
    <label>EMAIL
        <input type="text" name="email">
    </label>
    <label>PASSWORD
        <input type="password" name="password">
    </label>

    <button type="submit">로그인</button>
</form>
</body>
</html>
