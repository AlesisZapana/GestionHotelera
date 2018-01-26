<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'hotel.label', default: 'Hotel')}" />
        <title>Información del Hotel</title>
    </head>
    <body>
    <!--<a href="#show-hotel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>-->
        <!--<div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
    -->
        <div id="show-hotel" class="content scaffold-show" role="main">
            <h1>Información de Hotel Ushuaia</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <dl class="row">

                <!--<dt class="col-sm-3">Nombre:</dt>
                <dd class="col-sm-9">${hotel.nombre}</dd>-->

                <dt class="col-sm-3">Direccion:</dt>
                <dd class="col-sm-9">${hotel.direccion}</dd>

                <dt class="col-sm-3">Cantidad de Habitaciones:</dt>
                <dd class="col-sm-9">${hotel.cantidadHabitaciones}</dd>

                <dt class="col-sm-3">Imagen:</dt>
                <dd class="col-sm-9"><f:display bean="hotel" property="imagen" /></dd>

                <dt class="col-sm-3">Descripcion:</dt>
                <dd class="col-sm-9">${hotel.reseña}</dd>

            </dl>
            <g:form resource="${this.hotel}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit btn btn-primary" action="edit" resource="${this.hotel}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
