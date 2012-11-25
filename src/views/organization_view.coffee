define ['jquery', 
		'backbone',
		'underscore',
		'text!templates/organization.html'], ($, Backbone, _, template) ->
			class OrganizationView extends Backbone.View
				template: _.template(template)
				initialize: ->
					console.log @model.get('memberships')
					@render()
				render: ->
					$(@el).html(@template(@model.toJSON()))
					bb.doLoad($("#screen")[0])
					bb.titleBar.apply($("#title")[0])



