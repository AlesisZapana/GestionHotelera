<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'solicitudHabitacion.label', default: 'SolicitudHabitacion')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <!--<a href="#show-solicitudHabitacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>-->
        <div id="show-solicitudHabitacion" class="content scaffold-show" role="main">
            <legend>Solicitud de Habitación</legend>
            
            <dl class="row">
                <dt class="col-sm-3">Nombre:</dt>
                <dd class="col-sm-9">${solicitudHabitacion.nombre}</dd>

                <dt class="col-sm-3">Apellido:</dt>
                <dd class="col-sm-9"><f:display bean="solicitudHabitacion" property="apellido" /></dd>

                <dt class="col-sm-3">${solicitudHabitacion.tipoDocumento}:</dt>
                <dd class="col-sm-9">${solicitudHabitacion.numeroDocumento}</dd>

                <dt class="col-sm-3">E-Mail:</dt>
                <dd class="col-sm-9">${solicitudHabitacion.email}</dd>

                <dt class="col-sm-3">Fecha de Ingreso:</dt>
                <dd class="col-sm-9">${solicitudHabitacion.fechaInicio}</dd>

                <dt class="col-sm-3">Fecha de Egreso:</dt>
                <dd class="col-sm-9">${solicitudHabitacion.fechaFin}</dd>

                <dt class="col-sm-3">Cantidad de Huéspedes</dt>
                <dd class="col-sm-9">${solicitudHabitacion.cantidadHuespedes}</dd>

            </dl>
            <a class="btn btn-primary" href="/" role="button">Volver</a>

            <!--<g:form resource="${this.solicitudHabitacion}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.solicitudHabitacion}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>-->
        </div>
    </body>
</html>
