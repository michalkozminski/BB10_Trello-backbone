define ['jquery', 
		'backbone',
		'underscore',
		'models/board',
		'text!templates/card_edit.html',
		'text!templates/card_edit/select_list.html',
		'text!templates/card_edit/select_list_option.html'], ($, Backbone, _, Board, template, select_template, option_template) ->
			class CardEditView extends Backbone.View
				template: _.template(template)
				optionTemplate: _.template(option_template)
				events:
					"click #titleBar" : "doSave"
				initialize: ->
					@board = new Board(id: @model.get('idBoard'))
					@board.lists.on("reset", @renderLists, @)
					@board.lists.fetch()
					@render()
				render: ->
					$(@el).html(@template(@model.toJSON()))
					bb.titleBar.apply($("#titleBar")[0])
					bb.doLoad($("#screen")[0])
				renderLists: ->
					$("#lists").append(select_template)
					_.each(@board.lists.models, (model)->
						$("#cardList").append @optionTemplate(model.toJSON())
					, @)
					bb.dropdown.apply($("#cardList"))
				doSave: ->
					alert("saving")
					@model.set(
						name: $("cardNameInput")
						desc: $("cardDescriptionInput")
					)
					@model.save()
					alert("saved")





