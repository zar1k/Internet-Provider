<%@ attribute name="value" type="java.lang.Boolean" required="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<c:choose>
    <c:when test="${value}">
        <span class="badge badge-danger text-uppercase"><fmt:message key="status.blocked"/></span>
    </c:when>
    <c:otherwise>
        <span class="badge badge-success text-uppercase"><fmt:message key="status.active"/></span>
    </c:otherwise>
</c:choose>