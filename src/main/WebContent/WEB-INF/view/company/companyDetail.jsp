<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head
">
<title>Work CV</title>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport">

<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700&display=swap" rel="stylesheet">

<!-- CSS -->
<link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/css/open-iconic-bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/css/animate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/css/owl.carousel.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/css/owl.theme.default.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/css/magnific-popup.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/css/aos.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/css/ionicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-datepicker.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/css/jquery.timepicker.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/css/flaticon.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/css/icomoon.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-grid.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-reboot.css" rel="stylesheet">
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

<div class="hero-wrap hero-wrap-2"
     data-stellar-background-ratio="0.5"
     style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');" th:if="${session.user.role.id == 2 }">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a
                        href="${pageContext.request.contextPath}/">Trang chủ <i
                        class="ion-ios-arrow-forward"></i></a></span>Danh sách <span></span></p>
                <h1 class="mb-3 bread">Danh sách bài đăng</h1>
            </div>
        </div>
    </div>
</div>

<div class="hero-wrap hero-wrap-2"
     data-stellar-background-ratio="0.5"
     style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-start mb-5">
                <h2 class="text-white">Thông tin công ty</h2>
                <div class="row bg-light p-3 border rounded mb-4">
                    <div class="col-md-8">
                        <ul class="list-unstyled pl-3 mb-0">
                            <li class="mb-2"><strong class="text-black">Tên công ty: </strong>
                                <span>${company.name}</span></li>
                            <li class="mb-2"><strong class="text-black">Địa chỉ: </strong>
                                <span>${company.address}</span></li>
                            <li class="mb-2"><strong class="text-black">Số điện thoại: </strong> <span">${company.phoneNumber}</span>
                            </li>
                            <li class="mb-2"><strong class="text-black">Email: </strong> <span>${company.email}</span>
                            </li>
                            <li class="mb-2"><strong class="text-black">Số bài đăng: </strong>
                                <span>${company.totalJob}</span></li>
                            <li class="mb-2"><strong class="text-black">Mô tả công ty: </strong>
                                <textarea class="form-control" cols="30" id="" name="" readonly rows="3">${company.description}</textarea>
                            </li>
                        </ul>
                    </div>

                    <div class="col-md-4 align-item-center justify-content-center">
                        <img alt="" src="${pageContext.request.contextPath}${company.logo}"
                             style="width: 250px; border-radius: 50%;">
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 pr-lg-4">
                <div class="row mb-3">
                    <h3>Danh sách bài tuyển dụng: </h3>
                    <security:authorize access="hasRole('EMPLOYER')">
                        <div class="col-lg-12 text-end">
                            <a class="btn px-4 btn-primary text-white"
                               href="${pageContext.request.contextPath}/company/add-recruitment">Đăng tuyển</a>
                        </div>
                    </security:authorize>
                </div>

                <div class="row form-group">
                    <c:if test="${fn:length(recruitments) == 0}">
                        <h4 class="ml-4 mb-3">Chưa có bài đăng</h4>
                    </c:if>
                </div>
                <c:forEach items="${recruitments}" var="recruitment">

                    <div class="col-md-12">
                        <div class="job-post-item p-4 d-block d-lg-flex align-items-center justify-content-start">
                            <div class="mb-4 mb-md-0">
                                <div class="job-post-item-header align-items-start">
                                    <span class="subadge">${recruitment.type.name}</span>
                                    <form:form action="${pageContext.request.contextPath}/company/recruitment-detail" method="post">
                                        <input name="recruitmentId" type="hidden" value="${recruitment.id}">
                                        <h2 class="mr-3 text-dark">
                                          <button class="mt-2" style="border: none; background: none; padding: 0; cursor: pointer;" type="submit">${recruitment.title}</button>
                                        </h2>
                                    </form:form>
                                </div>
                                <div class="job-post-item-body d-block d-md-flex">
                                    <form:form action="${pageContext.request.contextPath}/company/recruitment-list"
                                               method="post">
                                        <div class="mr-3">
                                            <span class="icon-layers"></span>
                                            <input type="hidden" value="${recruitment.company.id}">
                                            <button class="btn-light" style="border: none;
                                    background: none;
                                    padding: 0;"
                                                    type="submit"
                                            > ${recruitment.company.name}
                                            </button>
                                            <span class="icon-my_location"></span><span> ${recruitment.address}</span><br>
                                            <span class="icon-people_outline"></span><span> ${recruitment.quantity}</span>
                                            <span class="icon-money ml-3"></span><span> ${recruitment.salary}</span><br>
                                            <span class="icon-tasks"></span><span> ${recruitment.category.name}</span>
                                        </div>
                                    </form:form>
                                </div>
                            </div>

                            <security:authorize access="hasRole('EMPLOYER')">
                                <form:form action="${pageContext.request.contextPath}/company/update-recruitment"
                                           method="post">
                                    <input name="recruitmentId" type="hidden" value="${recruitment.id}">
                                    <button class="btn btn-warning py-2 ml-2" type="submit">Cập nhật</button>
                                </form:form>
                                <button class="btn btn-danger py-2 ml-2" data-target="#deleteModal${recruitment.id}" data-toggle="modal"
                                        href="">Xóa
                                </button>
                            </security:authorize>
                        </div>
                    </div>

                    <!-- Modal delete -->
                    <div aria-hidden="true" aria-labelledby="exampleModalLabel" class="modal fade" id="deleteModal${recruitment.id}"
                         role="dialog" tabindex="-1">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn xóa ?</h5>
                                    <button aria-label="Close" class="close" data-dismiss="modal" type="button">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Bài đăng : <span> ${recruitment.title}</span>
                                    <form:form action="${pageContext.request.contextPath}/company/delete-recruitment"
                                               method="post">
                                        <input id="id" name="recruitmentId" type="hidden" value="${recruitment.id}">
                                        <div class="modal-footer mt-1">
                                            <button class="btn btn-secondary" data-dismiss="modal" type="button">Đóng
                                            </button>
                                            <button class="btn btn-danger" type="submit">Xóa</button>
                                        </div>
                                    </form:form>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- Modal delete -->

                </c:forEach>

            </div>
        </div>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-end">

                <c:if test="${pageIndex > 1}">
                    <li class="page-item previous">
                        <a aria-label="Previous" class="page-link" href="#">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach begin="1" end="${pageIndex - 1}" var="page">
                    <li class="page-item"><a class="page-link page-selector" href="#">${page}</a></li>
                </c:forEach>
                <li class="page-item disabled"><a class="page-link" href="#">${pageIndex}</a></li>
                <c:forEach begin="${pageIndex + 1}" end="${maxPageCount}" var="page">
                    <li class="page-item"><a class="page-link page-selector" href="#">${page}</a></li>
                </c:forEach>

                <c:if test="${pageIndex < maxPageCount}">
                    <li class="page-item next">
                        <a aria-label="Next" class="page-link" href="#">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </c:if>

            </ul>
        </nav>
    </div>
