<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'solicitudAutomovil.label', default: 'SolicitudAutomovil')}" />
        <title>Solicitudes de reserva de Automoviles</title>
    </head>
    <body>
        <div id="list-solicitudAutomovil" class="content scaffold-list" role="main">
            <h1>Solicitudes de Automoviles pendientes</h1>
            <g:if test="${flash.message}">
                <div class="message alert alert-danger" role="status alert">${flash.message}</div>
            </g:if>
            <g:elseif test="${flash.messageAceptado}">
                <div class="message alert alert-success" role="status alert">${flash.messageAceptado}</div>
            </g:elseif>

            <table class="table table-sm" collection="${solicitudAutomovilList}">
                <tbody>
                    <thead>
                        <g:sortableColumn property="id" title="ID"><th scope="col"></th></g:sortableColumn>
                        <g:sortableColumn property="nombre" title="Nombre"> <th scope="col"></th></g:sortableColumn>
                        <g:sortableColumn property="apellido" title="Apellido"><th scope="col">Plazas</th></g:sortableColumn>
                        <g:sortableColumn property="tipoDocumento" title="Tipo Documento"> <th scope="col"></th></g:sortableColumn>
                        <g:sortableColumn property="numeroDocumento" title="N° Documento"><th scope="col"></th></g:sortableColumn>
                        <g:sortableColumn property="email" title="E-Mail"><th scope="col"></th></g:sortableColumn>
                        <g:sortableColumn property="fechaInicio" title="Desde"><th scope="col"></th></g:sortableColumn>
                        <g:sortableColumn property="fechaFin" title="Hasta"><th scope="col"></th></g:sortableColumn>
                        <g:sortableColumn property="tipoAutomovil" title="Tipo de Automovil"><th scope="col"></th></g:sortableColumn>
                        <th scope="col">Opciones</th>
                    </thead>
                <g:each in="${solicitudAutomovilList}" var="solicitudReserva">
                <tr>
                    <!--<td><g:link action="show" id="${solicitudReserva.id}"> ${solicitudReserva.nombre}</g:link></td>-->
                    <td>${solicitudReserva.id}</td>
                    <td>${solicitudReserva.nombre}</td>
                    <td>${solicitudReserva.apellido}</td>
                    <td>${solicitudReserva.tipoDocumento}</td>
                    <td>${solicitudReserva.numeroDocumento}</td>
                    <td>${solicitudReserva.email}</td>
                    <td>${solicitudReserva.fechaInicio}</td>
                    <td>${solicitudReserva.fechaFin}</td>
                    <td>${solicitudReserva.tipoAutomovil}</td>
                    <td>
                    <g:form resource="${solicitudReserva}" method="DELETE">
                        <g:actionSubmit type="submit" class="btn-success" value="Aceptar" action="aceptarSolicitud" params="${solicitudReserva}"/>

                        <!--<g:link class="badge badge-success" controller="solicitudReserva" action="aceptarSolicitud" params="${solicitudReserva}">Aceptar <i class="fa fa-check" aria-hidden="true"></i></g:link>-->

                        <g:actionSubmit type="submit" class="btn-danger" value="Rechazar" action="delete" params="${solicitudReserva}"/>
                    </g:form>
                    </td>
                </tr>
                </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${solicitudAutomovilCount ?: 0}" />
            </div>
        </div>
    </body>
</html>