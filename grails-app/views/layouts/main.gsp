<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <!--<asset:stylesheet src="application.css"/>-->
    <!-- cosas de bootstrap -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <!--bootstrap end - inicio de jquery ui-->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.min.css">
    <!-- jquery ui fin -->
    <!-- template inicio-->
    <link href="https://cdn.rawgit.com/BlackrockDigital/startbootstrap-clean-blog/master/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <link href="https://cdn.rawgit.com/AlesisZapana/startbootstrap-clean-blog/AlesisZapana-patch-3/css/clean-blog.css" rel="stylesheet">
    <!-- template fin -->
    
    <g:layoutHead/>
</head>
<body class="fixed-nav sticky-footer" id="page-top">
    <hr><hr><hr>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="/">Hotel Ushuaia</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <sec:ifLoggedIn>
            <li class="nav-item">
              <a class="nav-link" href="/hotel/show">Hotel</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/Habitacion/index"> Habitaciones</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/huesped/index">Titulares</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/reserva/index">Reservas</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/solicitudReserva/index"> Reservas Pendientes</a>
            </li>
        </sec:ifLoggedIn>
            <li class="nav-item">
              <a class="nav-link" href="/solicitudReserva/create">Realizar Reserva</a>
            </li>
        <sec:ifNotLoggedIn>
            <li class="nav-item">
              <a class="nav-link" href="/login">Ingresar
              <i class="fa fa-sign-in"></i>
              </a>
            </li>
        </sec:ifNotLoggedIn>
        <sec:ifLoggedIn>
            <li class="nav-item">
              <a class="nav-link" href="/logout">Salir
              <i class="fa fa-sign-out"></i>
              </a>
            </li>
        </sec:ifLoggedIn>
          </ul>
        </div>
    </div>
    </nav>

    

    <g:layoutBody/>
    

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <!-- para jquery -->
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js" integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E=" crossorigin="anonymous"></script>
    
    <!--  para el idioma -->    
    <script src="https://cdn.rawgit.com/AlesisZapana/jquery-ui/master/ui/i18n/datepicker-es.js"></script>
    
    <script>
        $('.datepicker').datepicker( $.datepicker.regional[ "es" ]);
    </script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

    <!-- Custom scripts for this template -->
    <script src="https://cdn.rawgit.com/BlackrockDigital/startbootstrap-clean-blog/master/js/clean-blog.min.js"></script>


    <asset:javascript src="application.js"/>

</body>
</html>
