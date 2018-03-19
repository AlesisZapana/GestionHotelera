<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'solicitudAutomovil.label', default: 'SolicitudAutomovil')}" />
        <title>Reservar Automovil</title>
    </head>
    <body>
        <!--<a href="#create-solicitudAutomovil" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>-->
        <div id="create-solicitudAutomovil" class="content scaffold-create" role="main">
            <center><legend><strong>Reservar Automovil</strong></legend></center>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.solicitudAutomovil}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.solicitudAutomovil}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>

            <g:form action="save">
                <fieldset class="form">
                    
                    <div class="form-group row justify-content-center" bean="solicitudAutomovil" property="nombre" >
                        <label for="example-text-input" class="col-1 col-form-label">Nombre</label>
                        <div class="col-3">
                            <g:field class="form-control" type="text" name="nombre" value="${solicitudAutomovilInstance?.nombre}" required="true" />
                        </div>
                    </div>

                    
                    <div class="form-group row justify-content-center" bean="solicitudAutomovil" property="apellido" >
                        <label for="example-text-input" class="col-1 col-form-label">Apellido</label>
                        <div class="col-3">
                            <g:field class="form-control" type="text" name="apellido" value="${solicitudAutomovilInstance?.apellido}" required="true" />
                        </div>
                    </div> 

                    <div class="form-group row justify-content-center" bean="solicitudAutomovil" property="tipoDocumento" >
                        <label for="example-text-input" class="col-1 col-form-label">Tipo Documento</label>
                        <div class="col-3">
                            <g:select class="form-control" name="tipoDocumento" value="${solicitudAutomovilInstance?.tipoDocumento}" from="${solicitudAutomovil.getConstrainedProperties().tipoDocumento.inList}"  valueMessagePrefix="tipoDocumento" required="true"/>
                        </div>
                    </div>

                    <div class="form-group row justify-content-center" bean="solicitudAutomovil" property="numeroDocumento" >
                        <label for="example-text-input" class="col-1 col-form-label">Documento</label>
                        <div class="col-3">
                            <g:field class="form-control" type="number" name="numeroDocumento" value="${solicitudAutomovilInstance?.numeroDocumento}" required="true" />
                        </div>
                    </div>

                    <div class="form-group row justify-content-center" bean="solicitudAutomovil" property="email" >
                        <label for="example-text-input" class="col-1 col-form-label">Email</label>
                        <div class="col-3">
                            <g:field class="form-control" type="email" name="email" value="${solicitudAutomovilInstance?.email}" required="true" />
                        </div>
                    </div>
                   
                    <div class="form-group row justify-content-center" bean="solicitudAutomovil" property="fechaInicio">
                        <label for="example-date-input" class="col-1 col-form-label">Fecha Ingreso</label>
                        <div class="col-3">
                            <g:field class="form-control datepicker" name="fechaInicio" value="${solicitudAutomovilInstance?.fechaInicio}" required="true" />
                        </div>
                    </div>

                    <div class="form-group row justify-content-center" bean="solicitudAutomovil" property="fechaFin">
                        <label for="example-date-input" class="col-1 col-form-label">Fecha Egreso</label>
                        <div class="col-3">
                            <g:field class="form-control datepicker" name="fechaFin" value="${solicitudAutomovilInstance?.fechaFin}" required="true" />
                        </div>
                    </div>

                    <div class="form-group row justify-content-center" bean="solicitudAutomovil" property="tipoAutomovil">
                        <label for="example-text-input" class="col-1 col-form-label">Tipo Automovil</label>
                        <div class="col-3">
                            <g:select class="form-control" name="tipoAutomovil"  from="${automovilList}" required="true"/>
                        </div>
                    </div>

                </fieldset>
                <fieldset class="buttons">
                    <center>
                    <g:submitButton name="create" class="save btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </center>
                </fieldset>
            </g:form>
        </div>

    <script src="https://cdn.rawgit.com/AlesisZapana/jquery-ui/AlesisZapana-patch-1/ui/i18n/datepicker-es.js"></script>
    
    <script>
        $('.datepicker').datepicker( $.datepicker.regional[ "es" ]);
    </script>

    </body>
</html>
