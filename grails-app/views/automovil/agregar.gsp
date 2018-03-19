<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'automovil.label', default: 'Automovil')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="list-automovil" class="content scaffold-list" role="main">
            <h1>Agregar Autos</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <f:table collection="${automovilList}" />

            <g:form>
                <fieldset class="form">
 
                    <div class="form-group row justify-content-center">
                        <label for="example-text-input" class="col-1 col-form-label">Tipo Automovil</label>
                        <div class="col-3">
                            <g:select class="form-control" name="tipoAuto"  from="${automovilList}" required="true"/>
                        </div>
                    </div>

                    <div class="form-group row justify-content-center" >
                        <label for="example-text-input" class="col-1 col-form-label">Cantidad</label>
                        <div class="col-3">
                            <g:field class="form-control" type="number" min="1"name="cantidad" required="true" />
                        </div>

                    </div>

                </fieldset>
                <center>            
                <g:actionSubmit type="submit" class="btn btn-success" value="Aceptar" action="aumentarAutos" params="${[cantidad,tipoAuto]}"/>
                </center>
            </g:form>


            <div class="pagination">
                <g:paginate total="${automovilCount ?: 0}" />
            </div>
        </div>
    </body>
</html>