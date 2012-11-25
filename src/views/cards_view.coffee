define ['jquery', 
		'backbone',
		'underscore',
		'views/cards_view_item'], ($, Backbone, _,  CardsViewItem) ->
			class CardsView extends Backbone.View
				initialize: ->
					@render()
					@model.on("reset", @render, @)
				render: ->
					console.log @model
					$(@el).empty()
					_.each @model.models, (singleModel) ->
						@renderOne(singleModel)
					, @
					bb.imageList.apply($("#screen"))
				renderOne: (singleModel) ->
					board = new CardsViewItem(model: singleModel)
					$(@el).append(board.render().el)
