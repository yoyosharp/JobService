<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Work CV - Home</title>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700&display=swap" rel="stylesheet">

  <!-- CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/open-iconic-bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animate.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/owl.carousel.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/magnific-popup.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/aos.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/ionicons.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-datepicker.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/jquery.timepicker.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/flaticon.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/icomoon.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-grid.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-reboot.css">
  <!-- JS -->
  <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.bundle.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/aos.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/scrollax.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
  <script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container-fluid px-md-4">
        <a class="navbar-brand text-info" href="${pageContext.request.contextPath}/public/home">Work CV</a>
        <button aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler"
                data-target="#ftco-nav" data-toggle="collapse" type="button">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="ftco-nav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item ">
                    <a aria-current="page" class="nav-link active text-info"
                       href="${pageContext.request.contextPath}/public/home">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-info" href="${pageContext.request.contextPath}/public/jobList">Việc làm</a>
                </li>

                <security:authorize access="hasRole('EMPLOYER')">
                    <li class="nav-item dropdown">
                        <a aria-expanded="false" aria-haspopup="true" class="nav-link dropdown-toggle text-info" data-toggle="dropdown"
                           href="#" id="navbarDropdown" role="button">
                            Tuyển dụng
                        </a>
                        <div aria-labelledby="navbarDropdown" class="dropdown-menu">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/profile">Hồ sơ</a>
                            <c:choose>
                                <c:when test="${user.companyId == 0}">
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/user/profile">Cập
                                        nhật công ty</a>
                                </c:when>
                                <c:when test="${user.companyId != 0}">
                                    <a class="dropdown-item"
                                       href="${pageContext.request.contextPath}/company/recruitment-list">Danh sách bài
                                        đăng</a>
                                    <a class="dropdown-item"
                                       href="${pageContext.request.contextPath}/company/add-recruitment">Đăng tin tuyển
                                        dụng</a>
                                </c:when>
                            </c:choose>

                            <div class="dropdown-divider"></div>
                            <form:form action="${pageContext.request.contextPath}/logout">
                                <input class="dropdown-item" type="submit" value="Đăng xuất">
                            </form:form>
                        </div>
                    </li>
                </security:authorize>

                <security:authorize access="hasRole('EMPLOYEE')">
                    <li class="nav-item dropdown">
                        <a aria-expanded="false" aria-haspopup="true" class="nav-link dropdown-toggle text-info" data-toggle="dropdown"
                           href="#" id="navbarDropdown" role="button">
                            Ứng viên
                        </a>
                        <div aria-labelledby="navbarDropdown" class="dropdown-menu">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/profile">Hồ sơ</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/applied-job">Công
                                việc đã ứng tuyển</a>
                            <div class="dropdown-divider"></div>
                            <form:form action="${pageContext.request.contextPath}/logout">
                                <input class="dropdown-item" type="submit" value="Đăng xuất">
                            </form:form>
                        </div>
                    </li>
                </security:authorize>

                <li class="nav-item ml-lg-3">
                    <security:authorize access="hasRole('ANONYMOUS')">
                        <a class="nav-link" href="${pageContext.request.contextPath}/login">Đăng nhập/Đăng ký</a>
                    </security:authorize>

                    <security:authorize access="hasRole('USER')">
                        <div class="nav-link">
                            <img alt="profile-pic" src="${pageContext.request.contextPath}${user.image}"
                                 style="border-radius: 50%; width: 20px; height: 20px;">
                            <span>${user.name}</span></div>
                    </security:authorize>
                </li>


        </div>
    </div>
</nav>
<!-- Navbar -->

<div th:if="${success}" class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
    <script>
        swal({
            title: 'Xóa thành công!',
            /* text: 'Redirecting...', */
            icon: 'success',
            timer: 3000,
            buttons: true,
            type: 'success'
        })
    </script>
