<%--
  Created by IntelliJ IDEA.
  User: HJ
  Date: 2021-10-30
  Time: 오후 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${empty user}">
    <p>
        <a href="<c:url value="/login" />">로그인</a>
    </p>
    <p>
        <a href="<c:url value="/register" />">회원가입</a>
    </p>
</c:if>
<c:if test="${! empty user}">
    <p>${user.name}님 환영합니다.</p>
</c:if>
</body>
</html>
