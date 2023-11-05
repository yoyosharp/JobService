<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head">
    <title>Work CV - Profile</title>
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
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="collapse navbar-collapse justify-content-end" id="ftco-nav">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item ">
            <a class="nav-link active text-info" aria-current="page" href="${pageContext.request.contextPath}/public/home">Trang chủ</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-info" href="${pageContext.request.contextPath}/public/job-list">Công việc</a>
          </li>
  
          <security:authorize access="hasRole('EMPLOYER')">
              <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle text-info" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Công ty
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/user/profile">Hồ sơ</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/company/recruitment-list">Danh sách bài đăng</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/company/add-recruitment">Đăng tin tuyển dụng</a>
                    <div class="dropdown-divider"></div>
                    <form:form action="${pageContext.request.contextPath}/logout">
                      <input type="submit" class="dropdown-item" value="Đăng xuất">
                    </form:form>
                  </div>
              </li>
          </security:authorize>
          
          <security:authorize access="hasRole('EMPLOYEE')">
              <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle text-info" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Ứng viên
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/user/profile">Hồ sơ</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/employee/saved-job">Công việc đã lưu</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/employee/applied-job">Công việc đã ứng tuyển</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/employee/followed-company">Công ty đã theo dõi</a>
                    <div class="dropdown-divider"></div>
                    <form:form action="${pageContext.request.contextPath}/logout">
                      <input type="submit" class="dropdown-item" value="Đăng xuất">
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
                    <img src="${pageContext.request.contextPath}${user.image}" alt="profile-pic" id="avatar2"
                        style="border-radius: 50%; width: 20px; height: 20px;">
                <span>${user.name}</span></div>
            </security:authorize>
        </li>     
      </div>
    </div>
</nav>
      <!-- Navbar -->

<div class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <h1 class="mb-3 bread">Hồ sơ </h1>
                <div class="form-group">
                    <label class="btn btn-primary btn-md btn-file">
                        Chọn ảnh<input type="file" name="file" id="avatarUpload" hidden>
                    </label>
                </div>
                <div style="margin-left: 0px" id="divImage" >
                    <img id="avatar" height="100" width="100" style="border-radius: 50px" src="${pageContext.request.contextPath}${user.image}">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- HOME -->

