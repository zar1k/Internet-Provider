<%@ include file="/WEB-INF/jspf/directive/page.jspf" %>
<%@ include file="/WEB-INF/jspf/directive/taglib.jspf" %>

<!doctype html>
<html>
<c:set var="title" value="Страница входа" scope="page"/>
<jsp:include page="/WEB-INF/templates/_head.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/templates/_menu.jsp"></jsp:include>
<div class="container">
    <div class="row  mt-5">
        <div class="col">
            <div class="d-flex justify-content-center">
                <img src="img/Internet2.jpg" style="width: 100%">
            </div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col">
            <img src="img/inet-ru.png">
        </div>
        <div class="col">
            <img src="img/tv-ru.png">
        </div>
        <div class="col">
            <img src="img/tel-ru.png">
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/templates/_scripts.jsp"></jsp:include>
</body>
</html>