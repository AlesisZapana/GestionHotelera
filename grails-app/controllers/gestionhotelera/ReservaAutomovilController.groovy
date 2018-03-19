package gestionhotelera

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.*

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class ReservaAutomovilController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ReservaAutomovil.list(params), model:[reservaAutomovilCount: ReservaAutomovil.count()]
    }

    def show(ReservaAutomovil reservaAutomovil) {
        respond reservaAutomovil
    }

    def create() {
        respond new ReservaAutomovil(params)
    }

    @Transactional
    def save(ReservaAutomovil reservaAutomovil) {
        if (reservaAutomovil == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (reservaAutomovil.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond reservaAutomovil.errors, view:'create'
            return
        }

        reservaAutomovil.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'reservaAutomovil.label', default: 'ReservaAutomovil'), reservaAutomovil.id])
                redirect reservaAutomovil
            }
            '*' { respond reservaAutomovil, [status: CREATED] }
        }
    }

    def edit(ReservaAutomovil reservaAutomovil) {
        respond reservaAutomovil
    }

    @Transactional
    def update(ReservaAutomovil reservaAutomovil) {
        if (reservaAutomovil == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (reservaAutomovil.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond reservaAutomovil.errors, view:'edit'
            return
        }

        reservaAutomovil.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'reservaAutomovil.label', default: 'ReservaAutomovil'), reservaAutomovil.id])
                redirect reservaAutomovil
            }
            '*'{ respond reservaAutomovil, [status: OK] }
        }
    }

    @Transactional
    def delete(ReservaAutomovil reservaAutomovil) {

        if (reservaAutomovil == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        reservaAutomovil.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'reservaAutomovil.label', default: 'ReservaAutomovil'), reservaAutomovil.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def enviarJSON(){
        render ReservaAutomovil.list() as JSON
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservaAutomovil.label', default: 'ReservaAutomovil'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
