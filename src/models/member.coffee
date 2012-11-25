define ['backbone'], (Backbone) ->
	class Member extends Backbone.RelationalModel
		url: ->
			"https://trello.com/1/members/#{@id}?key=#{localStorage.getItem('trelloKey')}&token=#{localStorage.getItem('trelloToken')}"
