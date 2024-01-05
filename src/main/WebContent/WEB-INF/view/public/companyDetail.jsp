<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

<div class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5" th:if="${session.user.role.id == 2 }">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="${pageContext.request.contextPath}/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Thông tin công ty<span></span></p>
                <h1 class="mb-3 bread">Danh sách bài đăng</h1>
            </div>
        </div>
    </div>
</div>

<div class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5" >
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-start mb-5">
                <h2 class="text-white">Thông tin công ty</h2>
                <div class="row bg-light p-3 border rounded mb-4">
                    <div class="col-md-8">
                        <ul class="list-unstyled pl-3 mb-0">
                            <li class="mb-2"> <strong class="text-black">Tên công ty: </strong> <span>${company.name}</span> </li>
                             <li class="mb-2"><strong class="text-black">Địa chỉ: </strong> <span>${company.address}</span></li>
                             <li class="mb-2"><strong class="text-black">Số điện thoại: </strong> <span">${company.phoneNumber}</span></li>
                             <li class="mb-2"><strong class="text-black">Email: </strong> <span>${company.email}</span></li>
                             <li class="mb-2"><strong class="text-black">Số bài đăng: </strong> <span>${company.totalJob}</span></li>
                             <li class="mb-2"><strong class="text-black">Mô tả công ty: </strong> 
                                <textarea class="form-control" name="" id="" cols="30" rows="3" readonly>${company.description}</textarea>
                             </li>
                         </ul>
                    </div>

                    <div class="col-md-4 align-item-center justify-content-center">
                        <img src="${pageContext.request.contextPath}${company.logo}" alt="" style="width: 250px; border-radius: 50%;">
                        <security:authorize access="hasRole('EMPLOYEE')">
                          <c:if test="${followed == null}">
                            <div class="mt-3 text-center">
                              <button class="btn-primary btn-large">Theo dõi</button>
                            </div>
                          </c:if>
                          <c:if test="${followed != null}">
                            <div class="mt-3 text-center">
                              <p class="btn-primary btn-large">Đã theo dõi</p>
                            </div>
                          </c:if>
                        </security:authorize>
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
                    <div class="row mb-3" >
                        <h3>Danh sách bài tuyển dụng: </h3>
                    </div>    
                    
                    <div class="row form-group">
                        <c:if test="${fn:length(recruitments) == 0}">
                            <h4 class="ml-4 mb-3">Chưa có bài đăng</h4>
                        </c:if>

                        <c:forEach var="recruitment" items="${recruitments}">

                        <div class="col-md-12">
                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center justify-content-start">
                              <div class="mb-4 mb-md-0">
                                <div class="job-post-item-header align-items-start">
                                  <span class="subadge">${recruitment.type.name}</span>
                                  <form:form action="${pageContext.request.contextPath}/public/job-detail" method="post">
                                    <input type="hidden" value="${recruitment.id}">
                                    <h2 class="mr-3 text-dark">
                                        <button type="submit" class="mt-2"
                                        style="border: none;
                                        background: none;
                                        padding: 0;
                                        cursor: pointer;"
                                        >${recruitment.title}</button> 
                                    </h2>               
                                  </form:form>  
                                </div>
                                <div class="job-post-item-body d-block d-md-flex">
                                  <form:form action="${pageContext.request.contextPath}/public/company-detail" method="post">
                                    <div class="mr-3">
                                        <span class="icon-layers"></span>                                                    
                                        <input type="hidden" value="${recruitment.company.id}">                                                    
                                            <button type="submit" class="btn-light"
                                            style="border: none;
                                            background: none;
                                            padding: 0;"     
                                            > ${recruitment.company.name}</button>                                                                                               
                                        <span class="icon-my_location"></span><span> ${recruitment.address}</span><br>    
                                        <span class="icon-people_outline"></span><span> ${recruitment.quantity}</span>
                                        <span class="icon-money ml-3"></span><span> ${recruitment.salary}</span><br>
                                        <span class="icon-tasks"></span><span> ${recruitment.category.name}</span>                                 
                                    </div>    
                                </form:form>
                                </div>
                              </div>
                
                              <security:authorize access="hasRole('EMPLOYEE')">
                                <div class="d-flex align-items-center mt-4 md-md-0">
                                  <div class="ml-auto">
                                      <form:form>
                                          <input type="hidden" value="${recruitment.id}">   
                                          <button type="submit" style="border: none; background: none; padding: 0;">
                                              <a id="saveJob" class="icon text-center d-flex justify-content-center align-items-center mr-2">
                                              <span class="icon-heart"></span>
                                              </a>
                                          </button>
                                      </form:form>                                                
                                  </div>
                                  <a data-toggle="modal" data-target="#modal${recruitment.id}" class="btn btn-primary py-2">Ứng tuyển</a>
                                </div>                  
                              </security:authorize>
                            </div>
                          </div>
          

            <!-- Modal apply -->
            <div class="modal fade" id="modal${recruitment.id}" tabindex="-1" role="dialog" aria-labelledby="modalLabel${recruitment.id}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalLabel${recruitment.id}">Ứng tuyển: <span>${recruitment.title}</span></h5>
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
            <!-- Modal apply -->

        </c:forEach>  
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-end">
                              
                              <c:if test="${pageIndex > 1}">
                                <li class="page-item previous">
                                  <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                  </a>
                                </li>
                              </c:if>
                  
                              <c:forEach var="page" begin="1" end="${pageIndex - 1}">
                                <li class="page-item"><a class="page-link page-selector" href="#">${page}</a></li>
                              </c:forEach>
                              <li class="page-item disabled"><a class="page-link" href="#">${pageIndex}</a></li>
                              <c:forEach var="page" begin="${pageIndex + 1}" end="${maxPageCount}">
                                <li class="page-item"><a class="page-link page-selector" href="#">${page}</a></li>
                              </c:forEach>
                  
                              <c:if test="${pageIndex < maxPageCount}">
                                <li class="page-item next">
                                  <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                  </a>
                                </li>
                              </c:if>
                              
                            </ul>
                          </nav>
            </div>

        </div>
    </div>
</section>
<input type="hidden" value="${company.id}" id="companyId">


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
              
              if (window.FormData !== undefined) {
                  
                  var fileUpload = form.elements[1];
                  var id=form.elements[2].value;
  
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
            url: contextPath + '/public/company-detail', 
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