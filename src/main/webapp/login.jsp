<%@ include file="/WEB-INF/jspf/directive/page.jspf" %>
<%@ include file="/WEB-INF/jspf/directive/taglib.jspf" %>

<!doctype html>
<html>
<c:set var="title" value="Страница входа" scope="page"/>
<jsp:include page="/WEB-INF/templates/_head.jsp"></jsp:include>
<body>
<div class="container">
    <div class="d-flex justify-content-center">
        <div class="card border-primary mb-3" style="width: 50%; margin-top: 100px ">
            <form class="p-5" method="post" action="controller?action=login">
                <div class="form-group">
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger" role="alert">${errorMessage}</div>
                    </c:if>
                    <label for="login"><fmt:message key="login.label.login"/></label>
                    <input type="text" class="form-control" id="login" name="login"
                           placeholder="<fmt:message key="login.placeholder.login"/>"
                           value="+380" size="13" maxlength="13" required>
                </div>
                <div class="form-group">
                    <label for="password"><fmt:message key="login.label.password"/></label>
                    <input type="password" class="form-control" id="password" name="password"
                           placeholder="<fmt:message key="login.placeholder.password"/>" minlength="6"
                           maxlength="40" required>
                </div>
                <button type="submit" class="btn btn-primary"><fmt:message key="login.button.login"/></button>
            </form>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/templates/_scripts.jsp"></jsp:include>
</body>
</html>