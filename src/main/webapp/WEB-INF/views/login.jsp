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

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
    <script>

        function login() {
            if ($("#email").val().length === 0 | $("#password").val().length === 0) {
                alert("데이터를 입력해주세요")
            } else {
                var queryString = $("form[name=loginForm]").serialize();
                $.ajax({
                    type: "post",
                    dataType: "text",
                    url: "login",
                    data: queryString,
                    success: function () {
                        alert("로그인 성공");
                        $(location).attr("href", "/")
                    }
                    ,
                    error: function () {
                        alert("로그인 실패")
                    }

                })
            }
        }


    </script>

</head>
<body>
<%--<form name="loginForm" method="post">--%>
<%--    <label>EMAIL--%>
<%--        <input type="text" name="email" id="email" minlength="1">--%>
<%--    </label>--%>
<%--    <label>PASSWORD--%>
<%--        <input type="password" name="password" id="password" minlength="1">--%>
<%--    </label>--%>

<%--    <input type="button" onclick="login()" value="로그인"/>--%>

<%--</form>--%>


<body class="bg-gradient-primary">

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">로그인</h1>
                                </div>
                                <form class="user" name="loginForm" method="post">
                                    <div style="height: 80px">
                                    </div>

                                    <div class="form-group">
                                        <input type="email" class="form-control form-control-user"
                                               id="email" name="email" aria-describedby="emailHelp"
                                               placeholder="Enter Email Address...">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user"
                                               id="password" name="password"
                                               placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                    </div>
                                    <input type="button" onclick="login()" value="로그인"
                                           class="btn btn-primary btn-user btn-block"/>


                                </form>
                                <hr>

                                <div class="text-center">
                                    <a class="small" href=<c:url value="/register"/>>계정 만들기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

</body>
</html>
