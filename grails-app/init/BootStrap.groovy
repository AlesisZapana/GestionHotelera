package gestionhotelera

class BootStrap {

    def init = {

    	User admin = new User(username: 'admin', password: 'admin').save()
        Role rolAdmin = new Role(authority: 'ROLE_ADMIN').save()
        UserRole.create(admin, rolAdmin)

        Hotel.getInstance().save flush:true

        //crear los tipos de automoviles
        Automovil economico = new Automovil(tipo: 'Economico', cantidad:3).save()
        Automovil familiar = new Automovil(tipo: 'Familiar', cantidad:2).save()
        Automovil lujo = new Automovil(tipo:'Lujo', cantidad:1).save()
        
        Habitacion hab1 = new Habitacion(plazas:3).save()
        Habitacion hab2 = new Habitacion(plazas:2).save()
        Habitacion hab3 = new Habitacion(plazas:4).save()
    }
    def destroy = {
    	
    }
}
