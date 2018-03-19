<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'habitacion.label', default: 'Habitacion')}" />
        <title>Lista de Habitaciones</title>
    </head>
    <body>
        <div id="list-habitacion" class="content scaffold-list" role="main">
            <a class="badge badge-primary" href="/habitacion/create">Nueva habitacion</a>
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            
            <table class="table table-sm" collection="${habitacionList}">
            <tbody>
            <thead>
                <g:sortableColumn property="id" title="Numero de Habitacion"> <th scope="col"></th></g:sortableColumn>
                <g:sortableColumn property="plazas" title="Plazas"><th scope="col">Plazas</th></g:sortableColumn>
                <g:sortableColumn property="disponibilidad" title="Disponible"><th scope="col"></th> </g:sortableColumn>
            </thead>
            <g:each in="${habitacionList}" var="habitacion">
            <tr>
                <td><g:link action="show" id="${habitacion.id}"> ${habitacion.id}</g:link> </td>
                <td>${habitacion.plazas}</td>
                <td><g:if test="${habitacion.disponibilidad}" >
                    Si
                </g:if>
                <g:else>
                    No
                </g:else>
                    <!--${habitacion.disponibilidad}-->
                </td>
            </tr>
            </g:each>
            </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${habitacionCount ?: 0}" />
            </div>
        </div>
    </body>
</html>