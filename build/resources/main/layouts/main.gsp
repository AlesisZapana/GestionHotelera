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
    
    <link href="https://cdn.rawgit.com/AlesisZapana/startbootstrap-clean-blog/AlesisZapana-patch-10/css/clean-blog.css" rel="stylesheet">
    
    <link href="https://cdn.rawgit.com/AlesisZapana/startbootstrap-sb-admin/AlesisZapana-patch-9/css/sb-admin.css" rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/AlesisZapana/startbootstrap-sb-admin/master/vendor/font-awesome/css/font-awesome.min.css">
    
    <style type="text/css"> 
        #page-top.fixed-nav.sticky-footer.logeado.sidenav-toggled{ 
            padding-left: 55px
        }
        #page-top.fixed-nav.sticky-footer.logeado{ 
            padding-left: 250px
        }
        #barra-horizontal{
            font-family: 'Lora', 'Times New Roman', serif;
        }
        #exampleAccordion{
            font-family: 'Times New Roman';
        }
    </style>

    <script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js" integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E=" crossorigin="anonymous"></script> 
    <g:layoutHead/>
</head>
<body class="fixed-nav sticky-footer" id="page-top">
    <br><br>
    <!-- Navigation -->
    
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark" id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="/">Hotel Ushuaia</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">

            <sec:ifLoggedIn>
            <script type="text/javascript">
                console.log("estoy logeado");
                //agregar el logeado en el css con pad 50 px (para probar)
                $('#page-top').addClass('logeado');
                $("body").addClass("sidenav-toggled");
                /*$("#mainNav").click(function(e) {
                    //e.preventDefault();
                    $("body").addClass("sidenav-toggled");
                    console.log("mainNav Clickeado")
                });*/
                /*$("#sidenavToggler").click(function(e) {
                    e.preventDefault();
                    $("body").toggleClass("sidenav-toggled");
                    console.log("botón sidenav Clickeado");
                });*/

            </script>
            <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Hotel">
                        <a class="nav-link" href="/hotel/show">
                          <i class="fa fa-fw fa-h-square"></i>
                          <span class="nav-link-text">Hotel</span>
                        </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Calendario">
                        <a class="nav-link" href="/calendario">
                          <i class="fa fa-fw fa-calendar"></i>
                          <span class="nav-link-text">Calendario</span>
                        </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Habitaciones">
                        <a class="nav-link" href="/habitacion">
                          <i class="fa fa-fw fa-bed"></i>
                          <span class="nav-link-text">Habitaciones</span>
                        </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Reservas de Automoviles">
                        <a class="nav-link" href="/reservaAutomovil/index">
                          <i class="fa fa-fw fa-car"></i>
                          <span class="nav-link-text">Reservas Automovil</span>
                        </a>
                        
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Reservas de Habitaciones">
                        <a class="nav-link" href="/reserva">
                          <i class="fa fa-fw fa-address-book"></i>
                          <span class="nav-link-text">Reservas Habitac.</span>
                        </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Titulares">
                        <a class="nav-link" href="/huesped">
                          <i class="fa fa-fw fa-user"></i>
                          <span class="nav-link-text">Titulares</span>
                        </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Solicitudes de Habitacion">
                    <a class="nav-link" href="/solicitudHabitacion">
                        <i class="fa fa-fw fa-exclamation"></i>
                        <span class="nav-link-text">Solicitud Habitacion</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Solicitudes de Automovil">
                    <a class="nav-link" href="/solicitudAutomovil">
                        <i class="fa fa-fw fa-exclamation"></i>
                        <span class="nav-link-text">Solicitudes de Automovil</span>
                    </a>
                </li>


            </ul>
            <ul class="navbar-nav sidenav-toggler">
                <li class="nav-item">
                    <a class="nav-link text-center" id="sidenavToggler">
                        <i class="fa fa-fw fa-angle-left"></i>
                    </a>
                </li>
            </ul>
            
            </sec:ifLoggedIn>

            <ul class="navbar-nav ml-auto" id="barra-horizontal">
            <!--
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
            -->
            <li class="nav-item">
              <a class="nav-link" href="/solicitudAutomovil/create">Reservar Automovil</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/solicitudHabitacion/create">Reservar Habitación</a>
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
    <!--<script src="https://code.jquery.com/jquery-3.2.1.js"></script>-->
    <!--<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
-->

    
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

    <!-- Custom scripts for this template -->
    
    
    <script src="https://cdn.rawgit.com/AlesisZapana/startbootstrap-clean-blog/AlesisZapana-patch-8/js/clean-blog.js"></script>
    
    <script src="https://cdn.rawgit.com/AlesisZapana/startbootstrap-sb-admin/AlesisZapana-patch-10/js/sb-admin.js"></script>

    <!--<script type="text/javascript" src="https://cdn.rawgit.com/kthornbloom/Monthly/master/js/monthly.js"></script>-->
    <asset:javascript src="application.js"/>

</body>
</html>