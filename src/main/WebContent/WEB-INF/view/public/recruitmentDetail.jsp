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


<div class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="${pageContext.request.contextPath}/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Chi tiết <span></span></p>
                <h1 class="mb-3 bread">Chi tiết công việc</h1>
            </div>
        </div>
    </div>
</div>

<section style="margin-top: 10px" class="site-section">
    <div class="container">
        <div class="row align-items-center mb-5">
            <div class="col-lg-8 mb-4 mb-lg-0">
                <div class="d-flex align-items-center">
                    <div class="border p-2 d-inline-block mr-3 rounded">
                        <img width="100" height="100" src="${pageContext.request.contextPath}/${recruitment.company.logo}" alt="logo">
                    </div>
                    <div>
                        <h3>${recruitment.company.name}</h3>
                        <p>${recruitment.title}</p>
                    </div>
                </div>
            </div>
            <security:authorize access="hasRole('EMPLOYEE')">
                <div class="col-lg-4">
                    <div class="row">
                        <div class="col-6">
                            <a class="btn btn-block btn-light btn-md"><span class="icon-heart-o mr-2 text-danger"></span>Lưu</a>
                        </div>
                        <div class="col-6">
                            <a data-toggle="modal" data-target="#modal" class="btn btn-primary py-2">Ứng tuyển</a>
                        </div>
                    </div>
                </div>
            </security:authorize>
            <!-- Modal -->
            <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalLabel">Ứng tuyển: <span>${recruitment.title}</span></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form class="applyForm">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-12">
                                        <select id="submitTypeSelect${recruitment.id}" class="submitTypeSelect form-control" aria-label="Default select example">
                                            <option selected>Chọn phương thức nộp</option>
                                            <option value="1">Dùng cv đã cập nhật</option>
                                            <option value="2">Nộp cv mới</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row my-2 mx-3" id="submitTypeSelect${recruitment.id}cv" style="display: none;">
                                    Chọn CV (.pdf): 
                                    <label>
                                        <input cssClass="form-control" type="file" name="file" accept=".pdf"></input>
                                    </label>
                                    <input type="hidden" value="${recruitment.id}">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                    <button type="submit" class="btn btn-primary">Ứng tuyển</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Modal -->
        </div>
        <div class="row">
            <div class="col-lg-8">
                <div class="mb-5">
                    <h3 class="h5 d-flex align-items-center mb-4 text-primary"><span class="icon-align-left mr-3"></span>Mô tả công việc</h3>
                    <p>${recruitment.description}</p>
                </div>

            </div>
            <div class="col-lg-4">
                <div class="bg-light p-3 border rounded mb-4">
                    <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Tóm tắt công việc</h3>
                    <ul class="list-unstyled pl-3 mb-0">
                        <li class="mb-2"><strong class="text-black">Ngày đăng </strong> <span>${recruitment.createAt}</span></li>
                        <li class="mb-2"><strong class="text-black">Danh mục công việc: </strong> <span>${recruitment.category.name}</span></li>
                        <li class="mb-2"><strong class="text-black">Loại công việc: </strong> <span">${recruitment.type.name}</span></li>
                        <li class="mb-2"><strong class="text-black">Kinh nghiệm: </strong> <span>${recruitment.experience} </span></li>
                        <li class="mb-2"><strong class="text-black">Địa chỉ: </strong> <span>${recruitment.address}</span></li>
                        <li class="mb-2"><strong class="text-black">Lương: </strong>
                            <c:choose>
                                <c:when test="${recruitment.salary == 0}"><span>Thoả thuận</span></c:when>
                                <c:otherwise><span>${recruitment.salary}</span></c:otherwise>
                            </c:choose>
                            
                        </li>
                        <li class="mb-2"><strong class="text-black">Số lượng: </strong><span>${recruitment.quantity}</span></li>
                        <li class="mb-2"><strong class="text-black">Hạn nộp cv: </strong><span>${recruitment.deadline}</span></li>
                    </ul>
                </div>

                <div class="bg-light p-3 border rounded">
                    <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Share</h3>
                    <div class="px-3">
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-facebook"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-twitter"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-linkedin"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-pinterest"></span></a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>





<script>
var cvSelects = document.querySelectorAll(".submitTypeSelect");
    cvSelects.forEach(function(select){
        select.addEventListener("change", function() {
            var selectedOption = select.options[select.selectedIndex];
            var type = selectedOption.value;
            var selectId = select.id;
            if(type == 2) { 
                document.getElementById(selectId + 'cv').style.display = 'block';
            }
            else {
                document.getElementById(selectId + 'cv').style.display = 'none';
            }
        })
    });

    var applyForms = document.querySelectorAll(".applyForm");
    applyForms.forEach(function(form){
        form.addEventListener("submit", function(event) {
            event.preventDefault();
            
            console.log(form);

            if (window.FormData !== undefined) {
                
                var fileUpload = form.elements[1];
                var id=form.elements[2].value;

                console.log(fileUpload);
                console.log(id);
                
                var files = fileUpload.files;

                var formData = new FormData();
                if (files.length > 0) {
                    formData.append('file', files[0]);
                } else {
                    formData.append('file', null); 
                }
                formData.append('recruitmentId', id);
                var contextPath = "<%=request.getContextPath()%>";
                    $.ajax(
                        {
                            type: 'POST',
                            url: contextPath + '/user/applyJob',
                            contentType: false,
                            processData: false,
                            data: formData,
                            success: function (message) {  
                                console.log(message)                          
                                if(message == 'alreadyApplied'){    
                                    console.log(message)                    
                                    swal({
                                        title: 'Bạn đã ứng tuyển công việc này',
                                        icon: 'error',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'error'
                                    })
                                }else{
                                    swal({
                                        title: 'Ứng tuyển thành công!',
                                        icon: 'success',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'success'
                                    })                                 
                                }

                            },
                            error: function (err) {
                                swal({
                                    title: 'Đã có lỗi xảy ra, vui lòng thử lại',
                                    icon: 'error',
                                    timer: 3000,
                                    buttons: true,
                                    type: 'error'    
                                })
                            }
                        }
                    )
                $('.modal').modal('hide');
            }
        })
    });
</script>

<footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section">

</footer>
</body>
</html>