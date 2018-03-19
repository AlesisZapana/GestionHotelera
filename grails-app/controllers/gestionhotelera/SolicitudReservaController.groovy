package gestionhotelera

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.*

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class SolicitudReservaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SolicitudReserva.list(params), model:[solicitudReservaCount: SolicitudReserva.count()]
    }

    def show(SolicitudReserva solicitudReserva) {
        respond solicitudReserva
    }

    /*def create() {
        respond new SolicitudReserva(params)
    }*/

    @Transactional
    def save(SolicitudReserva solicitudReserva) {
        if (solicitudReserva == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (solicitudReserva.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond solicitudReserva.errors, view:'create'
            return
        }

        solicitudReserva.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'solicitudReserva.label', default: 'SolicitudReserva'), solicitudReserva.id])
                redirect solicitudReserva
            }
            '*' { respond solicitudReserva, [status: CREATED] }
        }
    }

    def edit(SolicitudReserva solicitudReserva) {
        respond solicitudReserva
    }

    @Transactional
    def update(SolicitudReserva solicitudReserva) {
        if (solicitudReserva == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (solicitudReserva.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond solicitudReserva.errors, view:'edit'
            return
        }

        solicitudReserva.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'solicitudReserva.label', default: 'SolicitudReserva'), solicitudReserva.id])
                redirect solicitudReserva
            }
            '*'{ respond solicitudReserva, [status: OK] }
        }
    }

    @Transactional
    def delete(SolicitudReserva solicitudReserva) {

        //solicitudReserva=SolicitudReserva.get(params.id)
        if (solicitudReserva == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        solicitudReserva.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.messageAceptado = message(code: 'default.deleted.message', args: [message(code: 'solicitudReserva.label', default: 'SolicitudReserva'), solicitudReserva.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Transactional
    def aceptar(SolicitudReserva solicitudReserva) {

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
    def aceptarSolicitud(SolicitudReserva solicitudReserva){
        
        def lista = Habitacion.list()
        def habitacionesDisponibles = lista.findAll { it.disponibilidad == true }
        def habitacion = habitacionesDisponibles.find { it.plazas >= solicitudReserva.cantidadHuespedes}

        def tipo=solicitudReserva.tipoAutomovil
        def listaAutos=Automovil.list()
        def tipoAuto = listaAutos.find { it.tipo == tipo }

        if ((habitacion != null) && (tipoAuto.cantidad>0)) {            
       
            habitacion.disponibilidad=false 
            Huesped titular = new Huesped()
            titular.nombre = solicitudReserva.nombre
            titular.apellido = solicitudReserva.apellido
            titular.tipoDocumento = solicitudReserva.tipoDocumento
            titular.numeroDocumento = solicitudReserva.numeroDocumento
            titular.email = solicitudReserva.email
            
            titular.save flush:true


            Reserva reserva=new Reserva()
            reserva.fechaReserva=solicitudReserva.fechaReserva
            reserva.cantidadHuespedes=solicitudReserva.cantidadHuespedes
            reserva.habitacion=habitacion
            reserva.titular=titular

            reserva.start=solicitudReserva.fechaReserva
            reserva.title=solicitudReserva.nombre +"-"+ habitacion
            reserva.url="reserva/show/${Reserva.list().size()+1}"
            reserva.save flush:true
            habitacion.save flush:true

            def reservaDiaHabitacion =DiaReserva.list().find { it.start == solicitudReserva.fechaReserva && it.tipo == "Habitacion"}
            if (reservaDiaHabitacion == null){
                DiaReserva diaReserva=new DiaReserva()
                diaReserva.tipo="Habitacion"
                diaReserva.cantidadReservas++            
                diaReserva.start=solicitudReserva.fechaReserva
                diaReserva.title=diaReserva.cantidadReservas+" habitac. reservadas"
                diaReserva.save flush:true
            }else{
                reservaDiaHabitacion.cantidadReservas++            
                //reservaDiaHabitacion.start=solicitudReserva.fechaReserva
                reservaDiaHabitacion.title=reservaDiaHabitacion.cantidadReservas+" habitac. reservadas"
                reservaDiaHabitacion.save flush:true
            }

            
            
            ReservaAutomovil reservaAutomovil=new ReservaAutomovil()
            reservaAutomovil.fechaReserva=solicitudReserva.fechaReserva
            reservaAutomovil.auto=tipoAuto
            reservaAutomovil.titular=titular
            reservaAutomovil.start=solicitudReserva.fechaReserva
            reservaAutomovil.title="Auto "+tipoAuto.tipo
            reservaAutomovil.url="reservaAutomovil/show/${reservaAutomovil.list().size()+1}"
            reservaAutomovil.save flush:true
            
            tipoAuto.cantidad--
            tipoAuto.save flush:true
            
            def reservaDiaAutomovil = DiaReserva.list().find { it.start == reservaAutomovil.fechaReserva && it.tipo=="Automovil" }

            if (reservaDiaAutomovil==null){
                DiaReserva diaReserva = new DiaReserva()
                diaReserva.tipo="Automovil"
                diaReserva.cantidadReservas++            
                diaReserva.start=solicitudReserva.fechaReserva
                diaReserva.title=diaReserva.cantidadReservas+" automov. reservados"
                diaReserva.save flush:true
            }else {
                reservaDiaAutomovil.cantidadReservas++
                reservaDiaAutomovil.title=reservaDiaAutomovil.cantidadReservas+" automov. reservados"
                reservaDiaAutomovil.save flush:true
            }

            aceptar(solicitudReserva)

        }else if (habitacion==null) {
            
            request.withFormat {
                form multipartForm {
                    flash.message = "No se han encontrado habitaciones disponibles" 
                    redirect action:"index", method:"GET"
                }
                '*'{ render status: NO_CONTENT }
            }
        } else if (tipoAuto.cantidad<=0) {
            
            request.withFormat {
                form multipartForm {
                    flash.message = "No hay automoviles disponibles del tipo seleccionado" 
                    redirect action:"index", method:"GET"
                }
                '*'{ render status: NO_CONTENT }
            }
        }

    }

    def enviarJSON(){
        render SolicitudReserva.list() as JSON
    }
    
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'solicitudReserva.label', default: 'SolicitudReserva'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

}
