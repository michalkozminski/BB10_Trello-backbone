define ['jquery', 
		'backbone',
		'underscore',
		'views/organizations_view_item'
		'text!templates/organizations_view.html'],
		($, Backbone, _, OrganizationsViewItem, template) ->
			class OrganizationsView extends Backbone.View
				template: _.template(template)
				initialize: ->
					@render()
					@model.on("reset", @render, @)
				render: ->
					$(@el).empty()
					_.each @model.models, (singleModel) ->
						@renderOne(singleModel)
					, @
					bb.imageList.apply($("#screen"))
				renderOne: (singleModel) ->
					board = new OrganizationsViewItem(model: singleModel)
					$(@el).append(board.render().el)
			OrganizationsView
