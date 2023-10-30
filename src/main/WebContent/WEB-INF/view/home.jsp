<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <%@
taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Demo Spring Security Home Page</title>
  </head>
  <body>
    <h1>Demo Spring Security Home Page</h1>

    User: ${user.id}
    <hr />
    User:
    <security:authentication
      property="principal.username"
    ></security:authentication>
    <br /><br />
    Role(s) :
    <security:authentication
      property="principal.authorities"
    ></security:authentication>
    <hr />
    <p>Welcome to Demo Spring Security Home Page</p>
    <hr />

    <security:authorize access="hasRole('MANAGER')">
      <p>
        <a href="${pageContext.request.contextPath}/leaders"
          >Leadership Meeting</a
        >(Only for Manager)
      </p>
    </security:authorize>

    <security:authorize access="hasRole('ADMIN')">
      <p>
        <a href="${pageContext.request.contextPath}/system">IT system Meeting</a
        >(Only for System Manager)
      </p>
    </security:authorize>

    <!-- Add a logout button -->

    <form:form action="${pageContext.request.contextPath}/logout" method="POST">
      <button type="submit">Logout</button>
    </form:form>
  </body>
</html>
