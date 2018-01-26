<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'solicitudReserva.label', default: 'SolicitudReserva')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        
        <div id="list-solicitudReserva" class="content scaffold-list" role="main">
            <h1>Solicitudes de Reserva pendientes</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <table class="table table-sm" collection="${solicitudReservaList}">
                <tbody>
                    <thead>
                        <g:sortableColumn property="id" title="id"><th scope="col"></th></g:sortableColumn>
                        <g:sortableColumn property="nombre" title="Nombre"> <th scope="col"></th></g:sortableColumn>
                        <g:sortableColumn property="apellido" title="Apellido"><th scope="col">Plazas</th></g:sortableColumn>
                        <g:sortableColumn property="tipoDocumento" title="Tipo Documento"> <th scope="col"></th></g:sortableColumn>
                        <g:sortableColumn property="numeroDocumento" title="N° Documento"><th scope="col"></th></g:sortableColumn>
                        <g:sortableColumn property="email" title="E-Mail"><th scope="col"></th></g:sortableColumn>
                        <g:sortableColumn property="fechaReserva" title="Fecha de Reserva"><th scope="col"></th></g:sortableColumn>
                        <g:sortableColumn property="cantidadHuespedes" title="Cantidad de Huespedes"><th scope="col"></th></g:sortableColumn>
                        <th scope="col">Opciones</th>
                    </thead>
                <g:each in="${solicitudReservaList}" var="solicitudReserva">
                <tr>
                    <!--<td><g:link action="show" id="${solicitudReserva.id}"> ${solicitudReserva.nombre}</g:link></td>-->
                    <td>${solicitudReserva.id}</td>
                    <td>${solicitudReserva.nombre}</td>
                    <td>${solicitudReserva.apellido}</td>
                    <td>${solicitudReserva.tipoDocumento}</td>
                    <td>${solicitudReserva.numeroDocumento}</td>
                    <td>${solicitudReserva.email}</td>
                    <td>${solicitudReserva.fechaReserva}</td>
                    <td>${solicitudReserva.cantidadHuespedes}</td>
                    <td>
                    <g:form resource="${solicitudReserva}" method="DELETE">
                        <g:actionSubmit type="submit" class="btn btn-success" value="Aceptar" action="aceptarSolicitud" params="${solicitudReserva}"/>

                        <!--<g:link class="badge badge-success" controller="solicitudReserva" action="aceptarSolicitud" params="${solicitudReserva}">Aceptar <i class="fa fa-check" aria-hidden="true"></i></g:link>-->

                        <g:actionSubmit type="submit" class="btn btn-danger" value="Rechazar" action="delete" params="${solicitudReserva}"/>
                    </g:form>
                    </td>
                </tr>
                </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${solicitudReservaCount ?: 0}" />
            </div>
        </div>
    </body>
</html>