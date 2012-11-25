define ['backbone'
'collections/lists'], (Backbone, ListsCollection) ->
	class Board extends Backbone.Model
		url: ->
			"https://trello.com/1/boards/#{@id}?key=#{localStorage.getItem('trelloKey')}&token=#{localStorage.getItem('trelloToken')}"
		initialize: ->
			@lists = new ListsCollection
			@lists.boardId = @id 
	Board
