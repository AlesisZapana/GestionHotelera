<!DOCTYPE html>
<html>
<head>
	<!-- agrega lo que hay en el main principal-->
	<meta name="layout" content="main" />
	<!-- estilos y scripts-->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.2/fullcalendar.css">
	<!--<script src='https://code.jquery.com/jquery.js'></script>-->
	<script src='https://cdn.rawgit.com/moment/moment/develop/min/moment.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.2/fullcalendar.min.js'></script>
	<script src='https://cdn.rawgit.com/moment/moment/develop/min/locales.js'></script>
	<script src="https://cdn.rawgit.com/moment/moment/develop/locale/es.js"></script>
	<title>Calendario de Reservas</title>
	<script type="text/javascript">
		jQuery.noConflict();
		jQuery( document ).ready(function( $ ) {
			$('#page-top').addClass('logeado');
			$("body").addClass("sidenav-toggled");
    	// page is now ready, initialize the calendar...
	    $('#calendar').fullCalendar({

	    	locale:'es',
	    	firstDay:0,
	    	displayEventTime:false,
		    eventSources:[
				{
					url:'/Reserva/enviarJSON',
					color: 'blue',
					textColor: 'white'
				},
				{
					url:'/ReservaAutomovil/enviarJSON',
					color: 'green',
					textColor: 'white'	
				}
				],
			eventDataTransform: function(eventData) {
		        eventData.end = moment(eventData.end).add(1, 'days').format();
		        return eventData;
	        },
		    eventClick: function(event) {
	        	if (event.url) {
		            window.open(event.url);
		            return false;
	        	}
    		}
	    })

	});
	</script>

</head>
<body>
	<div id="calendar"></div>
</body>
</html>