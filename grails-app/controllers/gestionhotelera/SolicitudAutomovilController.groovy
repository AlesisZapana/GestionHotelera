package gestionhotelera

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.*

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class SolicitudAutomovilController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SolicitudAutomovil.list(params), model:[solicitudAutomovilCount: SolicitudAutomovil.count()]
    }

    def show(SolicitudAutomovil solicitudAutomovil) {
        respond solicitudAutomovil
    }

    def create() {
        respond new SolicitudAutomovil(params)
        respond Automovil.list()
    }

    @Transactional
    def save(SolicitudAutomovil solicitudAutomovil) {
        if (solicitudAutomovil == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (solicitudAutomovil.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond solicitudAutomovil.errors, view:'create'
            return
        }

        solicitudAutomovil.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'solicitudAutomovil.label', default: 'SolicitudAutomovil'), solicitudAutomovil.id])
                redirect solicitudAutomovil
            }
            '*' { respond solicitudAutomovil, [status: CREATED] }
        }
    }

    def edit(SolicitudAutomovil solicitudAutomovil) {
        respond solicitudAutomovil
    }

    @Transactional
    def update(SolicitudAutomovil solicitudAutomovil) {
        if (solicitudAutomovil == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (solicitudAutomovil.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond solicitudAutomovil.errors, view:'edit'
            return
        }

        solicitudAutomovil.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'solicitudAutomovil.label', default: 'SolicitudAutomovil'), solicitudAutomovil.id])
                redirect solicitudAutomovil
            }
            '*'{ respond solicitudAutomovil, [status: OK] }
        }
    }

    @Transactional
    def delete(SolicitudAutomovil solicitudAutomovil) {

        if (solicitudAutomovil == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        solicitudAutomovil.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'solicitudAutomovil.label', default: 'SolicitudAutomovil'), solicitudAutomovil.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'solicitudAutomovil.label', default: 'SolicitudAutomovil'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    @Transactional
    def aceptar(SolicitudAutomovil solicitudReserva) {

        //solicitudReserva=SolicitudReserva.get(params.id)
        if (solicitudReserva == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        solicitudReserva.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.messageAceptado = "Solicitud de reserva "+solicitudReserva.id+" aceptado" 
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Transactional
    def aceptarSolicitud(SolicitudAutomovil solicitudReserva){ 

        def tipo=solicitudReserva.tipoAutomovil
        def listaAutos=Automovil.list()
        def tipoAuto = listaAutos.find { it.tipo == tipo }

        if (tipoAuto.cantidad>0) {
        
            Huesped titular = new Huesped()
            titular.nombre = solicitudReserva.nombre
            titular.apellido = solicitudReserva.apellido
            titular.tipoDocumento = solicitudReserva.tipoDocumento
            titular.numeroDocumento = solicitudReserva.numeroDocumento
            titular.email = solicitudReserva.email
            titular.tipoReserva = "Automovil"
            
            titular.save flush:true

            
            ReservaAutomovil reservaAutomovil=new ReservaAutomovil()
            reservaAutomovil.tipoAutomovil=tipoAuto
            reservaAutomovil.titular=titular
            reservaAutomovil.start=solicitudReserva.fechaInicio
            reservaAutomovil.end=solicitudReserva.fechaFin
            reservaAutomovil.title=titular.toString()+"- Auto "+tipoAuto.tipo
            reservaAutomovil.url="reservaAutomovil/show/${reservaAutomovil.list().size()+1}"
            reservaAutomovil.save flush:true
            
            tipoAuto.cantidad--
            tipoAuto.save flush:true
            
            def reservaDiaAutomovil = DiaReserva.list().find { it.start == reservaAutomovil.start && it.tipo=="Automovil" }

            if (reservaDiaAutomovil==null){
                DiaReserva diaReserva = new DiaReserva()
                diaReserva.tipo="Automovil"
                diaReserva.cantidadReservas++            
                diaReserva.start=solicitudReserva.fechaInicio
                diaReserva.title=diaReserva.cantidadReservas+" automov. reservados"
                diaReserva.save flush:true
            }else {
                reservaDiaAutomovil.cantidadReservas++
                reservaDiaAutomovil.title=reservaDiaAutomovil.cantidadReservas+" automov. reservados"
                reservaDiaAutomovil.save flush:true
            }

            aceptar(solicitudReserva)

        }else if (tipoAuto.cantidad<=0) {
            
            request.withFormat {
                form multipartForm {
                    flash.message = "No hay automoviles disponibles del tipo seleccionado" 
                    redirect action:"index", method:"GET"
                }
                '*'{ render status: NO_CONTENT }
            }
        }
    }
}
