package gestionhotelera

class ReservaAutomovil {

	String tipoAutomovil
	Huesped titular

	String start
    String end
    String title
    String url
	
    static constraints = {
    	tipoAutomovil blank:false
    	titular blank:false
    }
}
