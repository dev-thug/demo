<%@ page import="com.example.demo.vo.User" %><%--
  Created by IntelliJ IDEA.
  User: HJ
  Date: 2021-11-01
  Time: 오후 4:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <title>Title</title>


    <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
    <script>

        function myItem() {

            $.ajax({
                type: "get",
                dataType: "text",
                url: "items",
                success: function (response) {
                    var html = "<div>"
                    $.each(JSON.parse(response), function (index, item) {

                        // html += "</div style='width: 25px; height: 25px; overflow: hidden'><img src='" + item.mainImg + "' style='width: 25px; height: auto; display: block; margin: 0 auto;'></div>"

                        html += "<p><span>" + item.part + " : </span><span>" + item.name + "</span><span>" + item.price + "</span></p>"
                    })
                    html += "</div>"
                    $("#items").empty()
                    $("#items").append(html);

                }
            })
        }

        function completedItem() {
            $.ajax({
                type: "put",
                url: "completed",
                success: function (response) {
                    alert("구매 완료")
                    tts("총 주문 금액은 " + response + "원 입니다.")
                    $("#items").empty()
                }
            })
        }


        function addItem(foodId) {
            $.ajax({
                type: "post",
                url: "item",
                data: {foodId: foodId},
                success: function () {
                    myItem()
                }
            })

        }


        function foods(part) {

            $.ajax({
                type: "get",
                dataType: "text",
                url: "food",
                data: {part: part},
                success: function (response) {
                    var html = "<div class='row'>"
                    $.each(JSON.parse(response), function (index, item) {

                        html += "<div class='col-xs-6 col-sm-4 col-md-3 col-lg-3'>"
                        html += "<div class='card shadow mb-4'>"
                        html += "<div class='card-header py-3 d-flex flex-row align-items-center justify-content-between'>"
                        html += "<h6 class='m-0 font-weight-bold text-primary'>" + item.name + "\t :" + item.price + "원" + "</h6>"
                        html += "</div>"
                        html += "<div class='card-body'>"
                        html += "<div class='chart-area'>"
                        html += "<div class='chartjs-size-monitor'>"
                        html += "<div class='chartjs-size-monitor-expand'>"
                        html += "<div class=''></div>"
                        html += "</div>"
                        html += "<div class='chartjs-size-monitor-shrink'>"
                        html += "<div class=''></div>"
                        html += "</div>"
                        html += "</div style='width: 300px; height: 350px; overflow: hidden'>"
                        html += "<img src='" + item.mainImg + "' style='width: 300px; height: auto; display: block; margin: 0 auto;'>"
                        html += "</div>"
                        html += "</div>"
                        html += "<div class='addItem'>"
                        html += "<c:if test='${! empty user}'>"
                        html += "<a class='btn btn-primary btn-user btn-block' value=" + item.id + " a='" + item.name + "'>"
                        html += "<input type='hidden' name=" + item.name + "/>"
                        html += "장바구니에 담기</a>"
                        html += "</c:if>"
                        html += "</div></div></div>"

                    })
                    html += "</div>"
                    $("#foods").empty()
                    $("#foods").append(html);
                }


            })
        }

        $(document).on("click", ".addItem a", function () {
            var foodId = $(this).attr("value")
            var name = $(this).attr("a")
            console.log(name.toString())

            addItem(foodId)
            tts(name + " 메뉴가 장바구니에 추가 되었습니다.")

        })

        $(document).ready(function () {
            foods("후식")
            myItem()


        });

        $(document).on("click", ".part li", function () {
            var title = $(this).attr("value")
            foods($(this).attr("value"))
            $("#mainTitle").text(title)

        })


        function logout() {
            var logout = confirm("로그아웃 하시겠습니까?");
            if (logout == true) {
                location.href = "/logout"
            }

        }

        function tts(text) {
            if (text) {
                $.post('../tts', {text}, function (data) {
                    let audio = new Audio("../media/" + data + ".mp3")
                    audio.play();

                });
            }

        }


    </script>

</head>
<body>
<%--<ul class="part">--%>
<%--    <c:forEach var="part" items="${parts}">--%>
<%--        <li value="${part}"><a>${part}</a></li>--%>
<%--    </c:forEach>--%>
<%--</ul>--%>

<div id="wrapper">
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion part" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">음식 주문</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">


        <!-- Nav Item - Dashboard -->
        <c:if test="${empty user}">
            <li class="nav-item active">
                <a class="nav-link" href="<c:url value="/login" />">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>로그인</span></a>
            </li>
        </c:if>

        <c:if test="${! empty user}">
            <li class="nav-item active">
                <a class="nav-link">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>${user.name}님 환영합니다.</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" onclick="logout()" style="cursor:hand;">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>로그아웃</span></a>
            </li>
        </c:if>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            분류 선택
        </div>
        <c:forEach var="part" items="${parts}">
            <li class="nav-item" value="${part}">
                <a class="nav-link" style="cursor: pointer">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>${part}</span></a>
            </li>

        </c:forEach>
        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">
    </ul>

    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content" style="margin-top: 50px">


            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800" id="mainTitle">후식</h1>

                </div>


                <!-- Content Row -->

                <div id="foods">

                    <!-- Area Chart -->
                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">음식명</h6>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-area">
                                    <div class="chartjs-size-monitor">
                                        <div class="chartjs-size-monitor-expand">
                                            <div class=""></div>
                                        </div>
                                        <div class="chartjs-size-monitor-shrink">
                                            <div class=""></div>
                                        </div>
                                    </div>
                                    <img src="#" alt="" height="250px" width="250px">
                                </div>
                            </div>

                            <div>
                                <a class="btn btn-primary btn-user btn-block">
                                    장바구니에 담기
                                </a>
                            </div>
                        </div>
                    </div>


                    <%--                <div class="col-sm-6 col-md-4 col-xl-2 col-lg-2">--%>
                    <%--                    <div class="card shadow mb-4">--%>
                    <%--                        <!-- Card Header - Dropdown -->--%>
                    <%--                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">--%>
                    <%--                            <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>--%>
                    <%--                        </div>--%>
                    <%--                        <!-- Card Body -->--%>
                    <%--                        <div class="card-body">--%>
                    <%--                            <div class="chart-area"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>--%>
                    <%--                                <canvas id="myAreaChart" style="display: block; height: 320px; width: 535px;" width="802" height="480" class="chartjs-render-monitor"></canvas>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <%--                </div>--%>

                </div>


            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <c:if test="${! empty user}">
            <div class="row" style="display: flex; align-content: center; position: fixed; bottom: 0; width: 100%">
                <div style="width: 20%"></div>

                <div class="col-xl-6 col-md-6 mb-6" id="demo" class="collapse">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        내 장바구니
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800" id="items">

                                        <p><span>음식이름</span></p>
                                        <p><span>음식이름</span></p>
                                        <p><span>음식이름</span></p>
                                        <p><span>음식이름</span></p>

                                    </div>
                                </div>
                                <div class="col-auto">
                                    <a href="#" class="btn btn-success btn-circle btn-lg" onclick="completedItem()">
                                        <i class="fas fa-check"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>


        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright © Your Website 2021</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>

    <%--<div id="foods">--%>

    <%--</div>--%>

</div>
</body>
</html>