</section>
<input id="companyId" type="hidden" value="${company.id}">

<c:if test="${deleteMessage != null}">
    <c:if test="${deleteMessage == 'success'}">
        <div class="toast" data-delay="2500" style="position:fixed; top: 100PX; left: 10PX;z-index: 2000;width: 300px">
            <script>
                swal({
                    title: 'Thành công!',
                    /* text: 'Redirecting...', */
                    icon: 'success',
                    timer: 3000,
                    buttons: true,
                    type: 'success'
                })
            </script>
        </div>
    </c:if>

    <c:if test="${deleteMessage == 'hasAppliedUser'}">
        <div class="toast" data-delay="2500" style="position:fixed; top: 100PX; left: 10PX;z-index: 2000;width: 300px">
            <script>
                swal({
                    title: 'Bài đăng đang có người ứng tuyển!',
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


<script>
    var paginations = document.querySelectorAll(".page-selector");
    paginations.forEach(function(link) {
      link.addEventListener("click", function(event) {
        event.preventDefault();
  
        var page = link.textContent;
        var companyId = document.getElementById("companyId").value;
        var contextPath = "<%=request.getContextPath()%>";
        
        if (window.FormData !== undefined) {   
          var formData = new FormData();
          formData.append('companyId', companyId);
          formData.append('page', page);
            
          $.ajax({
            type: 'POST',
            url: contextPath + '/company/recruitment-list', 
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
              document.open();
              document.write(response);
              document.close();
            },
            error: function(error) {
            }
          });
        }     
      })
    });

</script>

</footer>
</body>
</html>