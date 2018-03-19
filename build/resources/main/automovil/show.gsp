<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'automovil.label', default: 'Automovil')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav" role="navigation">
            
            <g:link class="list badge badge-info" action="index">Automoviles Disponibles</g:link>
            
        </div>
        <div id="show-automovil" class="content scaffold-show" role="main">
            <h1>Automovil</h1>
            <g:if test="${flash.message}">
            <div class="message alert alert-success" role="status alert" role="status">${flash.message}</div>
            </g:if>

            <dl class="row">
                <dt class="col-sm-3">Tipo ${automovil.tipo}:</dt>
                <dd class="col-sm-9">Cantidad: ${automovil.cantidad}</dd>
            </dl>

            <g:form resource="${this.automovil}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit btn btn-outline-primary" action="edit" resource="${this.automovil}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete btn btn-outline-primary" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
