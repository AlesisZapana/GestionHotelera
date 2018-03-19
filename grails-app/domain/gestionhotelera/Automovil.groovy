package gestionhotelera

class Automovil {
	String tipo
	Integer cantidad
    static constraints = {
    	tipo unique:true, blank:false
    	cantidad min:0, blank:false
    }

    String toString(){
    	tipo
    }
}
