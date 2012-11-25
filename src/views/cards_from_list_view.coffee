define ['jquery', 
		'backbone',
		'underscore',
		'collections/cards',
		'views/cards_item_view'], ($, Backbone, _, CardsCollection, CardsItemView) ->
			class CardsFromListView extends Backbone.View
				initialize: ->
					lists = new ListsCollection
					lists.boardId = @model.id
					lists.fetch
						success: (data) ->
							console.log data
							new BoardCardsTabsView(model: data)
				renderOne: (singleModel) ->
					view = new CardsItemView(model: singleModel)
					$(@el).append(view.render().el)



