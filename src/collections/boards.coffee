define ['backbone', 'models/board'], (Backbone, Board) ->
	class BoardsCollection extends Backbone.Collection
		model: Board
		url: ->
			"https://trello.com/1/members/me/boards?key=#{localStorage.getItem('trelloKey')}&token=#{localStorage.getItem('trelloToken')}"
	return BoardsCollection