</div>
<!-- END nav -->
<div class="hero-wrap hero-wrap-2" style="background-image: url('user/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5" th:if="${session.user.role.id == 1 }">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Công ty <span></span></p>
                <h1 class="mb-3 bread">Danh sách công ty đã theo dõi</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section bg-light" th:if="${session.user.role.id == 1 }">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 pr-lg-5">
                <div th:if="${saveJobList.totalPages > 0}" class="row">
                    <th:block th:each="saveJob : ${saveJobList.content}">
                        <div class="col-md-12 ">
                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                                <div class="one-third mb-4 mb-md-0">
                                    <div class="job-post-item-header align-items-center">
<!--                                        <span class="subadge" th:text="${saveJob.com.type}"></span>-->
                                        <h2 class="mr-3 text-black" ><a th:text="${saveJob.company.nameCompany}" th:href="${'/user/detail-company/'}+${saveJob.company.id}"></a></h2>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers"></span> <a href="#" th:text="${saveJob.company.email}" ></a></div>
                                        <div class="mr-3"><span class="icon-my_location"></span> <span th:text="${saveJob.company.address}"></span></div>
                                        <div style="margin-left: 10"><span class="icon-my_location"></span> <span th:text="${saveJob.company.phoneNumber}"></span></div>
                                    </div>
                                </div>
                                <input type="hidden" th:id="${'idRe'}+${saveJob.company.id}" th:value="${saveJob.company.id}">
                                <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0" style="width:370px !important;">
                                    <div>
                                        <a  th:href="${'/user/delete-follow/'}+${saveJob.id}" class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
                                            <span class="icon-delete"></span>
                                        </a>
                                    </div>
                                    <a th:href="${'/user/detail-company/'}+${saveJob.company.id}" class="btn btn-primary py-2">Chi tiết</a>
                                    <a th:href="${'/user/company-post/'}+${saveJob.company.id}" class="btn btn-warning py-2 ml-1">Danh sách bài đăng</a>
                                </div>
                            </div>
                        </div><!-- end -->
                    </th:block>

                </div>
                <div style="text-align: center" th:if="${saveJobList.totalPages < 1}">
                    <p style="color:red;">Danh sách trống</p>
                </div>
                <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                            <ul>
                                <li th:if="${numberPage>0}"><a th:href="@{/save-job/get-list(page = ${saveJobList.number - 1})}">&lt;</a></li>
                                <th:block th:each="recruitment,state  : ${recruitmentList}">
                                    <li th:class="${numberPage == state.index  ? 'active' : null }"><a th:href="@{/save-job/get-list(page = ${state.index})}" th:text="${state.index + 1}"></a></li>
                                </th:block>
                                <li th:if="${numberPage<saveJobList.totalPages - 1}"><a th:href="@{/save-job/get-list(page = ${saveJobList.number + 1})}">&gt;</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
<script>
    function save(id){
        var name = "#idRe" +id;
        var idRe = $(name).val();
        var formData = new FormData();
        formData.append('idRe', idRe);
        $.ajax(
            {
                type: 'POST',
                url: '/save-job/save/',
                contentType: false,
                processData: false,
                data: formData,
                success: function (data) {
                    if(data == "false"){
                        swal({
                            title: 'Bạn cần phải đăng nhập!',
                            /* text: 'Redirecting...', */
                            icon: 'error',
                            timer: 3000,
                            buttons: true,
                            type: 'error'
                        })
                    }else if(data == "true"){
                        swal({
                            title: 'Lưu thành công!',
                            /* text: 'Redirecting...', */
                            icon: 'success',
                            timer: 3000,
                            buttons: true,
                            type: 'success'
                        })
                    }else{
                        swal({
                            title: 'Bạn đã lưu bài này rồi!',
                            /* text: 'Redirecting...', */
                            icon: 'error',
                            timer: 3000,
                            buttons: true,
                            type: 'error'
                        })
                    }
                },
                error: function (err) {
                    alert(err);
                }
            }
        )
    }
</script>




<footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section">

</footer>


<!-- loader -->
<!--<div th:replace="public/fragments :: loading" id="ftco-loader" class="show fullscreen"></div>-->

</body>
</html>