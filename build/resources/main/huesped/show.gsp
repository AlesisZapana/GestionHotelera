<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'huesped.label', default: 'Huesped')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <!--<a href="#show-huesped" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>-->
        <div id="show-huesped" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <dl class="row">
                <dt class="col-sm-3">ID</dt>
                <dd class="col-sm-9">${huesped.id}</dd>

                <dt class="col-sm-3">${huesped.tipoDocumento}:</dt>
                <dd class="col-sm-9">${huesped.numeroDocumento}</dd>
                <dt class="col-sm-3">Nombre:</dt>
                <dd class="col-sm-9">${huesped.nombre}</dd>

                <dt class="col-sm-3">Apellido:</dt>
                <dd class="col-sm-9"><f:display bean="huesped" property="apellido" /></dd>

                <dt class="col-sm-3">E-Mail:</dt>
                <dd class="col-sm-9">${huesped.email}</dd>
            </dl>

            <a class="btn btn-primary" href="/huesped/index">Volver</a>
            <!--<g:form resource="${this.huesped}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.huesped}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>-->
        </div>
    </body>
</html>
