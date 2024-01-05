<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head">
    <title>Work CV</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

<c:if test="${addMessage != 'null'}">
    <c:if test="${addMessage == 'success'}">
        <div class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
        <script>
            swal({
                title: 'Chỉnh sửa thành công!',
                icon: 'success',
                timer: 3000,
                buttons: true,
                type: 'success'
            })
        </script>
        </div>
    </c:if>

    <c:if test="${addMessage == 'failed'}">
        <div class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
        <script>
            swal({
                title: 'Chỉnh sửa không thành công!',
                icon: 'error',
                timer: 3000,
                buttons: true,
                type: 'error'
            })
        </script>
        </div>
    </c:if>
</c:if>



<div class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5" th:if="${session.user.role.id == 2 }">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="${pageContext.request.contextPath}/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span> Chỉnh sửa<span></span></p>
                <h1 class="mb-3 bread">Chỉnh sửa bài đăng</h1>
            </div>
        </div>
    </div>
</div>



<section class="site-section">
    <div class="container">
    <form:form action="${pageContext.request.contextPath}/company/updateRecruitment" method="post" modelAttribute="recruitmentModel">
        <div class="row align-items-center mb-5">
            <div class="col-lg-8 mb-4 mb-lg-0">
                <div class="d-flex align-items-center">
                    <div>
                        <h2>Chỉnh sửa bài đăng</h2>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="row justify-content-end">
                    <div class="col-6">
                        <button type="submit" class="btn btn-block btn-primary btn-md">Cập nhật</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mb-5">
            <div class="col-lg-12">
                <div class="p-4 p-md-5 border rounded" method="post">
                    <h3 class="text-black mb-5 border-bottom pb-2">Chi tiết bài tuyển dụng</h3>

                    <div class="form-group">
                        <label for="email">Tiêu đề</label>
                        <form:input type="text" cssClass="form-control" id="email" path="title" placeholder="Tiêu đề"
                        value="${recruitmentModel.title == null? recruitment.title : recruitmentModel.title}"></form:input>
                        <form:errors cssClass="text-danger" path="title"></form:errors>
                    </div>
                    <div class="form-group">
                        <label for="job-location">Mô tả công việc</label>
                        <form:textarea path="description" cssClass="form-control" id="editorN" placeholder="Mô tả"
                        value="${recruitmentModel.description == null? recruitment.description : recruitmentModel.description}"></form:textarea>
                    </div>
                    <div class="form-group">
                        <label for="job-title">Kinh nghiệm</label>
                        <form:input type="text" cssClass="form-control" id="job-title" path="experience" placeholder="Kinh nghiệm"
                        value="${recruitmentModel.experience == null? recruitment.experience : recruitmentModel.experience}"></form:input>
                    </div>
                    
                    <div class="form-group">
                        <label for="job-title">Số người cần tuyển</label>
                        <form:input type="number" cssClass="form-control" id="job-title" path="quantity" placeholder="Số người cần tuyển"
                        value="${recruitmentModel.quantity == null? recruitment.quantity : recruitmentModel.quantity}"></form:input>
                        <form:errors cssClass="text-danger" path="quantity"></form:errors>
                    </div>
                    <div class="form-group">
                        <label for="job-location">Địa chỉ</label>
                        <form:input type="text" cssClass="form-control" id="job-location"  path="address" placeholder="Địa chỉ công ty"
                        value="${recruitmentModel.address == null? recruitment.address : recruitmentModel.address}"></form:input>
                    </div>
                    <div class="form-group">
                        <label for="job-location">Hạn ứng tuyển</label>
                        <form:input type="date" cssClass="form-control" id="job-location" path="deadline" placeholder="Hạn ứng tuyển"
                        value="${recruitmentModel.deadline == null? recruitment.deadline : recruitmentModel.deadline}"></form:input>
                    </div>
                    <div class="form-group">
                        <label for="job-location">Lương</label>
                        <form:input type="text" cssClass="form-control" id="job-location"  path="salary" placeholder="Mức lương"
                        value="${recruitmentModel.salary == null? recruitment.salary : recruitmentModel.salary}"></form:input>
                        <form:errors cssClass="text-danger" path="salary"></form:errors>
                    </div>

                    <div class="form-group">
                        <label for="job-region">Loại công việc</label>
                        <form:select cssClass="form-control" path="typeId" aria-label="Default select example" >
                            <option value="${recruitment.type.id}" selected readonly>${recruitment.type.name}</option>
                            <c:forEach var = "type" items="${types}">
                                <option value="${type.id}">${type.name}</option>
                            </c:forEach>
                        </form:select>
                        <form:errors cssClass="text-danger" path="typeId"></form:errors>
                    </div>
                    <div class="form-group">
                        <label for="job-region">Danh mục công việc</label>
                        <form:select cssClass="form-control" path="categoryId" aria-label="Default select example" >
                            <option value="${recruitment.category.id}" selected readonly>${recruitment.category.name}</option>
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.id}">${category.name}</option>
                            </c:forEach>

                        </form:select>
                        <form:errors cssClass="text-danger" path="categoryId"></form:errors>
                    </div>
                </div>
            </div>

        </div>
        <div class="row align-items-center mb-5">

            <div class="col-lg-4 ml-auto">
                <div class="row justify-content-end">
                    <div class="col-6">
                        <button type="submit" class="btn btn-block btn-primary btn-md">Cập nhật</button>
                    </div>
                </div>
            </div>
        </div>
    </form:form>
    </div>
</section>
<script>
    ClassicEditor.create(document.querySelector('#editorN')).then(eidt => {
        console.log("da" + eidt);
    })
        .catch(error => {
            console.error(error);
        });
</script>
<footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section">

</footer>
</body>
</html>