<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reserva.label', default: 'Reserva')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="list-reserva" class="content scaffold-list" role="main">
            <h1>Reservas Aceptadas</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <table class="table table-sm" collection="${reservaList}">
                <thead>
                    <g:sortableColumn property="id" title="id"><th scope="col"></th></g:sortableColumn>
                    <g:sortableColumn property="fechaReserva" title="Fecha"><th scope="col"></th></g:sortableColumn>
                    <g:sortableColumn property="cantidadHuespedes" title="Cantidad de Huespedes"><th scope="col"></th></g:sortableColumn>
                    <g:sortableColumn property="habitacion" title="Habitacion"><th scope="col"></th></g:sortableColumn>
                    <g:sortableColumn property="titular" title="Titular"><th scope="col"></th></g:sortableColumn>
                </thead>
                <tbody>
                    <g:each in="${reservaList}" var="reserva">
                    <tr>
                        <td>${reserva.id}</td>
                        <td>${reserva.fechaReserva}</td>
                        <td>${reserva.cantidadHuespedes}</td>
                        <td>${reserva.habitacion}</td>
                        <td><g:link controller="huesped" action="show" id="${reserva.titular.id}"> ${reserva.titular}</g:link></td>
                    </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${reservaCount ?: 0}" />
            </div>
        </div>
    </body>
</html>