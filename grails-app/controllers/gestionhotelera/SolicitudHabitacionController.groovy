package gestionhotelera

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.*

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class SolicitudHabitacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SolicitudHabitacion.list(params), model:[solicitudHabitacionCount: SolicitudHabitacion.count()]
    }

    def show(SolicitudHabitacion solicitudHabitacion) {
        respond solicitudHabitacion
    }

    def create() {
        respond new SolicitudHabitacion(params)
    }

    @Transactional
    def save(SolicitudHabitacion solicitudHabitacion) {
        if (solicitudHabitacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (solicitudHabitacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond solicitudHabitacion.errors, view:'create'
            return
        }

        solicitudHabitacion.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'solicitudHabitacion.label', default: 'SolicitudHabitacion'), solicitudHabitacion.id])
                redirect solicitudHabitacion
            }
            '*' { respond solicitudHabitacion, [status: CREATED] }
        }
    }

    def edit(SolicitudHabitacion solicitudHabitacion) {
        respond solicitudHabitacion
    }

    @Transactional
    def update(SolicitudHabitacion solicitudHabitacion) {
        if (solicitudHabitacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (solicitudHabitacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond solicitudHabitacion.errors, view:'edit'
            return
        }

        solicitudHabitacion.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'solicitudHabitacion.label', default: 'SolicitudHabitacion'), solicitudHabitacion.id])
                redirect solicitudHabitacion
            }
            '*'{ respond solicitudHabitacion, [status: OK] }
        }
    }

    @Transactional
    def delete(SolicitudHabitacion solicitudHabitacion) {

        if (solicitudHabitacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        solicitudHabitacion.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'solicitudHabitacion.label', default: 'SolicitudHabitacion'), solicitudHabitacion.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'solicitudHabitacion.label', default: 'SolicitudHabitacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    @Transactional
    def aceptar(SolicitudHabitacion solicitudReserva) {

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
    def aceptarSolicitud(SolicitudHabitacion solicitudReserva){
        
        def lista = Habitacion.list()
        def habitacionesDisponibles = lista.findAll { it.disponibilidad == true }
        def habitacion = habitacionesDisponibles.find { it.plazas >= solicitudReserva.cantidadHuespedes}

        if (habitacion != null) {            
       
            habitacion.disponibilidad=false 
            Huesped titular = new Huesped()
            titular.nombre = solicitudReserva.nombre
            titular.apellido = solicitudReserva.apellido
            titular.tipoDocumento = solicitudReserva.tipoDocumento
            titular.numeroDocumento = solicitudReserva.numeroDocumento
            titular.email = solicitudReserva.email
            titular.tipoReserva = "Habitacion"
            titular.save flush:true


            Reserva reserva=new Reserva()
            reserva.fechaReserva=solicitudReserva.fechaInicio
            reserva.cantidadHuespedes=solicitudReserva.cantidadHuespedes
            reserva.habitacion=habitacion
            reserva.titular=titular

            reserva.start=solicitudReserva.fechaInicio
            reserva.end=solicitudReserva.fechaFin
            reserva.title=solicitudReserva.nombre +"-"+ habitacion
            reserva.url="reserva/show/${Reserva.list().size()+1}"
            reserva.save flush:true
            habitacion.save flush:true

            def reservaDiaHabitacion =DiaReserva.list().find { it.start == solicitudReserva.fechaInicio && it.tipo == "Habitacion"}
            if (reservaDiaHabitacion == null){
                DiaReserva diaReserva=new DiaReserva()
                diaReserva.tipo="Habitacion"
                diaReserva.cantidadReservas++            
                diaReserva.start=solicitudReserva.fechaInicio
                diaReserva.title=diaReserva.cantidadReservas+" habitac. reservadas"
                diaReserva.save flush:true
            }else{
                reservaDiaHabitacion.cantidadReservas++
                //reservaDiaHabitacion.start=solicitudReserva.fechaInicio
                reservaDiaHabitacion.title=reservaDiaHabitacion.cantidadReservas+" habitac. reservadas"
                reservaDiaHabitacion.save flush:true
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
        } 

    }
}