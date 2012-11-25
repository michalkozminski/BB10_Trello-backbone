define ['jquery', 
		'backbone',
		'underscore',
		'views/board_cards_tab_view_item'
		'text!templates/board_cards_tab.html'
		], ($, Backbone, _, BoardCardsTabsViewItem, template) ->
			class BoardCardsTabsView extends Backbone.View
				initialize: ->
					$("#menu").html(template)
					@render()
				render: ->
					_.each @model.models, (singleModel, key)->
						@renderOne(singleModel, key)	
					, @
					bb.actionBar.apply($("#actionbar")[0])
				renderOne: (singleModel, key) ->
					item = new BoardCardsTabsViewItem(model: singleModel)
					$("#actionbar").append(item.render(key).el)


