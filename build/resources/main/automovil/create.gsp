<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'automovil.label', default: 'Automovil')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <!--<a href="#create-automovil" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>-->
        <div id="create-automovil" class="content scaffold-create" role="main">
            <h1>Nuevo tipo de automovil</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.automovil}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.automovil}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    
                    <!--<f:all bean="automovil"/>-->

                    <div class="form-group row justify-content-center" bean="automovil" property="tipo" >
                        <label for="example-text-input" class="col-1 col-form-label">Tipo de Vehículo</label>
                        <div class="col-3">
                            <g:field class="form-control" type="text" name="tipo" value="${automovilInstance?.tipo}" required="true" />
                        </div>
                    </div>

                    <div class="form-group row justify-content-center" bean="automovil" property="cantidad" >
                        <label for="example-text-input" class="col-1 col-form-label">Cantidad</label>
                        <div class="col-3">
                            <g:field class="form-control" min="0" type="number" name="cantidad" value="${automovilInstance?.cantidad}" required="true" />
                        </div>
                    </div>

                </fieldset>
                <fieldset class="buttons">
                    <center>
                    <g:submitButton name="create" class="save btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </center>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>