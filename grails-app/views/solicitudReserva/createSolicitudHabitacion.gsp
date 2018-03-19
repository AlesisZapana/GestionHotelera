<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'solicitudReserva.label', default: 'SolicitudReserva')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>     
        <div id="create-solicitudReserva" class="content scaffold-create" role="main">
            <center><h1>Formulario de Reserva</h1></center>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.solicitudReserva}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.solicitudReserva}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">

                    <div class="form-group row justify-content-center" bean="solicitudHabitacion" property="nombre" >
                        <label for="example-text-input" class="col-1 col-form-label">Nombre</label>
                        <div class="col-3">
                            <g:field class="form-control" type="text" name="nombre" value="${solicitudHabitacionInstance?.nombre}" required="true" />
                        </div>
                    </div>

                    
                    <div class="form-group row justify-content-center" bean="solicitudHabitacion" property="apellido" >
                        <label for="example-text-input" class="col-1 col-form-label">Apellido</label>
                        <div class="col-3">
                            <g:field class="form-control" type="text" name="apellido" value="${solicitudHabitacionInstance?.apellido}" required="true" />
                        </div>
                    </div> 

                    <div class="form-group row justify-content-center" bean="solicitudHabitacion" property="tipoDocumento" >
                        <label for="example-text-input" class="col-1 col-form-label">Tipo Documento</label>
                        <div class="col-3">
                            <g:select class="form-control" name="tipoDocumento" value="${solicitudHabitacionInstance?.tipoDocumento}" from="${solicitudHabitacion.getConstrainedProperties().tipoDocumento.inList}"  valueMessagePrefix="tipoDocumento" required="true"/>
                        </div>
                    </div>

                    <div class="form-group row justify-content-center" bean="solicitudHabitacion" property="numeroDocumento" >
                        <label for="example-text-input" class="col-1 col-form-label">Documento</label>
                        <div class="col-3">
                            <g:field class="form-control" type="number" name="numeroDocumento" value="${solicitudHabitacionInstance?.numeroDocumento}" required="true" />
                        </div>
                    </div>

                    <div class="form-group row justify-content-center" bean="solicitudHabitacion" property="email" >
                        <label for="example-text-input" class="col-1 col-form-label">Email</label>
                        <div class="col-3">
                            <g:field class="form-control" type="email" name="email" value="${solicitudHabitacionInstance?.email}" required="true" />
                        </div>
                    </div>
                   
                    <div class="form-group row justify-content-center" bean="solicitudHabitacion" property="fechaReserva">
                        <label for="example-date-input" class="col-1 col-form-label">Fecha Reserva</label>
                        <div class="col-3">
                            <g:field class="form-control datepicker" name="fechaReserva" value="${solicitudHabitacionInstance?.fechaReserva}" required="true" />
                        </div>
                    </div>

                    <div class="form-group row justify-content-center" bean="solicitudHabitacion" property="cantidadHuespedes" >
                        <label for="example-text-input" class="col-1 col-form-label">Cantidad Huéspedes</label>
                        <div class="col-3">
                            <g:field class="form-control" min="1" max="10" type="number" name="cantidadHuespedes" value="${solicitudHabitacionInstance?.cantidadHuespedes}" required="true" />
                        </div>
                    </div>

                </fieldset>    
                <center>            
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save btn btn-primary pull" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
                </center>
            </g:form>
        </div>


    <!--  para el idioma -->    
    <script src="https://cdn.rawgit.com/AlesisZapana/jquery-ui/master/ui/i18n/datepicker-es.js"></script>
    
    <script>
        $('.datepicker').datepicker( $.datepicker.regional[ "es" ]);
    </script>
    </body>
</html>
