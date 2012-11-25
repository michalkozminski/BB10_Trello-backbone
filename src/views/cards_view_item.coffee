define ['jquery', 
		'backbone',
		'underscore',
		'views/card_view',
		'text!templates/cards_view_item.html'], ($, Backbone, _, CardView, item_template) ->
			class CardsViewItem extends Backbone.View
				template: _.template(item_template)
				events:
					"click" : "renderCard"
				render: ->
					$(@el).html(@template(@model.toJSON()))
					return @
				renderCard: ->
					card = new CardView
						el: $("#screen")
						model: @model


