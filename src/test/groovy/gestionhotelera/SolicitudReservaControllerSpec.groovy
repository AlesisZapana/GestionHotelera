package gestionhotelera

import grails.test.mixin.*
import spock.lang.*

@TestFor(SolicitudReservaController)
@Mock(SolicitudReserva)
class SolicitudReservaControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
        assert false, "TODO: Provide a populateValidParams() implementation for this generated test suite"
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.solicitudReservaList
            model.solicitudReservaCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.solicitudReserva!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def solicitudReserva = new SolicitudReserva()
            solicitudReserva.validate()
            controller.save(solicitudReserva)

        then:"The create view is rendered again with the correct model"
            model.solicitudReserva!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            solicitudReserva = new SolicitudReserva(params)

            controller.save(solicitudReserva)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/solicitudReserva/show/1'
            controller.flash.message != null
            SolicitudReserva.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def solicitudReserva = new SolicitudReserva(params)
            controller.show(solicitudReserva)

        then:"A model is populated containing the domain instance"
            model.solicitudReserva == solicitudReserva
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def solicitudReserva = new SolicitudReserva(params)
            controller.edit(solicitudReserva)

        then:"A model is populated containing the domain instance"
            model.solicitudReserva == solicitudReserva
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/solicitudReserva/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def solicitudReserva = new SolicitudReserva()
            solicitudReserva.validate()
            controller.update(solicitudReserva)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.solicitudReserva == solicitudReserva

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            solicitudReserva = new SolicitudReserva(params).save(flush: true)
            controller.update(solicitudReserva)

        then:"A redirect is issued to the show action"
            solicitudReserva != null
            response.redirectedUrl == "/solicitudReserva/show/$solicitudReserva.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/solicitudReserva/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def solicitudReserva = new SolicitudReserva(params).save(flush: true)

        then:"It exists"
            SolicitudReserva.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(solicitudReserva)

        then:"The instance is deleted"
            SolicitudReserva.count() == 0
            response.redirectedUrl == '/solicitudReserva/index'
            flash.message != null
    }
}
