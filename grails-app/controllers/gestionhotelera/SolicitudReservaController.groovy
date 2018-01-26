package gestionhotelera

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
 
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

    def create() {
        respond new SolicitudReserva(params)
    }

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
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'solicitudReserva.label', default: 'SolicitudReserva'), solicitudReserva.id])
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
                flash.message = "Solicitud de reserva "+solicitudReserva.id+" aceptado" 
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

        if (habitacion != null) {            
       
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
            /*Habitacion habitacion=new Habitacion()
            habitacion.plazas=solicitudReserva.cantidadHuespedes*/
            reserva.habitacion=habitacion
            reserva.titular=titular

            reserva.save flush:true

            
            habitacion.save flush:true

            //SolicitudReserva unaSolicitud=params
            //unaSolicitud.delete
            
            //redirect(action:'delete',id:params.id)
            aceptar(solicitudReserva)

        }else{
            //poner un request
            //redirect(uri:"/solicitudReserva/index")

            request.withFormat {
                form multipartForm {
                    flash.message = "No se han encontrado habitaciones disponibles" 
                    redirect action:"index", method:"GET"
                }
                '*'{ render status: NO_CONTENT }
            }
        }

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
