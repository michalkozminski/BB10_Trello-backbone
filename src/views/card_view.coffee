define ['jquery'
		'backbone'
		'underscore'
		'text!templates/card.html'
		'collections/cards'
		'models/comment'
		'views/card_edit_view'
		'views/card_menu_view'
		'text!templates/card/comment.html'
		'text!templates/card/my_comment.html'], ($, Backbone, _, template, CardsCollection, Comment, CardEditView, CardMenuView, comment_template, my_comment_template) ->
			class CardView extends Backbone.View
				template: _.template(template)
				commentTemplate: _.template(comment_template)
				myCommentTemplate: _.template(my_comment_template)
				events:
					"click #title": "editCard"
					"click #add_comment" : "addComment"
				initialize: ->
					@render()
					@model.comments.on("reset", @renderComments, @)
					@model.comments.fetch()
					@model.comments.on("add", @renderSingleComment, @)
					bb.doLoad($("#screen")[0])
					new CardMenuView(
						el: $("#menu")
						model: @model
					)
				render: ->
					console.log(@model.get("idMembers"))
					collection = new CardsCollection(@model.get("idMembers"))
					$(@el).html(@template(@model.toJSON()))
					bb.titleBar.apply($("#title")[0])
				renderComments: ->
					_.each(@model.comments.models, (singleModel)->
						@renderSingleComment(singleModel)
					,@)
					bb.doLoad($("#comments")[0])
				renderSingleComment: (comment) ->
					console.log comment
					$("#comments").append(@commentTemplate(comment.toJSON()))
				addSingleComment: (comment) ->
					$("#comments").append(@myCommentTemplate(comment.toJSON()))
				addComment: ->
					comment = new Comment(text: $("#commentText").val())
					comment.url ="https://trello.com/1/cards/#{@model.id}/actions/comments?key=#{localStorage.getItem('trelloKey')}&token=#{localStorage.getItem('trelloToken')}"
					comment.save()
					@addSingleComment(comment)
					$("#commentText").attr("value", "")

				editCard: ->
					new CardEditView(
						el: @el
						model: @model
					)
