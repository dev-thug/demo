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
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <script>
        function logout() {
            var logout = confirm("로그아웃 하시겠습니까?");
            if (logout == true) {
                location.href = "/logout"
            }

        }


    </script>
</head>
<body>
<%--<c:if test="${empty user}">--%>
<%--    <p>--%>
<%--        <a href="<c:url value="/login" />">로그인</a>--%>
<%--    </p>--%>
<%--    <p>--%>
<%--        <a href="<c:url value="/register" />">회원가입</a>--%>
<%--    </p>--%>

<%--</c:if>--%>
<%--<c:if test="${! empty user}">--%>
<%--    <p>${user.name}님 환영합니다.</p>--%>
<%--    <p>--%>
<%--        <a onclick="logout()">로그아웃</a>--%>
<%--    </p>--%>
<%--</c:if>--%>

<c:import url="food.jsp">
    <c:param name="parts" value="${parts}"></c:param>
</c:import>
</body>
</html>
