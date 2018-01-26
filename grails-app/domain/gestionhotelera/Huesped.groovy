package gestionhotelera

class Huesped {
	String nombre
	String apellido
	String tipoDocumento
	Integer numeroDocumento
	String email
    static constraints = {
    	numeroDocumento unique:true
    	email email:true, blank:false
    	nombre blank:false
    	apellido blank:false
    }

    String toString(){
        nombre+" "+apellido
    }
}
