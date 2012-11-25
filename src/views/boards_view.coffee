define ['jquery', 
		'backbone',
		'underscore',
		'views/boards_view_item'
		'text!templates/boards_view.html'],
		($, Backbone, _, BoardsViewItem, template) ->
			class BoardsView extends Backbone.View
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
					board = new BoardsViewItem(model: singleModel)
					$(@el).append(board.render().el)
