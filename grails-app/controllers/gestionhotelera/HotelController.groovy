package gestionhotelera

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class HotelController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    /*def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Hotel.list(params), model:[hotelCount: Hotel.count()]
    }*/

    def show() {
        //tenia como parametro Hotel hotel
        respond Hotel.getInstance()
        //respond hotel
    }

    def create() {
        respond Hotel.getInstance()
    }

    @Transactional
    def save() {
        if (Hotel.getInstance() == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (Hotel.getInstance().hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond Hotel.getInstance().errors, view:'create'
            return
        }

        Hotel.getInstance().save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'hotel.label', default: 'Hotel'), hotel.id])
                redirect (action:'show')
            }
            '*' { respond Hotel.getInstance(), [status: CREATED] }
        }
    }

    def edit(Hotel hotel) {
        respond hotel
    }

    @Transactional
    def update(Hotel hotel) {
        /*if (hotel == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (hotel.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond hotel.errors, view:'edit'
            return
        }

        hotel.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'hotel.label', default: 'Hotel'), hotel.id])
                redirect (uri: '/hotel/show')  
            }
            '*'{ respond hotel, [status: OK] }
        }*/
    
        //el objeto hotel era nulo, por eso redirigía a notFound()... averiguar como hacer que sea no nulo o, enviar correctamente el submit
        Hotel.getInstance().imagen=hotel.imagen
        Hotel.getInstance().cantidadHabitaciones=hotel.cantidadHabitaciones
        Hotel.getInstance().direccion=hotel.direccion
        Hotel.getInstance().reseña=hotel.reseña
        //Hotel.getInstance().save flush:true
        redirect (uri: '/hotel/show')

    }

    def getHotel(){
        respond Hotel.getInstance()
    }

    /*@Transactional
    def delete(Hotel hotel) {

        if (hotel == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        hotel.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'hotel.label', default: 'Hotel'), hotel.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }*/

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'hotel.label', default: 'Hotel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
