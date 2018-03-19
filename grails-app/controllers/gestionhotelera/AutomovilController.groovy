package gestionhotelera

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class AutomovilController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Automovil.list(params), model:[automovilCount: Automovil.count()]
    }

    def show(Automovil automovil) {
        respond automovil
    }

    def create() {
        respond new Automovil(params)
    }

    @Transactional
    def save(Automovil automovil) {
        if (automovil == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (automovil.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond automovil.errors, view:'create'
            return
        }

        automovil.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'automovil.label', default: 'Automovil'), automovil.id])
                redirect automovil
            }
            '*' { respond automovil, [status: CREATED] }
        }
    }

    def edit(Automovil automovil) {
        respond automovil
    }

    @Transactional
    def update(Automovil automovil) {
        if (automovil == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (automovil.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond automovil.errors, view:'edit'
            return
        }

        automovil.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'automovil.label', default: 'Automovil'), automovil.id])
                redirect automovil
            }
            '*'{ respond automovil, [status: OK] }
        }
    }

    @Transactional
    def delete(Automovil automovil) {

        if (automovil == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        automovil.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'automovil.label', default: 'Automovil'), automovil.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def agregar(){
        respond Automovil.list()
    }

    def aumentarAutos(){
        def auto = Automovil.list().find{ it.tipo == params.tipoAuto}
        auto.cantidad+=params.cantidad.toInteger()

        auto.save flush:true

        redirect(uri:'/Automovil')
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'automovil.label', default: 'Automovil'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
