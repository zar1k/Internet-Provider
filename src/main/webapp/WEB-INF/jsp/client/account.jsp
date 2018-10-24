<%@ include file="/WEB-INF/jspf/directive/page.jspf" %>
<%@ include file="/WEB-INF/jspf/directive/taglib.jspf" %>

<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!doctype html>
<html>
<c:set var="title" value="Страница входа" scope="page"/>
<jsp:include page="/WEB-INF/templates/_head.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/templates/_menu.jsp"></jsp:include>
<div class="container">
    <div class="card border-primary mt-3 mb-3 p-3">
        <div class="row">
            <div class="col-3">
                <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <a class="nav-link active" id="v-pills-account-tab" data-toggle="pill" href="#v-pills-account"
                       role="tab" aria-controls="v-pills-account" aria-selected="true"><fmt:message
                            key="account.menu.button.private_office"/></a>
                    <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab"
                       aria-controls="v-pills-profile" aria-selected="false"><fmt:message
                            key="account.menu.button.edit"/></a>
                </div>
            </div>
            <div class="col-9">
                <div class="tab-content" id="v-pills-tabContent">
                    <div class="tab-pane fade show active" id="v-pills-account" role="tabpanel"
                         aria-labelledby="v-pills-account-tab">
                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <label for="accountNumber" class="col-3 col-form-label"><fmt:message
                                            key="account.menu.private_office.label.account_number"/></label>
                                    <div class="col">
                                        <input type="text" readonly class="form-control-plaintext" id="accountNumber"
                                               value="${fullUser.account.number}">
                                    </div>
                                </div>
                                <div class="row">
                                    <label for="fullName" class="col-3 col-form-label"><fmt:message
                                            key="account.menu.private_office.label.full_name"/></label>
                                    <div class="col">
                                        <input type="text" readonly class="form-control-plaintext" id="fullName"
                                               value="${fullUser.surname} ${fullUser.firstName} ${fullUser.lastName}">
                                    </div>
                                </div>
                                <div class="row">
                                    <label for="login" class="col-3 col-form-label"><fmt:message
                                            key="account.menu.private_office.label.balance"/></label>
                                    <div class="col">
                                        <input type="text" readonly class="form-control-plaintext" id="login"
                                               value="${fullUser.account.balance}">
                                    </div>
                                    <div class="col">
                                        <div class="d-flex justify-content-end">

                                            <button type="button" class="btn btn-outline-secondary btn-sm mr-2"
                                                    data-toggle="modal"
                                                    data-target="#accountBalanceModal">
                                                <i class="material-icons">account_balance_wallet</i>
                                            </button>
                                        </div>
                                        <!-- Modal -->
                                        <div class="modal fade" id="accountBalanceModal" tabindex="-1" role="dialog"
                                             aria-labelledby="accountBalanceModal" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <form action="controller?action=account" method="post">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">
                                                                <fmt:message
                                                                        key="account.menu.private_office.modal.title"/>
                                                            </h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="form-group">
                                                                <label for="recipient-name" class="col-form-label">
                                                                    <fmt:message
                                                                            key="account.menu.private_office.modal.label"/>
                                                                </label>
                                                                <input type="number" min="0" minlength="1"
                                                                       class="form-control"
                                                                       name="account_balance"
                                                                       id="recipient-name" required>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-dismiss="modal">
                                                                <fmt:message
                                                                        key="account.menu.private_office.button.cancel"/>
                                                            </button>
                                                            <button type="submit" class="btn btn-primary">
                                                                <fmt:message
                                                                        key="account.menu.private_office.button.replenish"/>
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="col-3 col-form-label">
                                        <fmt:message key="account.menu.private_office.label.status_of_services"/>
                                    </label>
                                    <div class="col">
                                        <tags:isblocked value="${fullUser.blocked}"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <table class="table table-hover mt-2">
                                    <thead>
                                    <tr>
                                        <th scope="col"><fmt:message key="table.th.tariff"/></th>
                                        <th scope="col"><fmt:message key="table.th.cost"/></th>
                                        <th scope="col"><fmt:message key="table.th.description"/></th>
                                        <th scope="col"></th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="tariff" items="${fullUser.tariffs}">
                                        <tr>
                                            <td>${tariff.name}</td>
                                            <td>${tariff.price}</td>
                                            <td>${tariff.description}</td>
                                            <td>
                                                <form action="controller?action=account" method="post">
                                                    <input type="hidden" name="tariff_id" value="${tariff.id}">
                                                    <div class="d-flex justify-content-end">
                                                        <button type="submit" class="btn btn-outline-secondary btn-sm">
                                                            <i class="material-icons">print</i>
                                                        </button>
                                                    </div>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center">
                            <p class="text-uppercase font-weight-bold"><fmt:message
                                    key="account.menu.private_office.title.connect_new_services"/></p>
                        </div>
                        <form class="mt-2" method="post" action="controller?action=personal_data">
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <div class="d-flex">
                                        <div class="flex-fill">
                                            <button class="btn btn-outline-success" style="width: 100%"
                                                    type="button"
                                                    data-toggle="collapse"
                                                    data-target="#collapse-inet-tariff"
                                                    aria-expanded="false"
                                                    aria-controls="collapse-inet-tariff">
                                                <fmt:message key="account.menu.private_office.button.internet"/>
                                            </button>
                                        </div>
                                        <div class="flex-fill ml-1">
                                            <button class="btn btn-outline-warning" style="width: 100%"
                                                    type="button"
                                                    data-toggle="collapse"
                                                    data-target="#collapse-iptv-tariff"
                                                    aria-expanded="false"
                                                    aria-controls="collapse-iptv-tariff">
                                                <fmt:message key="account.menu.private_office.button.iptv"/>
                                            </button>
                                        </div>
                                        <div class="flex-fill ml-1">
                                            <button class="btn btn-outline-info" style="width: 100%"
                                                    type="button"
                                                    data-toggle="collapse"
                                                    data-target="#collapse-phone-tariff"
                                                    aria-expanded="false"
                                                    aria-controls="collapse-phone-tariff">
                                                <fmt:message key="account.menu.private_office.button.phone"/>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="collapse mt-2" id="collapse-inet-tariff">
                                        <div class="card card-body">
                                            <h4><fmt:message
                                                    key="account.menu.private_office.card.title.internet"/></h4>
                                            <table class="table table-hover mt-2">
                                                <thead>
                                                <tr>
                                                    <th scope="col">
                                                        <div class="d-flex justify-content-center">
                                                            <button type="submit" class="btn btn-sm btn-link"
                                                                    name="name_inet_asc">
                                                                <i class="material-icons">
                                                                    arrow_drop_down
                                                                </i>
                                                            </button>
                                                            <fmt:message key="table.th.tariff"/>
                                                            <button type="submit" class="btn btn-sm btn-link"
                                                                    name="name_inet_desc">
                                                                <i class="material-icons">
                                                                    arrow_drop_up
                                                                </i>
                                                            </button>
                                                        </div>
                                                    </th>
                                                    <th scope="col">
                                                        <div class="d-flex justify-content-center">
                                                            <button type="submit" class="btn btn-sm btn-link"
                                                                    name="price_inet_asc">
                                                                <i class="material-icons">
                                                                    arrow_drop_down
                                                                </i>
                                                            </button>
                                                            <fmt:message key="table.th.cost"/>
                                                            <button type="submit" class="btn btn-sm btn-link"
                                                                    name="price_inet_desc">
                                                                <i class="material-icons">
                                                                    arrow_drop_up
                                                                </i>
                                                            </button>
                                                        </div>
                                                    </th>
                                                    <th scope="col">
                                                        <div class="d-flex justify-content-center">
                                                            <fmt:message key="table.th.description"/>
                                                        </div>
                                                    </th>
                                                    <th scope="col"></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="inetTariff" items="${internetTariffs}">
                                                    <c:set var="count" value="0"/>
                                                    <c:forEach var="userTariffs" items="${fullUser.tariffs}">
                                                        <c:if test="${userTariffs.id == inetTariff.id}">
                                                            <c:set var="count" value="1"/>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${count==0}">
                                                        <tr>
                                                            <td>
                                                                <div class="d-flex justify-content-start">
                                                                        ${inetTariff.name}
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="d-flex justify-content-center">
                                                                        ${inetTariff.price}
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="d-flex justify-content-start">
                                                                        ${inetTariff.description}
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="d-flex justify-content-end">
                                                                    <div class="btn-group-toggle"
                                                                         data-toggle="buttons">
                                                                        <label class="btn btn-outline-success">
                                                                            <input type="checkbox"
                                                                                   name="arrTrafficsId"
                                                                                   value="${inetTariff.id}">
                                                                            <fmt:message
                                                                                    key="account.menu.private_office.button.connect_tariff"/>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="collapse mt-2" id="collapse-iptv-tariff">
                                        <div class="card card-body">
                                            <h4><fmt:message key="account.menu.private_office.card.title.iptv"/></h4>
                                            <table class="table table-hover mt-2">
                                                <thead>
                                                <tr>
                                                    <th scope="col">
                                                        <div class="d-flex justify-content-center">
                                                            <button type="submit" class="btn btn-sm btn-link"
                                                                    name="name_iptv_asc">
                                                                <i class="material-icons">
                                                                    arrow_drop_down
                                                                </i>
                                                            </button>
                                                            <fmt:message key="table.th.tariff"/>
                                                            <button type="submit" class="btn btn-sm btn-link"
                                                                    name="name_iptv_desc">
                                                                <i class="material-icons">
                                                                    arrow_drop_up
                                                                </i>
                                                            </button>
                                                        </div>
                                                    </th>
                                                    <th scope="col">
                                                        <div class="d-flex justify-content-center">
                                                            <button type="submit" class="btn btn-sm btn-link"
                                                                    name="price_iptv_asc">
                                                                <i class="material-icons">
                                                                    arrow_drop_down
                                                                </i>
                                                            </button>
                                                            <fmt:message key="table.th.cost"/>
                                                            <button type="submit" class="btn btn-sm btn-link"
                                                                    name="price_iptv_desc">
                                                                <i class="material-icons">
                                                                    arrow_drop_up
                                                                </i>
                                                            </button>
                                                        </div>
                                                    </th>
                                                    <th scope="col">
                                                        <div class="d-flex justify-content-center">
                                                            <fmt:message key="table.th.description"/>
                                                        </div>
                                                    </th>
                                                    <th scope="col"></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="iptvTariff" items="${iptvTariffs}">
                                                    <c:set var="count" value="0"/>
                                                <c:forEach var="userTariffs" items="${fullUser.tariffs}">
                                                <c:if test="${userTariffs.id == iptvTariff.id}">
                                                    <c:set var="count" value="1"/>
                                                </c:if>
                                                </c:forEach>
                                                <c:if test="${count==0}">
                                                <tr>
                                                    <td>
                                                        <div class="d-flex justify-content-start">
                                                                ${iptvTariff.name}
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex justify-content-center">
                                                                ${iptvTariff.price}
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex justify-content-start">
                                                                ${iptvTariff.description}
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex justify-content-end">
                                                            <div class="btn-group-toggle"
                                                                 data-toggle="buttons">
                                                                <label class="btn btn-outline-success">
                                                                    <input type="checkbox"
                                                                           name="arrTrafficsId"
                                                                           value="${iptvTariff.id}">
                                                                    <fmt:message
                                                                            key="account.menu.private_office.button.connect_tariff"/>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </c:if>
                                                </c:forEach>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="collapse mt-2" id="collapse-phone-tariff">
                                        <div class="card card-body">
                                            <h4><fmt:message key="account.menu.private_office.card.title.phone"/></h4>
                                            <table class="table table-hover mt-2">
                                                <thead>
                                                <tr>
                                                    <th scope="col">
                                                        <div class="d-flex justify-content-center">
                                                            <button type="submit" class="btn btn-sm btn-link"
                                                                    name="name_phone_asc">
                                                                <i class="material-icons">
                                                                    arrow_drop_down
                                                                </i>
                                                            </button>
                                                            <fmt:message key="table.th.tariff"/>
                                                            <button type="submit" class="btn btn-sm btn-link"
                                                                    name="name_phone_desc">
                                                                <i class="material-icons">
                                                                    arrow_drop_up
                                                                </i>
                                                            </button>
                                                        </div>
                                                    </th>
                                                    <th scope="col">
                                                        <div class="d-flex justify-content-center">
                                                            <button type="submit" class="btn btn-sm btn-link"
                                                                    name="price_phone_asc">
                                                                <i class="material-icons">
                                                                    arrow_drop_down
                                                                </i>
                                                            </button>
                                                            <fmt:message key="table.th.cost"/>
                                                            <button type="submit" class="btn btn-sm btn-link"
                                                                    name="price_phone_desc">
                                                                <i class="material-icons">
                                                                    arrow_drop_up
                                                                </i>
                                                            </button>
                                                        </div>
                                                    </th>
                                                    <th scope="col">
                                                        <div class="d-flex justify-content-center">
                                                            <fmt:message key="table.th.description"/>
                                                        </div>
                                                    </th>
                                                    <th scope="col"></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="phonyTariff" items="${telephonyTariffs}">
                                                    <c:set var="count" value="0"/>
                                                    <c:forEach var="userTariffs" items="${fullUser.tariffs}">
                                                        <c:if test="${userTariffs.id == phonyTariff.id}">
                                                            <c:set var="count" value="1"/>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${count==0}">
                                                        <tr>
                                                            <td>
                                                                <div class="d-flex justify-content-start">
                                                                        ${phonyTariff.name}
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="d-flex justify-content-center">
                                                                        ${phonyTariff.price}
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="d-flex justify-content-start">
                                                                        ${phonyTariff.description}
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="d-flex justify-content-end">
                                                                    <div class="btn-group-toggle"
                                                                         data-toggle="buttons">
                                                                        <label class="btn btn-outline-success">
                                                                            <input type="checkbox"
                                                                                   name="arrTrafficsId"
                                                                                   value="${phonyTariff.id}">
                                                                            <fmt:message
                                                                                    key="account.menu.private_office.button.connect_tariff"/>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">
                                <fmt:message key="account.menu.private_office.button.save_changes"/>
                            </button>
                        </form>
                    </div>
                    <div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
                         aria-labelledby="v-pills-profile-tab">
                        <div class="card border-primary mt-3 p-3">
                            <div class="row">
                                <div class="col">
                                    <form action="controller?action=account" method="post">
                                        <div class="form-group">
                                            <c:if test="${not empty errorMessage}">
                                                <div class="alert alert-danger" role="alert">${errorMessage}</div>
                                            </c:if>
                                            <label for="inputEmail">
                                                <fmt:message key="account.menu.edit.label.email"/>
                                            </label>
                                            <input type="email" class="form-control" id="inputEmail"
                                                   aria-describedby="emailHelp" name="inputEmail"
                                                   placeholder="<fmt:message key="account.menu.edit.placeholder.email"/>"
                                                   required>
                                        </div>
                                        <button type="submit" name="btnEmail" class="btn btn-primary">
                                            <fmt:message key="account.menu.edit.button.save"/>
                                        </button>
                                    </form>
                                </div>
                                <div class="col">
                                    <form action="controller?action=account" method="post">
                                        <div class="form-group">
                                            <c:if test="${not empty errorMessage}">
                                                <div class="alert alert-danger" role="alert">${errorMessage}</div>
                                            </c:if>
                                            <label for="inputPassword">
                                                <fmt:message key="account.menu.edit.label.password"/>
                                            </label>
                                            <input type="password" class="form-control" id="inputPassword"
                                                   placeholder="<fmt:message key="account.menu.edit.placeholder.password"/>"
                                                   name="inputPassword" minlength="6" required>
                                        </div>
                                        <button type="submit" name="btnPassword" class="btn btn-primary">
                                            <fmt:message key="account.menu.edit.button.save"/>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<jsp:include page="/WEB-INF/templates/_scripts.jsp"></jsp:include>
</body>
</html>