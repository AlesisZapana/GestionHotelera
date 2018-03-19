<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'solicitudReserva.label', default: 'SolicitudReserva')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <!--<a href="#show-solicitudReserva" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>-->
        <div id="show-solicitudReserva" class="content scaffold-show" role="main">
            <sec:ifNotLoggedIn>
            <h1>Solicitud de Reserva realizada</h1>
            </sec:ifNotLoggedIn>
            <sec:ifLoggedIn>
            <h1>Solicitud de Reserva ${solicitudReserva.id}</h1>
            </sec:ifLoggedIn>
            
            
            <dl class="row">
                <dt class="col-sm-3">Nombre:</dt>
                <dd class="col-sm-9">${solicitudReserva.nombre}</dd>

                <dt class="col-sm-3">Apellido:</dt>
                <dd class="col-sm-9"><f:display bean="solicitudReserva" property="apellido" /></dd>

                <dt class="col-sm-3">${solicitudReserva.tipoDocumento}:</dt>
                <dd class="col-sm-9">${solicitudReserva.numeroDocumento}</dd>

                <dt class="col-sm-3">E-Mail:</dt>
                <dd class="col-sm-9">${solicitudReserva.email}</dd>

                <dt class="col-sm-3">Fecha de Reserva:</dt>
                <dd class="col-sm-9">${solicitudReserva.fechaReserva}</dd>

                <dt class="col-sm-3">Cantidad de Huéspedes</dt>
                <dd class="col-sm-9">${solicitudReserva.cantidadHuespedes}</dd>

                <dt class="col-sm-3">Tipo Automóvil</dt>
                <dd class="col-sm-9">${solicitudReserva.tipoAutomovil}</dd>
            </dl>
            <a class="btn btn-primary" href="/" role="button">Volver</a>
            <!--<g:form resource="${this.solicitudReserva}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.solicitudReserva}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>-->
        </div>
    </body>
</html>
