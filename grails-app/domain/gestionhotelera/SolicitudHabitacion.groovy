package gestionhotelera

class SolicitudHabitacion extends SolicitudReserva{
	Integer cantidadHuespedes

    static constraints = {
    	cantidadHuespedes blank:false
    	tipoDocumento blank:false, inList:["DNI","Libreta Civica","Serie A"]
    }
}
