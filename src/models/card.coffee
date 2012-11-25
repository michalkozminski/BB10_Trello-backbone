define ['backbone'
'models/member'
'collections/comments'
'collections/checklists'
], (Backbone, Member, CommentsCollection, ChecklistsCollection) ->
	class Card extends Backbone.Model
		url: ->
			"https://trello.com/1/cards/#{@id}?key=#{localStorage.getItem('trelloKey')}&token=#{localStorage.getItem('trelloToken')}"
		initialize: ->
			@comments = new CommentsCollection
			@comments.url = "https://api.trello.com/1/cards/#{@id}/actions?type=commentCard&key=#{localStorage.getItem('trelloKey')}&token=#{localStorage.getItem('trelloToken')}"
			
			@checklists = new ChecklistsCollection
			@checklists.url = "https://api.trello.com/1/cards/#{@id}/checklists?type=commentCard&key=#{localStorage.getItem('trelloKey')}&token=#{localStorage.getItem('trelloToken')}"
