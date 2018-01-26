package gestionhotelera

@Singleton(strict=false)
class Hotel {
	String nombre="Hotel Ushuaia"
	String imagen = "https://q-ec.bstatic.com/images/hotel/max1024x768/429/42939744.jpg"
	Integer cantidadHabitaciones =25
	String reseña = "Hotel a la vera de la bahía de Ushuaia con vista al mar"
	String direccion ="Calle Nueva 123"

	private static hotel 
	
	private Hotel(){
	}

	static Hotel getInstance() { 
		if (hotel==null) {
			hotel= new Hotel()		
		}
		return hotel
	}

    static constraints = {
    }

    def descrip = { attrs, body ->
    	out << body()
    }

    String toString(){
    	nombre
    }

}
