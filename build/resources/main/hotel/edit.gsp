<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'hotel.label', default: 'Hotel')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <!--<a href="#edit-hotel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>-->
        <div id="edit-hotel" class="content scaffold-edit" role="main">
            <h1>Actualizar información del hotel</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.hotel}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.hotel}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.hotel}" method="PUT">
                <g:hiddenField name="version" value="${this.hotel?.version}" />
                <fieldset class="form">

                    <!--<div class="form-group row justify-content-center" bean="hotel" property="nombre" >
                        <label for="example-text-input" class="col-1 col-form-label">Nombre</label>
                        <div class="col-3">
                            <g:field class="form-control" type="text" name="nombre" value="${hotel.nombre}" required="true" />
                        </div>
                    </div>-->

                    <div class="form-group row justify-content-center" bean="hotel" property="direccion" >
                        <label for="example-text-input" class="col-1 col-form-label">Direccion</label>
                        <div class="col-3">
                            <g:field class="form-control" type="text" name="direccion" value="${hotel.direccion}" required="true" />
                        </div>
                    </div>

                    <div class="form-group row justify-content-center" bean="hotel" property="cantidadHabitaciones" >
                        <label for="example-text-input" class="col-1 col-form-label">Cantidad de Habitaciones</label>
                        <div class="col-3">
                            <g:field class="form-control" type="number" name="cantidadHabitaciones" value="${hotel.cantidadHabitaciones}" required="true" />
                        </div>
                    </div>

                    <div class="form-group row justify-content-center" bean="hotel" property="imagen" >
                        <label for="example-text-input" class="col-1 col-form-label">Link de imagen</label>
                        <div class="col-3">
                            <g:field class="form-control" type="text" name="imagen" value="${hotel.imagen}" required="true" />
                        </div>
                    </div>

                    <div class="form-group row justify-content-center" bean="hotel" property="reseña" >
                        <label for="example-text-input" class="col-1 col-form-label">Reseña</label>
                        <div class="col-3">
                            <g:textArea class="form-control" type="text" name="reseña" value="${hotel.reseña}" required="true" />
                        </div>
                    </div>

                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
