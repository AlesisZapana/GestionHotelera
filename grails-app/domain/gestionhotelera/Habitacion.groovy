package gestionhotelera

class Habitacion {
	Integer plazas
    Boolean disponibilidad=true
    
    static constraints = {
    	plazas blank:false
    }
    static mapping = {
    	table 'habitaciones'
    	version false
    	id generator:'increment', column:'numeroHabitacion'
    }

    String toString(){
    	"Habitacion ${id} [Cap: ${plazas} personas] "
    }
}
