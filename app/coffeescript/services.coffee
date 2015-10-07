angular.module('starter.services', [])

.factory 'Partners', ['$localstorage', ($localstorage) ->

	partners = $localstorage.getObject('partners')
	partnersNumber = $localstorage.get('partnersNumber', 0)

	all: ->
		partners
	
	remove: (chat) -> 
		partners.splice(partners.indexOf(chat), 1)
	
	get: (chatId) -> 
		for partner in partners
			if partner.id is parseInt(chatId) then return partner
		null

	getPartnersNumber: ->
		+partnersNumber

	saveAll: (partners, partnersNumber) ->
		console.log partnersNumber
		$localstorage.setObject('partners', partners)
		$localstorage.set('partnersNumber', partnersNumber)

]