define ['jquery', 
		'backbone',
		'underscore',
		'collections/cards'
		'views/cards_view',
		'text!templates/board_cards_tab_item.html'
		], ($, Backbone, _, CardsCollection, CardsView, item_template) ->
			class BoardCardsTabsViewItem extends Backbone.View
				template: _.template(item_template)
				events:
					"click": "onClick"
				render: (key) ->
					jsonModel = @model.toJSON()
					jsonModel["key"] = key
					$(@el).html(@template(jsonModel))
					@
				onClick: ->
					cards = new CardsCollection
					cards.listId = @model.id
					new CardsView(
						model: cards
						el: $("#screen")
					)
					cards.fetch
						success: (data) ->
							console.log("fetched")
							console.log(data)

