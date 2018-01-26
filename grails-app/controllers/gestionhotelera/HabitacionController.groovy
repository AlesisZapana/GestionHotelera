package gestionhotelera

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class HabitacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Habitacion.list(params), model:[habitacionCount: Habitacion.count()]
    }

    def show(Habitacion habitacion) {
        respond habitacion
    }

    def create() {        
        respond new Habitacion(params)
    }

    @Transactional
    def save(Habitacion habitacion) {            
        
        if (habitacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (habitacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond habitacion.errors, view:'create'
            return
        }
        
        habitacion.save flush:true        

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'habitacion.label', default: 'Habitacion'), habitacion.id])
                redirect action:"index", method:"GET"
            }
            '*' { respond habitacion, [status: CREATED] }
        }

    }

    def edit(Habitacion habitacion) {
        respond habitacion
    }

    @Transactional
    def update(Habitacion habitacion) {
        if (habitacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (habitacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond habitacion.errors, view:'edit'
            return
        }

        habitacion.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'habitacion.label', default: 'Habitacion'), habitacion.id])
                redirect habitacion
            }
            '*'{ respond habitacion, [status: OK] }
        }
    }

    @Transactional
    def delete(Habitacion habitacion) {

        if (habitacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        habitacion.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'habitacion.label', default: 'Habitacion'), habitacion.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'habitacion.label', default: 'Habitacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
