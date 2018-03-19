<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'automovil.label', default: 'Automovil')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="list-automovil" class="content scaffold-list" role="main">
            <h1>Automoviles disponibles</h1>
            <g:if test="${flash.message}">
                <div class="message alert alert-success" role="status alert">${flash.message}</div>
            </g:if>
            <f:table collection="${automovilList}" />

            <div class="pagination">
                <g:paginate total="${automovilCount ?: 0}" />
            </div>
        </div>
    </body>
</html>