define ['jquery', 'backbone', 'underscore', 'text!templates/home_tabs.html'], ($, Backbone, _, template) ->
	class HomeTabs extends Backbone.View
		template: _.template(template)
		initialize: (selected) ->
			$(@el).html(@template(
				"selected": selected
			))
			bb.actionBar.apply($(@el)[0])

	HomeTabs
