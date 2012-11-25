require.config(
	'baseUrl': "app/"
	'paths':
		"underscore": "libs/underscore-min"
		"backbone-core": "libs/backbone"
		"jquery": "libs/jquery-1.8.2.min"
		"backbone": "libs/backbone-relational"
	'shim':
		"backbone":
			'deps': ['jquery', 'underscore', 'backbone-core']
			'exports': 'Backbone'
		"underscore":
			'exports': '_'
)
require([
	'underscore',
	'backbone',
	'routers/app',
	], 
	(_, Backbone, Router)->
		Trello =
			key: "87ac65f2828882a57ea1d05fb1e40c88"
			userToken: ""

		lochash = location.hash.substr(1)
		token = lochash.substr(lochash.indexOf('token='))
		                .split('&')[0]
		                .split('=')[1]
		window.auth = ->
			current_location = window.location.href
			redirect_to = "https://trello.com/1/authorize?key=#{Trello.key}&name=AppName&expiration=never&redirect_uri=#{current_location}&callback_method=fragment"
			window.location = redirect_to
		if token
			localStorage.setItem("trelloToken", token)
			localStorage.setItem("trelloKey", Trello.key)

		if localStorage.getItem("trelloToken")
			app_router = new Router
			Backbone.history.start()
		else
			window.auth()

)
