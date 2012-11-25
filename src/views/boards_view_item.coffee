define ['jquery', 
		'backbone',
		'underscore',
		'views/board_view'
		'text!templates/boards_item_view.html'], ($, Backbone, _, BoardView, template) ->
			class ListViewItem extends Backbone.View
				template: _.template(template)
				events:
					"click": "onClick"
				render: ->
					$(@el).html(@template(@model.toJSON()))
					return @
				onClick: ->
					new BoardView(model: @model)
			ListViewItem
