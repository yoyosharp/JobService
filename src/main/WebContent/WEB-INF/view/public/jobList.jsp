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

<div class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-start">
      <div class="col-md-12  text-center mb-5">
        <p class="breadcrumbs mb-0"><span class="mr-3"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Job Post</span></p>
        <h1 class="mb-3 bread">Browse Job</h1>
      </div>
    </div>
  </div>
</div>
<section style="display: block" class="ftco-section">
  <div id="category-section">
    <div class="row justify-content-center mb-5">
      <div class="col-md-7 heading-section text-center ">
        <span class="subheading">Danh mục</span>
        <h2 class="mb-0">Top Danh mục công việc</h2>
      </div>
    </div>
    <div class="row">
      <c:if test="${empty topCategories}">
        <div class="col-md-6 ">
          <ul class="category text-center">
            <li><a>Không tìm thấy danh mục liên quan ...</a></li>
          </ul>
        </div>
      </c:if>
      <c:forEach var="category" items="${topCategories}">
        <div class="col-md-3 ">
          <ul class="category text-center">
              <li class="categorySelect" id="${category.id}">
                <form:form action="${pageContext.request.contextPath}/public/jobSearch" method="post" id="category${category.id}">
                  <input type="hidden" name="categoryId" value="${category.id}">
                  <a>
                      ${category.name} <br>
                      <span class="number">${category.appliedNumber}</span>
                      <span>Vị trí đang tuyển</span>
                      <i class="ion-ios-arrow-forward"></i>
                  </a>
                </form:form> 
                
            </li>
            
          </ul>
        </div>
      </c:forEach>
    </div>
    <div class="row">
      <div class="container">
        <div class="ftco-search">
          <div class="row">
            <div class="col-md-12 tab-wrap">  
              <div class="tab-content p-4" id="v-pills-tabContent">
                <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
                  <form:form action="${pageContext.request.contextPath}/public/categorySearch" class="search-job" method="post">
                    <div class="row no-gutters">
                      <div class="col-md-3 py-auto">
                        <div class="form-group">
                          <div class="form-field">
                            <h5 class="nav-link active">Tìm kiếm danh mục:</h5>
                          </div>
                        </div>
                      </div>
                      <div class="col-md mr-md-3">
                        <div class="form-group">
                          <div class="form-field">
                            <div class="icon"><span class="icon-briefcase"></span></div>
                            <input type="text" name="categoryKeyword" class="form-control" value="${categorySearchKeyword}" placeholder="eg. Garphic. Web Developer">
                          </div>
                        </div>
                      </div>
                      <div class="col-2">
                        <div class="form-group">
                          <div class="form-field">
                            <button type="submit" class="form-control btn btn-primary">Tìm kiếm</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </form:form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="ftco-section ftco-no-pb bg-light">
  <div class="container">
    <div class="row justify-content-center mb-4">
      <div class="col-md-7 text-center heading-section ">
        <span class="subheading">Browse Jobs</span>
        <h2 class="mb-4">Advance Search</h2>
      </div>
    </div>
    <div class="row">
      <div class="ftco-search">
        <div class="row">
          <div class="col-md-12 nav-link-wrap">
            <div class="nav nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
              <a class="nav-link active mr-md-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Find a Job</a>
            </div>
          </div>
          <div class="col-md-12 tab-wrap">
            <div class="tab-content p-4" id="v-pills-tabContent">
              <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
                <form:form action="${pageContext.request.contextPath}/public/jobSearch" class="search-job" method="post">
                  <div class="row no-gutters">
                    <div class="col-md mr-md-2">
                      <div class="form-group">
                        <div class="form-field">
                          <div class="icon"><span class="icon-briefcase"></span></div>
                          <input type="text" class="form-control" placeholder="eg. Garphic. Web Developer" id="filterTitle" name="keyword">
                        </div>
                      </div>
                    </div>
                    <div class="col-md mr-md-2">
                      <div class="form-group">
                        <div class="form-field">
                          <div class="select-wrap">
                            <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                            <select name="typeId" id="filterTypeId" class="form-control">
                              <option value=0 selected>Chọn loại công việc</option>
                              <c:forEach var="type" items="${jobTypes}">
                                <option value="${type.id}">${type.name}</option>
                              </c:forEach>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md mr-md-2">
                      <div class="form-group">
                        <div class="form-field">
                          <div class="icon"><span class="icon-map-marker"></span></div>
                          <input type="text" class="form-control" placeholder="Location" id="filterAddress" name="address">
                        </div>
                      </div>
                    </div>
                    <div class="col-md">
                      <div class="form-group">
                        <div class="form-field">
                          <button type="submit" class="form-control btn btn-primary">Tìm kiếm</button>
                        </div>
                        <div class="row justify-content-center">
                          <a href="${pageContext.request.contextPath}/public/jobList" class="text-muted">Reset</a>
                        </div>
                      </div>
                    </div>
                  </div>
                </form:form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="ftco-section bg-light">
  <div class="container">
    <div class="row" id="recruitment-section">
      <div class="col-lg-12 pr-lg-4">
        <c:if test="${category != null}">
          <h4>Kết quả tìm kiếm công việc cho danh mục: ${category.name}</h4>
        </c:if>
        <c:if test="${empty recruitments}">
          <div class="row">
            <div class="col-md-12 ">
              <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                <div class="one-third mb-4 mb-md-0">
                  <div class="job-post-item-header align-items-center">
                    <h2>Không tìm thấy công việc liên quan...</h2>
                  </div>  
                </div>
              </div>
            </div>
          </div>
        </c:if>
        <c:forEach var="recruitment" items="${recruitments}">
          <div class="row">
            <div class="col-md-12 ">
              <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                <div class="one-third mb-4 mb-md-0">
                  <div class="job-post-item-header align-items-center">
                    <span class="subadge">${recruitment.type.name}</span>
                    <form:form action="${pageContext.request.contextPath}/public/job-detail" method="post">
                      <input type="hidden" value="${recruitment.id}" name="recruitmentId"/>
                      <h2 class="mr-3 text-dark">
                          <button type="submit" class="  mt-2"
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
                          <input type="hidden" value="${recruitment.company.id}" name="companyId">                                                    
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
          </div>

          <!-- Modal -->
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
        <!-- Modal -->
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


<footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section">

</footer>
<script>
  var sectionId = "${jumpTo}"; 
  
  // JavaScript to scroll to the section
  window.onload = function() {
    console.log(sectionId)
      var section = document.getElementById(sectionId);
      if (section) {
          section.scrollIntoView({ behavior: "smooth" }); 
      }
  };
</script>

<script>
  var paginations = document.querySelectorAll(".page-selector");
  paginations.forEach(function(link) {
    link.addEventListener("click", function(event) {
      event.preventDefault();

      var page = link.textContent;
      var contextPath = "<%=request.getContextPath()%>";
      var title = $('#filterTitle').val();
      var typeId = $('#filterTypeId').val();
      
      var address = $('#filterAddress').val();
      
      if (window.FormData !== undefined) {   
        var formData = new FormData();
        formData.append('page', page);
        formData.append('keyword', title);
        formData.append('typeId', typeId);
        formData.append('address', address)

        $.ajax({
          type: 'POST',
          url: contextPath + '/public/jobSearch', 
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
  var categorySelectors = document.querySelectorAll(".categorySelect");
  categorySelectors.forEach(function(item) {
    item.addEventListener("click", function() {
      console.log(item.id)
      var formId = '#category' + item.id;
      var form = document.querySelector(formId)
      form.submit();
    });
  });
</script>

</body>
</html>