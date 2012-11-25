define ['jquery', 
		'backbone',
		'underscore',
		'views/organization_view',
		'text!templates/organizations_item_view.html'], ($, Backbone, _, OrganizationView, template) ->
			class OrganizationsViewItem extends Backbone.View
				template: _.template(template)
				events:
					"click": "onClick"
				render: ->
					$(@el).html(@template(@model.toJSON()))
					return @
				onClick: ->
					new OrganizationView(
						model: @model
						el: $("#screen")
					)

