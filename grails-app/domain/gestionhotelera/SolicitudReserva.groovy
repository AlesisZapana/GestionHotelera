package gestionhotelera

class SolicitudReserva {
	String nombre
	String apellido
	String tipoDocumento
	Integer numeroDocumento
	String email
	String fechaReserva
	Integer cantidadHuespedes

    static constraints = {
    	nombre blank:false
    	apellido blank:false
    	tipoDocumento blank:false, inList:["DNI","Libreta Civica","Serie A"]
    	numeroDocumento unique:true
    	email email:true, blank:false    	
    	fechaReserva blank:false
    	cantidadHuespedes blank:false
    }
}
