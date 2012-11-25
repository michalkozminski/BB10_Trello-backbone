define ['backbone', 'models/list'], (Backbone, List) ->
	class ListsCollection extends Backbone.Collection
		model: List
		url: ->
			"https://trello.com/1/boards/#{@boardId}/lists?key=#{localStorage.getItem('trelloKey')}&token=#{localStorage.getItem('trelloToken')}"
