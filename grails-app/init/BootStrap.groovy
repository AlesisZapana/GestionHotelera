package gestionhotelera

class BootStrap {

    def init = {

    	User admin = new User(username: 'admin', password: 'admin').save()
        Role rolAdmin = new Role(authority: 'ROLE_ADMIN').save()
        UserRole.create(admin, rolAdmin)

        Hotel.getInstance().save flush:true
    }
    def destroy = {
    }
}
