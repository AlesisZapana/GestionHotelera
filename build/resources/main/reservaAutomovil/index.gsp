<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reservaAutomovil.label', default: 'ReservaAutomovil')}" />
        <title>Lista de Reservas de Automoviles</title>
    </head>
    <body>
        <a class="badge badge-primary" href="/Automovil">Automoviles Disponibles</a>
        <a class="badge badge-primary" href="/Automovil/create" role="button">Nuevo tipo de automovil</a>
        <a class="badge badge-primary" href="/Automovil/agregar">Agregar automoviles</a>
        <div id="list-reservaAutomovil" class="content scaffold-list" role="main">
            <h1>Automoviles reservados</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <!--<f:table collection="${reservaAutomovilList}" />-->

            <table class="table table-sm" collection="${reservaAutomovilList}">
                <thead>
                    <g:sortableColumn property="id" title="ID"><th scope="col"></th></g:sortableColumn>
                    <g:sortableColumn property="auto" title="Tipo de Auto"><th scope="col"></th></g:sortableColumn>
                    <g:sortableColumn property="start" title="Desde"><th scope="col"></th></g:sortableColumn>
                    <g:sortableColumn property="end" title="Hasta"><th scope="col"></th></g:sortableColumn>
                    <g:sortableColumn property="titular" title="Titular"><th scope="col"></th></g:sortableColumn>
                </thead>
                <tbody>
                    <g:each in="${reservaAutomovilList}" var="reserva">
                    <tr>
                        <td>${reserva.id}</td>
                        <td>${reserva.tipoAutomovil}</td>
                        <td>${reserva.start}</td>
                        <td>${reserva.end}</td>
                        <td><g:link controller="huesped" action="show" id="${reserva.titular.id}">${reserva.titular}</g:link></td>
                    </tr>
                    </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${reservaAutomovilCount ?: 0}" />
            </div>
        </div>
    </body>
</html>