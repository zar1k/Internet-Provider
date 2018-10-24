<%@ include file="/WEB-INF/jspf/directive/taglib.jspf" %>
<%@ include file="/WEB-INF/jspf/directive/page.jspf" %>

<!doctype html>
<html>
<c:set var="title" value="Панель администратора" scope="page"/>
<jsp:include page="/WEB-INF/templates/_head.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/templates/_menu.jsp"></jsp:include>
<div class="container">
    <div class="card mt-3 mb-3">
        <div class="card-header">
            <div>
                <div class="d-flex justify-content-start">
                    <fmt:message key="main.card.header"/>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <%-- Вертикальные табы Услуги|Абоненты --%>
                <div class="col-2">
                    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="nav-link active" id="v-pills-services-tab" data-toggle="pill" href="#v-pills-services"
                           role="tab" aria-controls="v-pills-services" aria-selected="true">
                            <fmt:message key="main.menu.button.services"/>
                        </a>
                        <a class="nav-link" id="v-pills-users-tab" data-toggle="pill" href="#v-pills-users" role="tab"
                           aria-controls="v-pills-users" aria-selected="false">
                            <fmt:message key="main.menu.button.subscribers"/>
                        </a>
                    </div>
                </div>
                <%-- Горизонтальные табы Интернет|Цифровое ТВ (IPTV)|Телефонная связь|Новый тариф --%>
                <div class="col-10">
                    <div class="tab-content" id="v-pills-tabContent">
                        <div class="tab-pane fade show active" id="v-pills-services" role="tabpanel"
                             aria-labelledby="v-pills-services-tab">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="internet-tab" data-toggle="tab" href="#internet"
                                       role="tab"
                                       aria-controls="internet" aria-selected="true">
                                        <fmt:message key="main.tab.internet"/>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="iptv-tab" data-toggle="tab" href="#iptv" role="tab"
                                       aria-controls="iptv"
                                       aria-selected="false">
                                        <fmt:message key="main.tab.iptv"/>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="telephony-tab" data-toggle="tab" href="#telephony"
                                       role="tab"
                                       aria-controls="telephony" aria-selected="false">
                                        <fmt:message key="main.tab.phone"/>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="new-tariff-tab" data-toggle="tab" href="#new-tariff"
                                       role="tab"
                                       aria-controls="new-tariff" aria-selected="false">
                                        <fmt:message key="main.tab.new_tariff"/>
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <%-- Интернет --%>
                                <div class="tab-pane fade show active" id="internet" role="tabpanel"
                                     aria-labelledby="internet-tab">
                                    <table class="table table-hover mt-2">
                                        <thead>
                                        <tr>
                                            <th scope="col">
                                                <fmt:message key="table.th.tariff"/>
                                            </th>
                                            <th scope="col">
                                                <fmt:message key="table.th.cost"/>
                                            </th>
                                            <th scope="col">
                                                <fmt:message key="table.th.description"/>
                                            </th>
                                            <th scope="col"></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="intTariff" items="${internetTariffs}">
                                            <tr>
                                                <td>${intTariff.name}</td>
                                                <td>${intTariff.price}</td>
                                                <td>${intTariff.description}</td>
                                                <td>
                                                    <div class="d-flex justify-content-end">
                                                        <div>
                                                            <button type="submit"
                                                                    class="btn btn-outline-secondary btn-sm"
                                                                    data-toggle="modal"
                                                                    data-target="#editInetModalCenter${intTariff.id}">
                                                                <i class="material-icons">create</i>
                                                            </button>
                                                            <!-- Modal -->
                                                            <div class="modal fade bd-example-modal-lg"
                                                                 id="editInetModalCenter${intTariff.id}"
                                                                 tabindex="-1"
                                                                 role="dialog"
                                                                 aria-labelledby="editInetModalCenterTitle"
                                                                 aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered modal-lg"
                                                                     role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title"
                                                                                id="editInetModalCenterTitle">
                                                                                    ${intTariff.name}
                                                                            </h5>
                                                                            <button type="button" class="close"
                                                                                    data-dismiss="modal"
                                                                                    aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <form method="post"
                                                                                  action="controller?action=edit_tariff">
                                                                                <div class="form-group">
                                                                                    <div class="row">
                                                                                        <div class="col">
                                                                                            <input type="text"
                                                                                                   name="name"
                                                                                                   class="form-control"
                                                                                                   placeholder="Название"
                                                                                                   value="${intTariff.name}"
                                                                                                   minlength="1"
                                                                                                   maxlength="40"
                                                                                                   required>
                                                                                        </div>
                                                                                        <div class="col">
                                                                                            <input type="number"
                                                                                                   step="0.01"
                                                                                                   name="price"
                                                                                                   class="form-control"
                                                                                                   placeholder="Стоимость грн./мес."
                                                                                                   value="${intTariff.price}"
                                                                                                   min="0" minlength="1"
                                                                                                   required>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="description">
                                                                                        <fmt:message
                                                                                                key="main.modal.description"/>
                                                                                    </label>
                                                                                    <textarea class="form-control"
                                                                                              name="description"
                                                                                              rows="3" minlength="10"
                                                                                              maxlength="250"
                                                                                              required>${intTariff.description}
                                                                                    </textarea>
                                                                                </div>
                                                                                <input type="hidden" name="tariff_id"
                                                                                       value="${intTariff.id}">
                                                                                <div class="d-flex justify-content-end">
                                                                                    <button type="submit"
                                                                                            class="btn btn-outline-primary">
                                                                                        <fmt:message
                                                                                                key="main.modal.button.save"/>
                                                                                    </button>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="ml-1">
                                                            <form action="controller?action=remove_tariff"
                                                                  method="post">
                                                                <input type="hidden" name="tariff_id"
                                                                       value="${intTariff.id}">
                                                                <button type="submit"
                                                                        class="btn btn-outline-secondary btn-sm">
                                                                    <i class="material-icons">delete_outline</i>
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <%-- IPTV --%>
                                <div class="tab-pane fade" id="iptv" role="tabpanel" aria-labelledby="iptv-tab">
                                    <table class="table table-hover mt-2">
                                        <thead>
                                        <tr>
                                            <th scope="col">
                                                <fmt:message key="table.th.tariff"/>
                                            </th>
                                            <th scope="col">
                                                <fmt:message key="table.th.cost"/>
                                            </th>
                                            <th scope="col">
                                                <fmt:message key="table.th.description"/>
                                            </th>
                                            <th scope="col"></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="iptvTariff" items="${iptvTariffs}">
                                        <tr>
                                            <td>${iptvTariff.name}</td>
                                            <td>${iptvTariff.price}</td>
                                            <td>${iptvTariff.description}</td>
                                            <td>
                                                <div class="d-flex justify-content-end">
                                                    <div>
                                                        <button type="submit" class="btn btn-outline-secondary btn-sm"
                                                                data-toggle="modal"
                                                                data-target="#editIPTVModalCenter${iptvTariff.id}">
                                                            <i class="material-icons">create</i>
                                                        </button>
                                                        <!-- Modal -->
                                                        <div class="modal fade bd-example-modal-lg"
                                                             id="editIPTVModalCenter${iptvTariff.id}"
                                                             tabindex="-1"
                                                             role="dialog"
                                                             aria-labelledby="editIPTVModalCenterTitle"
                                                             aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered modal-lg"
                                                                 role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title"
                                                                            id="editIPTVModalCenterTitle">
                                                                                ${iptvTariff.name}
                                                                        </h5>
                                                                        <button type="button" class="close"
                                                                                data-dismiss="modal"
                                                                                aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <form method="post"
                                                                              action="controller?action=edit_tariff">
                                                                            <div class="form-group">
                                                                                <div class="row">
                                                                                    <div class="col">
                                                                                        <input type="text" name="name"
                                                                                               class="form-control"
                                                                                               placeholder="Название"
                                                                                               value="${iptvTariff.name}"
                                                                                               minlength="1"
                                                                                               maxlength="40"
                                                                                               required>
                                                                                    </div>
                                                                                    <div class="col">
                                                                                        <input type="number"
                                                                                               name="price"
                                                                                               step="0.01"
                                                                                               class="form-control"
                                                                                               placeholder="Стоимость"
                                                                                               value="${iptvTariff.price}"
                                                                                               min="0" minlength="1"
                                                                                               required>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="description">
                                                                                    <fmt:message
                                                                                            key="main.modal.description"/>
                                                                                </label>
                                                                                <textarea class="form-control"
                                                                                          name="description"
                                                                                          rows="3" minlength="10"
                                                                                          maxlength="250"
                                                                                          required>${iptvTariff.description}</textarea>
                                                                            </div>
                                                                            <input type="hidden" name="tariff_id"
                                                                                   value="${iptvTariff.id}">
                                                                            <div class="d-flex justify-content-end">
                                                                                <button type="submit"
                                                                                        class="btn btn-outline-primary">
                                                                                    <fmt:message
                                                                                            key="main.modal.button.save"/>
                                                                                </button>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ml-1">
                                                        <form action="controller?action=remove_tariff" method="post">
                                                            <input type="hidden" name="tariff_id"
                                                                   value="${iptvTariff.id}">
                                                            <button type="submit"
                                                                    class="btn btn-outline-secondary btn-sm">
                                                                <i class="material-icons">delete_outline</i>
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                                <%-- Телефония --%>
                                <div class="tab-pane fade" id="telephony" role="tabpanel"
                                     aria-labelledby="telephony-tab">
                                    <table class="table table-hover mt-2">
                                        <thead>
                                        <tr>
                                            <th scope="col">
                                                <fmt:message key="table.th.tariff"/>
                                            </th>
                                            <th scope="col">
                                                <fmt:message key="table.th.cost"/>
                                            </th>
                                            <th scope="col">
                                                <fmt:message key="table.th.description"/>
                                            </th>
                                            <th scope="col"></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="phoneTariff" items="${telephonyTariffs}">
                                            <tr>
                                                <td>${phoneTariff.name}</td>
                                                <td>${phoneTariff.price}</td>
                                                <td>${phoneTariff.description}</td>
                                                <td>
                                                    <div class="d-flex justify-content-end">
                                                        <div>
                                                            <button type="submit"
                                                                    class="btn btn-outline-secondary btn-sm"
                                                                    data-toggle="modal"
                                                                    data-target="#editPhoneModalCenter${phoneTariff.id}">
                                                                <i class="material-icons">create</i>
                                                            </button>
                                                            <!-- Modal -->
                                                            <div class="modal fade bd-example-modal-lg"
                                                                 id="editPhoneModalCenter${phoneTariff.id}"
                                                                 tabindex="-1"
                                                                 role="dialog"
                                                                 aria-labelledby="editPhoneModalCenterTitle"
                                                                 aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered modal-lg"
                                                                     role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title"
                                                                                id="editPhoneModalCenterTitle">
                                                                                    ${phoneTariff.name}
                                                                            </h5>
                                                                            <button type="button" class="close"
                                                                                    data-dismiss="modal"
                                                                                    aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <form method="post"
                                                                                  action="controller?action=edit_tariff">
                                                                                <div class="form-group">
                                                                                    <div class="row">
                                                                                        <div class="col">
                                                                                            <input type="text"
                                                                                                   name="name"
                                                                                                   class="form-control"
                                                                                                   placeholder="Название"
                                                                                                   value="${phoneTariff.name}"
                                                                                                   minlength="1"
                                                                                                   maxlength="40"
                                                                                                   required>
                                                                                        </div>
                                                                                        <div class="col">
                                                                                            <input type="number"
                                                                                                   name="price"
                                                                                                   step="0.01"
                                                                                                   class="form-control"
                                                                                                   placeholder="Стоимость"
                                                                                                   value="${phoneTariff.price}"
                                                                                                   min="0" minlength="1"
                                                                                                   required>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="description">
                                                                                        <fmt:message
                                                                                                key="main.modal.description"/>
                                                                                    </label>
                                                                                    <textarea class="form-control"
                                                                                              name="description"
                                                                                              rows="3" minlength="10"
                                                                                              maxlength="250"
                                                                                              required>${phoneTariff.description}</textarea>
                                                                                </div>
                                                                                <input type="hidden" name="tariff_id"
                                                                                       value="${phoneTariff.id}">
                                                                                <div class="d-flex justify-content-end">
                                                                                    <button type="submit"
                                                                                            class="btn btn-outline-primary">
                                                                                        <fmt:message
                                                                                                key="main.modal.button.save"/>
                                                                                    </button>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="ml-1">
                                                            <form action="controller?action=remove_tariff"
                                                                  method="post">
                                                                <input type="hidden" name="tariff_id"
                                                                       value="${phoneTariff.id}">
                                                                <button type="submit"
                                                                        class="btn btn-outline-secondary btn-sm">
                                                                    <i class="material-icons">delete_outline</i>
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <%--Добавить тариф --%>
                                <div class="tab-pane fade" id="new-tariff" role="tabpanel"
                                     aria-labelledby="new-tariff-tab">
                                    <form class="mt-2" method="post" action="controller?action=add_tariff">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col">
                                                    <input type="text" name="name" class="form-control"
                                                           placeholder="<fmt:message key="main.modal.placeholder.name"/>"
                                                           minlength="1"
                                                           maxlength="40"
                                                           required>
                                                </div>
                                                <div class="col">
                                                    <input type="number" name="price" class="form-control"
                                                           step="0.01"
                                                           placeholder="<fmt:message key="main.modal.placeholder.price"/>"
                                                           min="0" minlength="1"
                                                           required>
                                                </div>
                                                <div class="col">
                                                    <select class="custom-select" name="serviceId">
                                                        <c:forEach var="service" items="${services}">
                                                            <option value="${service.id}">${service.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="description">
                                                <fmt:message key="main.modal.description"/>
                                            </label>
                                            <textarea class="form-control" id="description" name="description"
                                                      rows="3" minlength="10"
                                                      maxlength="250"
                                                      required></textarea>
                                        </div>
                                        <button type="submit" class="btn btn-primary">
                                            <fmt:message key="main.modal.button.save"/>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <%-- Абоненты--%>
                        <div class="tab-pane fade" id="v-pills-users" role="tabpanel"
                             aria-labelledby="v-pills-users-tab">
                            <ul class="nav nav-tabs" id="usersTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="users-tab" data-toggle="tab" href="#users"
                                       role="tab"
                                       aria-controls="users" aria-selected="true">
                                        <fmt:message key="main.tab.subscriber"/>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="new-user-tab" data-toggle="tab" href="#new-user" role="tab"
                                       aria-controls="new-user"
                                       aria-selected="false">
                                        <fmt:message key="main.tab.new_subscriber"/>
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content" id="usersTabContent">
                                <%-- Список абонентов --%>
                                <div class="tab-pane fade show active" id="users" role="tabpanel"
                                     aria-labelledby="internet-tab">
                                    <table class="table table-hover mt-2">
                                        <thead>
                                        <tr>
                                            <th scope="col">
                                                <fmt:message key="table.th.surname"/>
                                            </th>
                                            <th scope="col">
                                                <fmt:message key="table.th.name"/>
                                            </th>
                                            <th scope="col">
                                                <fmt:message key="table.th.last_name"/>
                                            </th>
                                            <th scope="col">
                                                <fmt:message key="table.th.account"/>
                                            </th>
                                            <th scope="col">
                                                <fmt:message key="table.th.balance"/>
                                            </th>
                                            <th scope="col">
                                                <fmt:message key="table.th.status"/>
                                            </th>
                                            <th scope="col"></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="fullUser" items="${fullUser}">
                                            <tr>
                                                <td>${fullUser.surname}</td>
                                                <td>${fullUser.firstName}</td>
                                                <td>${fullUser.lastName}</td>
                                                <td>${fullUser.account.number}</td>
                                                <td>${fullUser.account.balance}</td>
                                                <td><tags:isblocked value="${fullUser.blocked}"/></td>
                                                <td>
                                                    <div class="d-flex justify-content-end">
                                                        <div>
                                                            <form action="controller?action=edit_client"
                                                                  method="post">
                                                                <input type="hidden" name="user_id"
                                                                       value="${fullUser.id}">
                                                                <button type="submit"
                                                                        class="btn btn-outline-secondary btn-sm"
                                                                        name="btnLock">
                                                                        ${fullUser.blocked ? '<i class="material-icons">lock_open</i>' : '<i class="material-icons">lock</i>'}
                                                                </button>
                                                            </form>
                                                        </div>
                                                        <div class="ml-1">
                                                            <form method="post" action="controller?action=profile">
                                                                <input type="hidden" name="user_id"
                                                                       value="${fullUser.id}">
                                                                <button type="submit"
                                                                        class="btn btn-outline-secondary btn-sm">
                                                                    <i class="material-icons">info</i>
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <%-- Новый абонент --%>
                                <div class="tab-pane fade" id="new-user" role="tabpanel" aria-labelledby="new-user-tab">
                                    <form class="mt-2" method="post" action="controller?action=registration">
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="surname">
                                                    <fmt:message key="table.th.surname"/>
                                                </label>
                                                <input type="text" class="form-control" id="surname" name="surname"
                                                       placeholder="<fmt:message key="profile.modal.placeholder.surname"/>"
                                                       minlength="2" maxlength="40" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="city">
                                                    <fmt:message key="main.new_user.label.city"/>
                                                </label>
                                                <input type="text" class="form-control" id="city" name="city"
                                                       placeholder="<fmt:message key="main.new_user.placeholder.city"/>"
                                                       minlength="2" maxlength="40" required>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="firstName">
                                                    <fmt:message key="profile.modal.label.name"/>
                                                </label>
                                                <input type="text" class="form-control" id="firstName" name="firstName"
                                                       placeholder="<fmt:message key="profile.modal.placeholder.name"/>"
                                                       minlength="2" maxlength="40" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <div class="d-flex">
                                                    <div class="flex-fill">
                                                        <label for="street">
                                                            <fmt:message key="main.new_user.label.street"/>
                                                        </label>
                                                        <input type="text" class="form-control" id="street"
                                                               name="street"
                                                               placeholder="<fmt:message key="main.new_user.placeholder.street"/>"
                                                               minlength="2"
                                                               maxlength="40" required>
                                                    </div>
                                                    <div class="flex-fill ml-1">
                                                        <label for="home">
                                                            <fmt:message key="main.new_user.label.home"/>
                                                        </label>
                                                        <input type="text" class="form-control" id="home" name="home"
                                                               placeholder="<fmt:message key="main.new_user.placeholder.home"/>"
                                                               minlength="2" maxlength="40" required>
                                                    </div>
                                                    <div class="flex-fill ml-1">
                                                        <label for="apartment">
                                                            <fmt:message key="main.new_user.label.apartment"/>
                                                        </label>
                                                        <input type="text" class="form-control" id="apartment"
                                                               name="apartment"
                                                               placeholder="125а" minlength="2" maxlength="40" required>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="lastName">
                                                    <fmt:message key="profile.modal.label.last_name"/>
                                                </label>
                                                <input type="text" class="form-control" id="lastName" name="lastName"
                                                       placeholder="<fmt:message key="profile.modal.placeholder.last_name"/>"
                                                       minlength="2" maxlength="40" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <div class="d-flex">
                                                    <div class="flex-fill">
                                                        <label for="email">
                                                            <fmt:message key="account.menu.edit.label.email"/>
                                                        </label>
                                                        <input type="email" class="form-control" id="email" name="email"
                                                               placeholder="my_email@gmail.com" minlength="2"
                                                               maxlength="40" required>
                                                    </div>
                                                    <div class="flex-fill ml-1">
                                                        <label for="phone">
                                                            <fmt:message key="main.new_user.placeholder.phone"/>
                                                        </label>
                                                        <input type="tel" class="form-control" id="phone" name="phone"
                                                               value="+380" size="13" maxlength="13" minlength="2"
                                                               maxlength="40" required
                                                               placeholder="+380991234567">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
                                                            <fmt:message
                                                                    key="account.menu.private_office.button.internet"/>
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
                                                            <fmt:message
                                                                    key="account.menu.private_office.button.phone"/>
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
                                                                    <fmt:message key="table.th.tariff"/>
                                                                </th>
                                                                <th scope="col">
                                                                    <fmt:message key="table.th.cost"/>
                                                                </th>
                                                                <th scope="col">
                                                                    <fmt:message key="table.th.description"/>
                                                                </th>
                                                                <th scope="col"></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:forEach var="fullUser" items="${internetTariffs}">
                                                                <tr>
                                                                    <td>${fullUser.name}</td>
                                                                    <td>${fullUser.price}</td>
                                                                    <td>${fullUser.description}</td>
                                                                    <td>
                                                                        <div class="d-flex justify-content-end">
                                                                            <label>
                                                                                <input type="checkbox"
                                                                                       name="arrTrafficsId"
                                                                                       value="${fullUser.id}">
                                                                            </label>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="collapse mt-2" id="collapse-iptv-tariff">
                                                    <div class="card card-body">
                                                        <h4><fmt:message key="main.tab.iptv"/></h4>
                                                        <table class="table table-hover mt-2">
                                                            <thead>
                                                            <tr>
                                                                <th scope="col">
                                                                    <fmt:message key="table.th.tariff"/>
                                                                </th>
                                                                <th scope="col">
                                                                    <fmt:message key="table.th.cost"/>
                                                                </th>
                                                                <th scope="col">
                                                                    <fmt:message key="table.th.description"/>
                                                                </th>
                                                                <th scope="col"></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:forEach var="fullUser" items="${iptvTariffs}">
                                                            <tr>
                                                                <td>${fullUser.name}</td>
                                                                <td>${fullUser.price}</td>
                                                                <td>${fullUser.description}</td>
                                                                <td>
                                                                    <div class="d-flex justify-content-end">
                                                                        <label>
                                                                            <input type="checkbox" name="arrTrafficsId"
                                                                                   value="${fullUser.id}">
                                                                        </label>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            </c:forEach>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="collapse mt-2" id="collapse-phone-tariff">
                                                    <div class="card card-body">
                                                        <h4><fmt:message key="main.tab.phone"/></h4>
                                                        <table class="table table-hover mt-2">
                                                            <thead>
                                                            <tr>
                                                                <th scope="col">
                                                                    <fmt:message key="table.th.tariff"/>
                                                                </th>
                                                                <th scope="col">
                                                                    <fmt:message key="table.th.cost"/>
                                                                </th>
                                                                <th scope="col">
                                                                    <fmt:message key="table.th.description"/>
                                                                </th>
                                                                <th scope="col"></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:forEach var="fullUser" items="${telephonyTariffs}">
                                                                <tr>
                                                                    <td>${fullUser.name}</td>
                                                                    <td>${fullUser.price}</td>
                                                                    <td>${fullUser.description}</td>
                                                                    <td>
                                                                        <div class="d-flex justify-content-end">
                                                                            <label>
                                                                                <input type="checkbox"
                                                                                       name="arrTrafficsId"
                                                                                       value="${fullUser.id}">
                                                                            </label>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary">
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
<jsp:include page="/WEB-INF/templates/_scripts.jsp"></jsp:include>
</body>
</html>