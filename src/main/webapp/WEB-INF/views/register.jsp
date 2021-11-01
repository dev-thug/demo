<%--
  Created by IntelliJ IDEA.
  User: HJ
  Date: 2021-10-31
  Time: 오후 6:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
        function register() {
            if ($("#email").val().length === 0 | $("#password").val().length === 0 | $("#name").val().length === 0) {
                alert("데이터를 입력해주세요")
            } else {
                var queryString = $("form[name=registerForm]").serialize();
                $.ajax({
                    type: "post",
                    dataType: "text",
                    url: "register",
                    data: queryString,
                    success: function () {
                        alert("회원가입 성공");
                        autoLogin()
                    }
                    ,
                    error: function () {
                        alert("회원가입 실패")
                    }

                })
            }

        }

        function autoLogin() {

            $.ajax({
                type: "post",
                dataType: "text",
                url: "login",
                data: {
                    email: $("#email").val(),
                    password: $("#password").val()
                },
                success: function () {

                    $(location).attr("href", "/")
                }

            })
        }


    </script>
</head>
<body class="bg-gradient-primary">
<%--<form method="post" name="registerForm">--%>
<%--    <label>EMAIL--%>
<%--        <input type="text" name="email" id="email">--%>
<%--    </label>--%>
<%--    <label>PASSWORD--%>
<%--        <input type="password" name="password" id="password">--%>
<%--    </label>--%>
<%--    <label>NAME--%>
<%--        <input type="text" name="name" id="name">--%>
<%--    </label>--%>
<%--    <input type="button" onclick="register()" value="회원가입"/>--%>
<%--</form>--%>


<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                        </div>
                        <form class="user" method="post" name="registerForm">
                            <div class="form-group row">
                                <input type="text" class="form-control form-control-user" name="name" id="name"
                                       placeholder="이름">

                            </div>
                            <div class="form-group row">
                                <input type="text" class="form-control form-control-user" name="email" id="email"
                                       placeholder="이메일">

                            </div>
                            <div class="form-group row">
                                <input type="password" class="form-control form-control-user" name="password"
                                       id="password"
                                       placeholder="비밀번호">

                            </div>
                            <input type="button" class="btn btn-primary btn-user btn-block" onclick="register()"
                                   value="회원가입"/>


                        </form>
                        <hr>

                        <div class="text-center">
                            <a class="small" href="login">이미 계정이 있다면 로그인</a>
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
