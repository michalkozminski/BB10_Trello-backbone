define ['jquery', 
		'backbone',
		'underscore',
		'collections/lists',
		'views/board_cards_tab_view'], ($, Backbone, _, ListsCollection, BoardCardsTabsView) ->
			class BoardView extends Backbone.View
				initialize: ->
					console.log(@model)
					lists = new ListsCollection
					lists.boardId = @model.id
					lists.fetch
						success: (data) ->
							console.log data
							new BoardCardsTabsView(model: data)
					console.log(lists)
			BoardView