<input type="hidden" id="currentUserEmail" value="${user.email}">
<!-- Toast -->
<c:if test="${updateMessage != null}">
  <c:if test="${updateMessage == 'success'}">
    <div class="toast" data-delay="2500" style="position:fixed; top: 100PX; right: 10PX;z-index: 2000;width: 300px">
      <script>
        swal({
          title: 'Cập nhật thành công!',
          icon: 'success',
          timer: 3000,
          buttons: true,
          type: 'success'
        })
      </script>
    </div>
  </c:if>

  <c:if test="${updateMessage != 'success'}">
    <div class="toast" data-delay="2500" style="position:fixed; top: 100PX; right: 10PX;z-index: 2000;width: 300px">
      <script>
        swal({
          title: 'Cập nhật không thành công!',
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
<!-- Toast -->

<section class="site-section" style="margin-top: 10px">
    <div class="container">
        <div class="row">

            <security:authorize access="hasRole('EMPLOYEE')">
                <div class="col-lg-6 mb-5">
                    <h2 class="mb-4">Thông tin cá nhân</h2>
                    <form:form action="${pageContext.request.contextPath}/user/update-profile" method="post" modelAttribute = "userModel">

                        <div class="row mb-5">
                            <div class="col-lg-12">
                                <div class="p-4 p-md-5 border rounded">
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <form:input type="email" cssClass="form-control" path="email" value="${(userModel.email != null)? userModel.email : user.email}" placeholder="your@company.com"/>
                                        <c:if test="${updateMessage == 'email-existed'}">
                                            <span class="text-danger">Địa chỉ email đã đăng ký trên hệ thống</span>
                                        </c:if>
                                        <form:errors path="email" cssClass="text-danger"></form:errors>                                
                                    </div>
                                    <div class="form-group">
                                        <label for="job-title">Họ và tên</label>
                                        <form:input type="text" cssClass="form-control" path="name" value="${(userModel.name != null)? userModel.name : user.name}" id="job-title" placeholder="Họ tên" />
                                        <form:errors path="name" cssClass="text-danger"></form:errors>
                                    </div>
                                    <div class="form-group">
                                        <label for="job-location">Địa chỉ</label>
                                        <form:input type="text" path="address" value="${(userModel.address != null)? userModel.address : user.address}" cssClass="form-control" id="job-location" placeholder="e.g. New York"/>
                                        <form:errors path="address" cssClass="text-danger"></form:errors>
                                    </div>
                                    <div class="form-group">
                                        <label for="job-location">Số điện thoại</label>
                                        <form:input type="text" path="phoneNumber" value="${(userModel.phoneNumber != null)? userModel.phoneNumber : user.phoneNumber}" cssClass="form-control" id="job-location" placeholder="+ 84" />
                                        <form:errors path="phoneNumber" cssClass="text-danger"></form:errors>
                                    </div>
                                    <div class="form-group">
                                        <label for="job-location">Mô tả bản thân</label>
                                        <form:textarea path="description" value="${(userModel.description != null)? userModel.description : user.description}" class="form-control" id="editor" placeholder="Mô tả"></form:textarea>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-12">
                                            <input type="submit" value="Lưu thông tin" class="btn px-4 btn-primary text-white">
                                        </div>
                                    </div>
                
                                    <form:input path="password" value="123456" hidden="true"></form:input>
                                    <form:input path="repeatPassword" value="123456" hidden="true"></form:input>
                                    <form:input path="roleId" value="0" hidden="true"></form:input>
                                    
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>    

                <div class="col col-lg-6">
                    <h2 class="mb-4">Cập nhật CV</h2>
                    

                        <div class="row align-items-center mb-5">
                            <div class="col-lg-12 border rounded">
                                <div class="row">
                                    <form:form enctype="multipart/form-data">
                                        <div class="form-group ml-lg-3 mt-4">                    
                                            <label class="btn btn-primary btn-md btn-file">
                                                Chọn CV (.pdf)<input type="file" name="file" id="fileUpload" accept=".pdf" required hidden>
                                            </label>
                                        </div>
                                    </form:form>
                                    </div>                                
                                    
                                    <div class="ml-lg-3 mt-2" id="cvList">
                                        <c:if test="${user.cv.fileName == null}">
                                            <div>
                                                <p id="uploadCvName" class="mr-3">Chưa có CV được cập nhật</p>
                                            </div>    
                                                <a id="uploadCvView" href="#" class="mr-2"></a>
                                                <a id="uploadCvDelete" class="text-danger" data-toggle="modal" data-target="#deleteCVmodal" href="#"></a>
                                            
                                        </c:if>

                                        <c:if test="${user.cv.fileName != null}">
                                            <div>
                                                <p id="uploadCvName" class="mr-3">${user.cv.fileName}</p>
                                            </div>                                   
                                                <a id="uploadCvView" href="${pageContect.request.contextPath}${cv.fileName}" class="mr-2">Xem CV</a>
                                                <a id="uploadCvDelete" class="text-danger" data-toggle="modal" data-target="#deleteCVmodal" href="#">Xóa CV</a>
                                                                                             
                                         </c:if>  
                                         <!-- Modal -->
                                         <div class="modal fade"  id="deleteCVmodal" tabindex="-1" role="dialog" aria-labelledby="deleteCVmodalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="deleteCVmodalLabel">Bạn có chắc chắn muốn xóa ?</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">                                               
                                                            <input type="hidden" value="">
                                                            <div class="modal-footer mt-1">                                                                            
                                                                <button class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                                <button id="deleteCv" class="btn btn-danger" data-dismiss="modal">Xóa</button>
                                                            </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    <!-- Modal -->                                
                                    </div>                                                                       
                                </div>                            
                    
                            <div class="col-lg-4">
                                <div class="row">
                                </div>
                            </div>
                        </div>
                </div>           
            </security:authorize>

            <security:authorize access="hasRole('EMPLOYER')">
                <div class="col-lg-6 mb-5">
                    <h2 class="mb-4">Thông tin cá nhân</h2>
                    <form:form action="${pageContext.request.contextPath}/user/update-profile" method="post" modelAttribute = "userModel">

                        <div class="row mb-5">
                            <div class="col-lg-12">
                                <div class="p-4 p-md-5 border rounded">
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <form:input type="email" cssClass="form-control" path="email" value="${(userModel.email != null)? userModel.email : user.email}" placeholder="your@company.com"/>
                                        <c:if test="${updateMessage == 'email-existed'}">
                                            <span class="text-danger">Địa chỉ email đã đăng ký trên hệ thống</span>
                                        </c:if>
                                        <form:errors path="email" cssClass="text-danger"></form:errors>                                
                                    </div>
                                    <div class="form-group">
                                        <label for="job-title">Họ và tên</label>
                                        <form:input type="text" cssClass="form-control" path="name" value="${(userModel.name != null)? userModel.name : user.name}" id="job-title" placeholder="Họ tên" />
                                        <form:errors path="name" cssClass="text-danger"></form:errors>
                                    </div>
                                    <div class="form-group">
                                        <label for="job-location">Địa chỉ</label>
                                        <form:input type="text" path="address" value="${(userModel.address != null)? userModel.address : user.address}" cssClass="form-control" id="job-location" placeholder="e.g. New York"/>
                                        <form:errors path="address" cssClass="text-danger"></form:errors>
                                    </div>
                                    <div class="form-group">
                                        <label for="job-location">Số điện thoại</label>
                                        <form:input type="text" path="phoneNumber" value="${(userModel.phoneNumber != null)? userModel.phoneNumber : user.phoneNumber}" cssClass="form-control" id="job-location" placeholder="+ 84" />
                                        <form:errors path="phoneNumber" cssClass="text-danger"></form:errors>
                                    </div>
                                    <div class="form-group">
                                        <label for="job-location">Mô tả bản thân</label>
                                        <form:textarea path="description" value="${(userModel.description != null)? userModel.description : user.description}" class="form-control" id="editor" placeholder="Mô tả"></form:textarea>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-12">
                                            <input type="submit" value="Lưu thông tin" class="btn px-4 btn-primary text-white">
                                        </div>
                                    </div>
                
                                    <form:input path="password" value="123456" hidden="true"></form:input>
                                    <form:input path="repeatPassword" value="123456" hidden="true"></form:input>
                                    <form:input path="roleId" value="0" hidden="true"></form:input>
                                    
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
    
                <div class="col-lg-6">
                    <h2 class="mb-4">Thông tin công ty</h2>
                    <div class="form-group">
                        <label for="company-website-tw d-block1">Cập nhật Logo</label> <br>
                        <label class="btn btn-primary btn-md btn-file">
                            Chọn logo<input type="file" name="file" id="logoUpload" required hidden>
                        </label>
                        <div id="divLogo">
                            <img id="ompanyLogo" height="100" width="100" style="border-radius: 50px" src="${pageContext.request.contextPath}${company.logo}">
                    </div>
                    <form:form action="${pageContext.request.contextPath}/user/update-company" method="post" enctype="multipart/form-data" modelAttreibute="companyModel">
    
                        <div class="row mb-5">
                            <div class="col-lg-12">
                                <div class="p-4 p-md-5 border rounded" method="post">
                                    <div class="form-group">
                                        <label for="email">Email</label>
    
                                        <input type="text" class="form-control" required id="email1" name="email" th:value="${companyInformation.email != null ? companyInformation.email : null }" placeholder="you@yourdomain.com">
                                    </div>
                                    <div class="form-group">
                                        <label for="job-title">Tên công ty</label>
                                        <input type="text" class="form-control" name="nameCompany" th:value="${companyInformation.nameCompany != null ? companyInformation.nameCompany : null }" id="job-title"  placeholder="Full name" required>
                                        <input type="hidden" class="form-control" name="user_id" th:value="${companyInformation.user.id != null ? companyInformation.user.id : null}" id="job-title" placeholder="Full name">
                                        <input type="hidden" class="form-control" name="id" th:value="${companyInformation.id !=null ? companyInformation.id : null}" id="job-title" placeholder="Full name">
    
                                    </div>
                                    <div class="form-group">
                                        <label for="job-location">Địa chỉ</label>
                                        <input type="text" name="address" th:value="${companyInformation.address != null ? companyInformation.address : null}" required class="form-control" id="job-location" placeholder="e.g. New York">
                                    </div>
                                    <div class="form-group">
                                        <label for="job-location">Số điện thoại công ty</label>
                                        <input type="text" name="phoneNumber" th:value="${companyInformation.phoneNumber != null ? companyInformation.phoneNumber : null}" required class="form-control" id="job-location" placeholder="+ 84">
                                    </div>
                                    <div class="form-group">
                                        <label for="job-location">Mô tả công ty</label>
                                        <textarea  name="description" th:text="${companyInformation.description != null ? companyInformation.description : null}"  class="form-control" id="editorN" placeholder="Mô tả"></textarea>
                                    </div>
    
    
                                    <div style="margin-left: 0px" id="divImag1" th:if="${companyInformation.logo != null}">
                                        <img id="" height="100" width="100" style="border-radius: 50px;margin-bottom: 15px" th:src="${companyInformation.logo}">
                                    </div>
                                    <div class="row form-group" >
                                        <div class="col-md-12">
                                            <input type="submit" value="Lưu thông tin" class="btn px-4 btn-primary text-white">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
            </security:authorize>
            
        </div>
    </div>
</section>

<script>
    ClassicEditor.create(document.querySelector('#editor')).then(eidt => {
        console.log("da" + eidt);
    })
        .catch(error => {
            console.error(error);
        });
    ClassicEditor.create(document.querySelector('#editorN')).then(eidt => {
        console.log("da" + eidt);
    })
        .catch(error => {
            console.error(error);
        });
</script>

<script>
    $(function () {
        $('#avatarUpload').change(function () {
            if (window.FormData !== undefined) {
                var fileUpload = $('#avatarUpload').get(0);
                var files = fileUpload.files;
                var formData = new FormData();
                formData.append('file', files[0]);
                var contextPath = "<%=request.getContextPath()%>";                
                if(files[0] == null){
                    alert("Không thể tìm được file, vui lòng thử lại")
                } else {
                    $.ajax(
                        {
                            type: 'POST',
                            url: 'uploadImage',
                            contentType: false,
                            processData: false,
                            data: formData,
                            success: function (urlImage) {
                                if(urlImage == "Error"){                                    
                                    swal({
                                        title: 'Cập nhật ảnh đại diện không thành công!',                                        
                                        icon: 'error',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'error'
                                    })
                                    $("#divImage").css("display","block")
                                }else{
                                    $('#avatar').attr('src', contextPath + urlImage),
                                    $('#avatar2').attr('src', contextPath + urlImage)
                                    swal({
                                        title: 'Cập nhật ảnh đại diện thành công!',
                                        /* text: 'Redirecting...', */
                                        icon: 'success',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'success'
                                    })
                                }

                            },
                            error: function () {
                                alert("Đã có lỗi xảy ra. vui lòng thử lại");
                            }
                        }
                    )
                }

            }
        })
    })
</script>

<script>
    $(function () {
        $('#logoUpload').change(function () {
            if (window.FormData !== undefined) {
                var fileUpload = $('#logoUpload').get(0);
                var files = fileUpload.files;
                var formData = new FormData();                
                formData.append('file', files[0]);
                var contextPath = "<%=request.getContextPath()%>";
                if(files[0] == null){
                    alert("Không thể tìm được file, vui lòng thử lại")
                } else {
                    $.ajax(
                        {
                            type: 'POST',
                            url: 'uploadCompanyLogo',
                            contentType: false,
                            processData: false,
                            data: formData,
                            success: function (urlLogo) {
                                if(urlLogo == "Error"){                                    
                                    swal({
                                        title: 'Cập nhật logo công ty không thành công!',                                        
                                        icon: 'error',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'error'
                                    })
                                    $("#divImage").css("display","block")
                                }else{
                                    $('#companyLogo').attr('src', contextPath + urlImage),
                                    swal({
                                        title: 'Cập nhật logo công ty thành công!',                                
                                        icon: 'success',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'success'
                                    })
                                }

                            },
                            error: function () {
                                alert("Đã có lỗi xảy ra. vui lòng thử lại");
                            }
                        }
                    )
                }

            }
        })
    })
</script>

<script>
    $(function () {
        $('#fileUpload').change(function () {
            if (window.FormData !== undefined) {
                var fileUpload = $('#fileUpload').get(0);
                var files = fileUpload.files;
                var formData = new FormData();
                formData.append('file', files[0]);
                var contextPath = "<%=request.getContextPath()%>";
                var userEmail = document.getElementById('currentUserEmail').value;
                if(files[0] == null){
                    alert("Không tìm được file, vui lòng thử lại")
                } else {
                    $.ajax(
                        {
                            type: 'POST',
                            url: 'uploadCv',
                            contentType: false,
                            processData: false,
                            data: formData,
                            success: function (cvUrl) {  
                                console.log(cvUrl)                          
                                if(cvUrl == "Error"){                        
                                    swal({
                                        title: 'Cập nhật CV không thành công',
                                        icon: 'error',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'error'
                                    })
                                }else{
                                    swal({
                                        title: 'Cập nhật CV thành công!',
                                        icon: 'success',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'success'
                                    })
                                    var parts = cvUrl.split("/");
                                    var cvName = parts[parts.length - 1];
                                    $('#uploadCvName').html(cvName);
                                    $('#uploadCvView').html('Xem CV');
                                    document.getElementById('uploadCvView').href = contextPath +'/upload/' + userEmail + cvUrl;   
                                    $('#uploadCvDelete').html('Xoá CV');                                    
                                                                     
                                }

                            },
                            error: function (err) {
                                alert("Đã có lỗi xảy ra. vui lòng thử lại");
                            }
                        }
                    )
                }

            }
        })
    })
</script>

<script>
    $(function () {
        $('#deleteCv').click(function () {           
                var contextPath = "<%=request.getContextPath()%>";
                    $.ajax(
                        {
                            type: 'POST',
                            url: 'deleteCv',
                            success: function (deleteMessage) {
                                if(deleteMessage == "Error"){                                    
                                    swal({
                                        title: 'Xoá CV không thành công, vui lòng thử lại',                                        
                                        icon: 'error',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'error'
                                    })
                                }else{
                                    swal({
                                        title: 'Xoá CV thành công',                                
                                        icon: 'success',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'success'
                                    })
                                    $("#uploadCvName").html("Chưa có CV được cập nhật")
                                    $("#uploadCvView").css("display","none")
                                    $("#uploadCvDelete").css("display","none")
                                }

                            },
                            error: function () {
                                alert("Đã có lỗi xảy ra. vui lòng thử lại");
                            }
                        }
                    )
        })
    })
</script>

<footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section">

</footer>
</body>
</html>