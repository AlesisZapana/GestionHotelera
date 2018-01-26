package gestionhotelera

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class HuespedController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Huesped.list(params), model:[huespedCount: Huesped.count()]
    }

    def show(Huesped huesped) {
        respond huesped
    }

    def create() {
        respond new Huesped(params)
    }

    @Transactional
    def save(Huesped huesped) {
        if (huesped == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (huesped.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond huesped.errors, view:'create'
            return
        }

        huesped.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'huesped.label', default: 'Huesped'), huesped.id])
                redirect huesped
            }
            '*' { respond huesped, [status: CREATED] }
        }
    }

    def edit(Huesped huesped) {
        respond huesped
    }

    @Transactional
    def update(Huesped huesped) {
        if (huesped == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (huesped.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond huesped.errors, view:'edit'
            return
        }

        huesped.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'huesped.label', default: 'Huesped'), huesped.id])
                redirect huesped
            }
            '*'{ respond huesped, [status: OK] }
        }
    }

    @Transactional
    def delete(Huesped huesped) {

        if (huesped == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        huesped.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'huesped.label', default: 'Huesped'), huesped.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'huesped.label', default: 'Huesped'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
