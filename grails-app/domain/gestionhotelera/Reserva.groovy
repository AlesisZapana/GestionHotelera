package gestionhotelera

class Reserva {
	Integer id
	String fechaReserva
	Integer cantidadHuespedes
	Habitacion habitacion
	//borrar la siguiente linea(?)
	//static hasOne = [habitacion:Habitacion]
	Huesped titular
    String start
    String end
    String title
    String url
    static constraints = {
    	fechaReserva blank:false
    	cantidadHuespedes blank:false
    	habitacion unique:true
    }
    static mapping = {
    	table 'reservaciones'
    	version false
    	id generator:'increment', column:'numeroReserva'
    }
}