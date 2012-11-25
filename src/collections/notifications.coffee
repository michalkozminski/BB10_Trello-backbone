define ['backbone', 'models/notification'], (Backbone, Notification) ->
	class NotificationsCollection extends Backbone.Collection
		model: Notification
		url: ->
			"https://trello.com/1/members/me/notifications?key=#{localStorage.getItem('trelloKey')}&token=#{localStorage.getItem('trelloToken')}"

