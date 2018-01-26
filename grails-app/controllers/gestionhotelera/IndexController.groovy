package gestionhotelera

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
class IndexController {

	@Secured('permitAll')
    def index() {
        /*HotelController hotelController=new HotelController()
        render hotelController.getHotel().direccion*/
        
        respond Hotel.getInstance()

    }
}