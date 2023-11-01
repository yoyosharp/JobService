<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
      integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
      crossorigin="anonymous"
    />

    <form:form action="${pageContext.request.contextPath}/register" modelAttribute="userModel" method="post" class="p-4 border rounded">
      <div class="row form-group">
        <div class="col-md-12 mb-3 mb-md-0">
          <label class="text-black" for="email">Email</label>
          <form:input type="email" path="email" cssClass="form-control" value="${userModel.email}"  />
          <form:errors path="email" cssClass="text-danger"></form:errors>
        </div>
      </div>

      <div class="row form-group">
        <div class="col-md-12 mb-3 mb-md-0">
          <label class="text-black" for="name">Họ và tên</label>
          <form:input type="text" path="name" cssClass="form-control" value="${userModel.name}"  />
          <form:errors path="name" cssClass="text-danger"></form:errors>
        </div>
      </div>

      <div class="row form-group">
        <div class="col-md-12 mb-3 mb-md-0">
          <label class="text-black" for="password">Mật khẩu</label>
          <form:input type="password" path="password" cssClass="form-control" placeholder="Mật khẩu"  />
          <form:errors path="password" cssClass="text-danger"></form:errors>
        </div>
      </div>
      <div class="row form-group mb-4">
        <div class="col-md-12 mb-3 mb-md-0">
          <label class="text-black" for="repeatPassword">Nhập lại mật khẩu</label>
          <form:input type="password" path="repeatPassword" cssClass="form-control" placeholder="Nhập lại mật khẩu"  />
        </div>
      </div>
      <div class="row form-group">
        <div class="col-md-12 mb-3 mb-md-0">
          <label class="text-black" for="fname">Vai trò</label>
          <form:select cssClass="form-control" path="roleId" >
            <c:choose>
              <c:when test="${userModel.roleId == 1}">
                <form:option value="1" selected="true" readonly="true">Nhà tuyển dụng</form:option>
              </c:when>
              <c:when test="${userModel.roleId == 2}">
                <form:option value="2" selected="true" readonly="true">Người lao động</form:option>
              </c:when>
              <c:otherwise>
                <form:option value="" selected="true" disabled="true">Chọn vai trò</form:option>
              </c:otherwise>
            </c:choose>
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

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script
      src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
      integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
      integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
