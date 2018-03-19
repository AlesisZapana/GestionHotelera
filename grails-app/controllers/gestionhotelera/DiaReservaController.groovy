package gestionhotelera

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.*

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class DiaReservaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DiaReserva.list(params), model:[diaReservaCount: DiaReserva.count()]
    }

    def show(DiaReserva diaReserva) {
        respond diaReserva
    }

    def create() {
        respond new DiaReserva(params)
    }

    @Transactional
    def save(DiaReserva diaReserva) {
        if (diaReserva == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (diaReserva.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond diaReserva.errors, view:'create'
            return
        }

        diaReserva.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'diaReserva.label', default: 'DiaReserva'), diaReserva.id])
                redirect diaReserva
            }
            '*' { respond diaReserva, [status: CREATED] }
        }
    }

    def edit(DiaReserva diaReserva) {
        respond diaReserva
    }

    @Transactional
    def update(DiaReserva diaReserva) {
        if (diaReserva == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (diaReserva.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond diaReserva.errors, view:'edit'
            return
        }

        diaReserva.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'diaReserva.label', default: 'DiaReserva'), diaReserva.id])
                redirect diaReserva
            }
            '*'{ respond diaReserva, [status: OK] }
        }
    }

    @Transactional
    def delete(DiaReserva diaReserva) {

        if (diaReserva == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        diaReserva.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'diaReserva.label', default: 'DiaReserva'), diaReserva.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def habitacionesJSON(){
        render DiaReserva.list().findAll { it.tipo == "Habitacion"} as JSON
    }

    def automovilesJSON(){
        render DiaReserva.list().findAll { it.tipo == "Automovil" } as JSON
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'diaReserva.label', default: 'DiaReserva'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
