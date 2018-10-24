<%@ include file="/WEB-INF/jspf/directive/taglib.jspf" %>
<%@ include file="/WEB-INF/jspf/directive/page.jspf" %>

<div class="container">
    <nav class="navbar navbar-light bg-light">
        <a class="navbar-brand" href="../../index.jsp">НЕВОЛЯ</a>
        <div class="dropdown">
            <button class="btn btn-outline-secondary btn-sm" type="button" id="dropdownMenuButton"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="material-icons">
                    language
                </i>
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <form class="form-inline" method="post" action="controller?action=i18n">
                    <button type="submit" name="ru" class="dropdown-item">RU</button>
                    <button type="submit" name="en" class="dropdown-item">EN</button>
                </form>
            </div>
        </div>
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <form class="form-inline" method="post" action="controller?action=logout">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                        <fmt:message key="templates._menu.logout"/>
                    </button>
                </form>
            </c:when>
            <c:otherwise>
                <form class="form-inline" method="post" action="../../login.jsp">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                        <fmt:message key="templates._menu.private_office"/>
                    </button>
                </form>
            </c:otherwise>
        </c:choose>
    </nav>
</div>