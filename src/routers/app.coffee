define ['backbone',
'jquery',
'underscore',
'collections/boards',
'collections/organizations',
'views/boards_view',
'views/home_tabs',
'views/organizations_view',
],
(Backbone, $, _, BoardsCollection, OrganizationsCollection, BoardsView, HomeTabsView, OrganizationsView) ->	
	class AppRouter extends Backbone.Router
		routes :
			"boards": "getMyBoards"
			"organizations": "getMyOrganizations"
			"*actions" : "getMyBoards"
		getMyBoards: ->
			console.log "boards"
			boardsList = new BoardsCollection
			list = new BoardsView(
				model: boardsList
				el: $ "#screen"
			)
			boardsList.fetch()
			tabs = new HomeTabsView("boards")
			$("#menu").html(tabs.el)
		getMyOrganizations: ->
			organizationsList = new OrganizationsCollection
			list = new OrganizationsView(
				model: organizationsList
				el: $ "#screen"
			)
			organizationsList.fetch()
	AppRouter