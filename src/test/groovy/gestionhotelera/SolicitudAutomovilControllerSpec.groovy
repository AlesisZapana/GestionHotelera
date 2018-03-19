package gestionhotelera

import grails.test.mixin.*
import spock.lang.*

@TestFor(SolicitudAutomovilController)
@Mock(SolicitudAutomovil)
class SolicitudAutomovilControllerSpec extends Specification {

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
            !model.solicitudAutomovilList
            model.solicitudAutomovilCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.solicitudAutomovil!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def solicitudAutomovil = new SolicitudAutomovil()
            solicitudAutomovil.validate()
            controller.save(solicitudAutomovil)

        then:"The create view is rendered again with the correct model"
            model.solicitudAutomovil!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            solicitudAutomovil = new SolicitudAutomovil(params)

            controller.save(solicitudAutomovil)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/solicitudAutomovil/show/1'
            controller.flash.message != null
            SolicitudAutomovil.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def solicitudAutomovil = new SolicitudAutomovil(params)
            controller.show(solicitudAutomovil)

        then:"A model is populated containing the domain instance"
            model.solicitudAutomovil == solicitudAutomovil
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def solicitudAutomovil = new SolicitudAutomovil(params)
            controller.edit(solicitudAutomovil)

        then:"A model is populated containing the domain instance"
            model.solicitudAutomovil == solicitudAutomovil
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/solicitudAutomovil/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def solicitudAutomovil = new SolicitudAutomovil()
            solicitudAutomovil.validate()
            controller.update(solicitudAutomovil)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.solicitudAutomovil == solicitudAutomovil

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            solicitudAutomovil = new SolicitudAutomovil(params).save(flush: true)
            controller.update(solicitudAutomovil)

        then:"A redirect is issued to the show action"
            solicitudAutomovil != null
            response.redirectedUrl == "/solicitudAutomovil/show/$solicitudAutomovil.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/solicitudAutomovil/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def solicitudAutomovil = new SolicitudAutomovil(params).save(flush: true)

        then:"It exists"
            SolicitudAutomovil.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(solicitudAutomovil)

        then:"The instance is deleted"
            SolicitudAutomovil.count() == 0
            response.redirectedUrl == '/solicitudAutomovil/index'
            flash.message != null
    }
}
