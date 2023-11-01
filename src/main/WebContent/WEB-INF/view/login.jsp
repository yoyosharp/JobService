<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html lang="en">
<head">
<title>WORK CV - Sign in/ Sign up</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-light">
    <div class="container-fluid px-md-4">
      <a class="navbar-brand text-info" href="${pageContext.request.contextPath}/">Work CV</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="collapse navbar-collapse justify-content-end" id="ftco-nav">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item ">
            <a class="nav-link active text-info" aria-current="page" href="${pageContext.request.contextPath}/">Trang chủ</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-info" href="public/job-list">Công việc</a>
          </li>
          <c:if test="${userRole == 1}">
              <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle text-info" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Công ty
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="company/profile">Hồ sơ</a>
                    <a class="dropdown-item" href="company/recruitment-list">Danh sách bài đăng</a>
                    <a class="dropdown-item" href="company/add-recruitment">Đăng tin tuyển dụng</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                  </div>
              </li>
          </c:if>
          
          <c:if test="${userRole == 2}">
              <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle text-info" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Ứng viên
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="employee/profile">Hồ sơ</a>
                    <a class="dropdown-item" href="employee/saved-job">Công việc đã lưu</a>
                    <a class="dropdown-item" href="employee/applied-job">Công việc đã ứng tuyển</a>
                    <a class="dropdown-item" href="employee/followed-company">Công ty đã theo dõi</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                  </div>
              </li>
          </c:if>
          <li class="nav-item ml-lg-3">
              <c:choose>
                  <c:when test="${userName == null}">
                      <a class="nav-link" href="${pageContext.request.contextPath}/login">Đăng nhập/Đăng ký</a>
                  </c:when>
  
                  <c:when test="${userName != null}">
                      <div class="nav-link">
                          <img src="${pageContext.request.contextPath}/images/annonymous.jpg" alt="profile-pic"
                              style="border-radius: 50%; width: 20px; height: 20px;">
                      <span>${userName}</span></div>
                  </c:when>
              </c:choose>
          </li>
          
          
      </div>
    </div>
  </nav>
<!-- Navbar -->

<!-- Breadcrumbs -->
<div class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-start">
      <div class="col-md-12 text-center mb-5">
        <p class="breadcrumbs mb-0"><span class="mr-3"><a href="index.html">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span> Đăng nhập<span></span></p>
        <h1 class="mb-3 bread">Đăng nhập / Đăng kí</h1>
      </div>
    </div>
  </div>
</div>
<!-- Breadcrumbs -->

<!-- Toast messages -->
<c:if test="${registerMessage != null}">
  <c:if test="${registerMessage == 'success'}">
    <div class="toast" data-delay="2500" style="position:fixed; top: 100PX; right: 10PX;z-index: 2000;width: 300px">
      <script>
        swal({
          title: 'Đăng ký thành công!',
          icon: 'success',
          timer: 3000,
          buttons: true,
          type: 'success'
        })
      </script>
    </div>
  </c:if>

  <c:if test="${registerMessage != 'success'}">
    <div class="toast" data-delay="2500" style="position:fixed; top: 100PX; right: 10PX;z-index: 2000;width: 300px">
      <script>
        swal({
          title: 'Đăng ký thất bại!',
          /* text: 'Redirecting...', */
          icon: 'error',
          timer: 3000,
          buttons: true,
          type: 'error'
        })
      </script>
    </div>
  </c:if>
</c:if>

<c:choose>
  

  <c:when test="${registerMessage == ''}">
  </c:when>

  
</c:choose>

<!-- Toast messages -->
  

<!-- HOME -->
<section class="section-hero overlay inner-page bg-image" style="background-image: url('/images/hero_1.jpg');" id="home-section">
  <div class="container">
    <div class="row">
      <div class="col-md-7">
        <div class="custom-breadcrumbs mt-4">
          <a href="${pageContext.request.contextPath}/public/home">Trang chủ</a><span class="mx-2 slash">/</span>
          <span class="text-info"><strong>Đăng nhập</strong></span>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="site-section">
  <div class="container">
    <div class="row">
      <div class="col-lg-6">

        <h2 class="mb-4">Đăng nhập</h2>
        <form:form action="${pageContext.request.contextPath}/processLogin" method="post" class="p-4 border rounded">
          <div class="row form-group">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="text-black" for="fname">Email</label>
              <input type="email" id="fname" name="username" class="form-control" placeholder="Email" required>
            </div>
          </div>
          <div class="row form-group mb-4">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="text-black" for="fname">Mật khẩu</label>
              <input type="password" id="fname" name="password" class="form-control" placeholder="Mật khẩu" required>
            </div>
          </div>

          <div class="row form-group">
            <div class="col-md-12">
              <input type="submit" value="Đăng nhập" class="btn px-4 btn-primary text-white">
              <c:if test="${param.error != null}">
                <span class="text-danger ml-lg-3">Sai tài khoản hoặc mật khẩu!</span>
              </c:if>
            </div>
            
          </div>
        </form:form>
      </div>

      <div class="col-lg-6 mb-5">
        <h2 class="mb-4">Đăng kí</h2>
        <form:form action="${pageContext.request.contextPath}/register" modelAttribute="userModel" method="post" class="p-4 border rounded">
          <div class="row form-group">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="text-black" for="email">Email</label>
              <form:input type="email" path="email" cssClass="form-control" placeholder="Email"  />
              <form:errors path="email" cssClass="text-danger"></form:errors>
              <c:if test="${registerMessage == 'email-existed'}">
                <div class="text-danger">Email đã tồn tại trên hệ thống.</div>
              </c:if>
            </div>
          </div>

          <div class="row form-group">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="text-black" for="name">Họ và tên</label>
              <form:input type="text" path="name" cssClass="form-control" placeholder="Họ và tên"  />
              <form:errors path="name" cssClass="text-danger"></form:errors>
            </div>
          </div>

          <div class="row form-group">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="text-black" for="password">Mật khẩu</label>
              <form:input type="password" path="password" cssClass="form-control" placeholder="Mật khẩu" value="" />
              <form:errors path="password" cssClass="text-danger"></form:errors>
            </div>
          </div>
          <div class="row form-group mb-4">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="text-black" for="repeatPassword">Nhập lại mật khẩu</label>
              <form:input type="password" path="repeatPassword" cssClass="form-control" placeholder="Nhập lại mật khẩu" value="" />
              <c:if test="${registerMessage == 'password-not-match'}">
                <div class="text-danger">Xác nhận mật khẩu không khớp.</div>
              </c:if>
            </div>
          </div>
          <div class="row form-group">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="text-black" for="fname">Vai trò</label>
              <form:select cssClass="form-control" path="roleId" >
                <form:option value="" selected="true" disabled="true">Chọn vai trò</form:option>
                <form:option value="1">Nhà tuyển dụng</form:option>
                <form:option value="2">Người lao động</form:option>
              </form:select>
              <form:errors path="roleId" cssClass="text-danger"></form:errors>
            </div>
          </div>
          <div class="row form-group">
            <div class="col-md-12">
              <button type="submit" class="btn px-4 btn-primary text-white">Đăng ký</button>
            </div>
          </div>
        </form:form>
      </div>
      
    </div>
  </div>
</section>

<footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section">

</footer>
</body>
</html>