package gestionhotelera

abstract class SolicitudReserva {
	String nombre
	String apellido
	String tipoDocumento
	Integer numeroDocumento
	String email
	String fechaInicio
    String fechaFin
    

    //poner esto en reservas y reservas de automoviles, agregar colores distintos(si se puede)
    String start="2018-02-15"
    String title="Hola"
    String url="www.google.com"
    static constraints = {
    	nombre blank:false
    	apellido blank:false
    	tipoDocumento blank:false, inList:["DNI","Libreta Civica","Serie A"]
    	numeroDocumento unique:true
    	email email:true, blank:false    	
    	fechaInicio blank:false
        fechaFin blank:false
        //tipoAutomovil blank:false, inList:["Economico","Familiar","Lujo"]
    }
}