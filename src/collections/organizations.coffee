define ['backbone', 'models/organization'], (Backbone, Organization) ->
	class OrganizationCollection extends Backbone.Collection
		model: Organization
		url: ->
			"https://trello.com/1/members/me/organizations?key=#{localStorage.getItem('trelloKey')}&token=#{localStorage.getItem('trelloToken')}"
	return OrganizationCollection
