

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'gestionhotelera.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'gestionhotelera.UserRole'
grails.plugin.springsecurity.authority.className = 'gestionhotelera.Role'
grails.plugin.springsecurity.logout.postOnly = false

grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']],
	[pattern: '/solicitudReserva/create', access: ['permitAll']],
	[pattern: '/solicitudReserva/save/**', access: ['permitAll']],
	[pattern: '/solicitudReserva/show/**', access: ['permitAll']],
	[pattern: '/index/index',          access: ['permitAll']],
	[pattern: '/calendario',          access: ['ROLE_ADMIN']],
	[pattern: '/Automovil/**',          access: ['ROLE_ADMIN']],
	[pattern: '/solicitudHabitacion/create', access: ['permitAll']],
	[pattern: '/solicitudHabitacion/save/**', access: ['permitAll']],
	[pattern: '/solicitudHabitacion/show/**', access: ['permitAll']],
	[pattern: '/solicitudAutomovil/create', access: ['permitAll']],
	[pattern: '/solicitudAutomovil/save/**', access: ['permitAll']],
	[pattern: '/solicitudAutomovil/show/**', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

