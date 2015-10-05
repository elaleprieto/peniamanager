angular.module('starter.services', [])

.factory 'Partners', ['$localstorage', ($localstorage) ->

	partners = $localstorage.getObject('partners')

	all: ->
		partners
	
	remove: (chat) -> 
		partners.splice(partners.indexOf(chat), 1)
	
	get: (chatId) -> 
		for partner in partners
			if partner.id is parseInt(chatId) then return partner
		null

	saveAll: (partners) ->
		$localstorage.setObject('partners', partners)

]