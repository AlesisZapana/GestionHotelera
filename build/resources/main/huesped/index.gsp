<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'huesped.label', default: 'Huesped')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        
        <div id="list-huesped" class="content scaffold-list" role="main">
            <h1>Titulares Registrados</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table class="table table-sm" collection="${huespedList}">
                <thead>
                    <g:sortableColumn property="id" title="ID"><th scope="col"></th></g:sortableColumn>
                    <g:sortableColumn property="tipoDocumento" title="Tipo de Documento" ><th scope="col"></th></g:sortableColumn>
                    <g:sortableColumn property="numeroDocumento" title="Número de Documento" ><th scope="col"></th></g:sortableColumn>
                    <g:sortableColumn property="nombre" title="Nombre" ><th scope="col"></th></g:sortableColumn>
                    <g:sortableColumn property="apellido" title="Apellido" ><th scope="col"></th></g:sortableColumn>
                    <g:sortableColumn property="tipoReserva" title="Reserva"><th scope="col"></th></g:sortableColumn>
                    <g:sortableColumn property="email" title="E-Mail" ><th scope="col"></th></g:sortableColumn>
                </thead>
                <tbody>
                    <g:each in="${huespedList}" var="huesped">
                    <tr>
                        <td>${huesped.id}</td>
                        <td>${huesped.tipoDocumento}</td>
                        <td>${huesped.numeroDocumento}</td>
                        <td>${huesped.nombre}</td>
                        <td>${huesped.apellido}</td>
                        <td>${huesped.tipoReserva}</td>
                        <td>${huesped.email}</td>
                    </tr>
                    </g:each>
                </tbody>

            </table>
            <div class="pagination">
                <g:paginate total="${huespedCount ?: 0}" />
            </div>
        </div>
    </body>
</html>