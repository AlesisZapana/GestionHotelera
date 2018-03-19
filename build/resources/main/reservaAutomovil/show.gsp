<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reservaAutomovil.label', default: 'ReservaAutomovil')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <!--<a href="#show-reservaAutomovil" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>-->
        <div id="show-reservaAutomovil" class="content scaffold-show" role="main">
            <h1>Reserva de Automovil</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <dl class="row">
                <dt class="col-sm-3">Titular:</dt>
                <dd class="col-sm-9"><g:link controller="huesped" action="show" id="${reservaAutomovil.titular.id}">${reservaAutomovil.titular}</g:link></dd>

                <dt class="col-sm-3">Vehículo:</dt>
                <dd class="col-sm-9"><f:display bean="reservaAutomovil" property="tipoAutomovil" /></dd>


                <dt class="col-sm-3">Fecha Ingreso</dt>
                <dd class="col-sm-9">${reservaAutomovil.start}</dd>

                <dt class="col-sm-3">Fecha de Egreso:</dt>
                <dd class="col-sm-9">${reservaAutomovil.end}</dd>

            </dl>

            <a class="btn btn-primary" href="/reservaAutomovil" role="button">Volver</a>

            <!--<g:form resource="${this.reservaAutomovil}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.reservaAutomovil}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>-->
        </div>
    </body>
</html>
