define ['backbone', 'models/card'], (Backbone, Card) ->
	class CardCollection extends Backbone.Collection
		model: Card
		url: ->
			"https://trello.com/1/lists/#{@listId}/cards?key=#{localStorage.getItem('trelloKey')}&token=#{localStorage.getItem('trelloToken')}"
