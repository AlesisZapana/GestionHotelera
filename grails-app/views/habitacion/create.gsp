<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'habitacion.label', default: 'Habitacion')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        
        <div id="create-habitacion" class="content scaffold-create" role="main">
            <center><h1>Nueva habitacion</h1></center>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.habitacion}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.habitacion}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <div class="form-group row justify-content-center" bean="habitacion" property="plazas" >
                        <label for="example-text-input" class="col-1 col-form-label">Plazas</label>
                        <div class="col-3">
                            <g:field class="form-control" type="number" name="plazas" value="${habitacionInstance?.plazas}" required="true" />
                        </div>
                    </div>
                </fieldset>
                <center>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
                </center>
            </g:form>
        </div>
    </body>
</html>
