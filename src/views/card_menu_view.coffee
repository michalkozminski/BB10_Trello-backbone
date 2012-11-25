define ['jquery', 
		'backbone',
		'underscore',
		'collections/checklists'
		'text!templates/card_menu.html'], ($, Backbone, _, ChecklistsCollections, template) ->
			class CardMenuView extends Backbone.View
				template: _.template(template)
				initialize: ->
					@model.checklists.on("reset", @render, @)
					@model.checklists.fetch()
					@render()
				render: ->
					console.log(@model.checklists)
					$(@el).html(@template(@model.checklists))
					bb.actionBar.apply($(@el)[0])

