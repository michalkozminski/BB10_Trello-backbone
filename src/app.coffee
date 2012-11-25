$ ->
	Trello =
		key: "87ac65f2828882a57ea1d05fb1e40c88"
		userToken: ""


	lochash    = location.hash.substr(1)
	token = lochash.substr(lochash.indexOf('token='))
	                .split('&')[0]
	                .split('=')[1]


	window.auth = ->
		current_location = window.location.href
		redirect_to = "https://trello.com/1/authorize?key=#{Trello.key}&name=AppName&expiration=never&redirect_uri=#{current_location}&callback_method=fragment"
		window.location = redirect_to

	class Member extends Backbone.Model
		initialize: ->
			@id = @attributes.idMember if @attributes.idMember
		url: ->
			"https://trello.com/1/members/#{@id}?key=#{Trello.key}&token=#{Trello.userToken}"

	class Organization extends Backbone.Model

	class Card extends Backbone.Model
		initialize: ->
			@comments = new CommentsList
			@comments.id = @id


	class List extends Backbone.Model
		url: ->
			"https://trello.com/1/lists/#{@id}?key=#{Trello.key}&token=#{Trello.userToken}"
		initialize: ->
			@cards = new CardsList
			@cards.id = @id

	class Board extends Backbone.Model
		url: ->
			"https://trello.com/1/boards/#{@id}?key=#{Trello.key}&token=#{Trello.userToken}"
		initialize: ->
			@lists = new ListsList
			@lists.id = @id

	class Comment extends Backbone.Model

	class MembersList extends Backbone.Collection
		model: Member

	class OrganizationsList extends Backbone.Collection
		model: Organization
		url: ->
			"https://trello.com/1/members/me/organizations?key=#{Trello.key}&token=#{Trello.userToken}"

	class ListsList extends Backbone.Collection
		model: List
		url: ->
			"https://trello.com/1/boards/#{@id}/lists?key=#{Trello.key}&token=#{Trello.userToken}"
					

	class BoardsList extends Backbone.Collection
		model: Board
		url: ->
			"https://trello.com/1/members/me/boards?key=#{Trello.key}&token=#{Trello.userToken}"

	class CardsList extends Backbone.Collection
		model: Card
		url: ->
			"https://trello.com/1/lists/#{@id}/cards?key=#{Trello.key}&token=#{Trello.userToken}"

	class CardsList extends Backbone.Collection
		model: Card
		url: ->
			"https://trello.com/1/lists/#{@id}/cards?key=#{Trello.key}&token=#{Trello.userToken}"

	class CommentsList extends Backbone.Collection
		model: Comment
		url: ->
			"https://api.trello.com/1/cards/#{@id}/actions?filter=commentCard&key=#{Trello.key}&token=#{Trello.userToken}"
		
	

	class ListItemView extends Backbone.View
		initialize: ->
			@template = @options.template
			@render()
		render: ->
			$(@el).html(@template(@model.toJSON()))
			@

	class ListView extends Backbone.View
		initialize: ->
			@template = _.template(@options.template.html())
			console.log @
			@render()
			@model.on("reset", @render, @)
		render: ->
			$(@el).empty()
			that = @
			_.each @model.models, (singleModel) ->
				that.renderOne(singleModel)
			bb.imageList.apply([@el])
		renderOne: (singleModel) ->
			board = new ListItemView(model: singleModel, template: @template)
			$(@el).append(board.render().el)

	class HomeTabs extends Backbone.View
		template: _.template($("#tabs").html())
		initialize: (selected) ->
			$("#menu").html(@template(
				"selected": selected
			))
			bb.actionBar.apply($("#actionbar")[0])

	class ListsTabView extends Backbone.View
		template: _.template($("#lists_tabs_item_template").html())
		initialize: ->
			$("#menu").html($("#lists_tabs_template").html())
			@render()
		render: ->
			that = @
			_.each @model.models, (singleModel, key)->
				that.renderOne(singleModel, key)
			bb.actionBar.apply($("#actionbar")[0])
		renderOne: (singleModel, key) ->
			jsonModel = singleModel.toJSON()
			jsonModel["key"] = key
			$("#actionbar").append(@template(jsonModel))

	class CardView extends Backbone.View
		template: _.template($("#card_template").html())
		initialize: ->
			@render()
			@model.comments.fetch(
				success: (data)->
					commentsView = new CommentsView(model: data)
			)

		render: ->
			$("#screen").html(@template(@model.toJSON()))
			bb.roundPanel.apply $("[data-bb-type=round-panel]")

	class CommentsView extends Backbone.View
		el: $("#screen")
		template: _.template($("#comment_item_template").html())
		events:
			"click .button" : "add"
		initialize: ->
			console.log $("body")
			@render()
		render: ->
			_.each(@model.models, @renderOne, this)
			bb.roundPanel.apply $("#comments > [data-bb-type=round-panel]")
		renderOne: (singleModel) ->
			$("#comments").append(@template(singleModel.toJSON()))
		add: ->
			comment = new Comment(
				text: "sample text"
			)
			comment.url = ->
				"https://api.trello.com/1/cards/#{@boardId}/actions/comments?key=#{Trello.key}&token=#{Trello.userToken}"

			console.log comment
			comment.save()

	class OrganizationView extends Backbone.View
		el: $("#screen")
		template: _.template($("#organization_template").html())
		initialize: ->
			@render()
		render: ->
			$(@el).html(@template(@model.toJSON()))
			users = new MembersList(@model.toJSON().memberships)
			_.each(users.models, (user)->
				user.fetch()
				view = new MemberView(model: user)
				$("#users").append(view.render().el)
			, @)
			bb.doLoad($("#screen")[0])
			# bb.roundPanel.apply $("[data-bb-type=round-panel]")

	class MemberView extends Backbone.View
		template: _.template($("#user_item_template").html())
		initialize: ->
			@model.on("change", @render, @)
		render: ->
			$(@el).html(@template(@model.toJSON())) if @model.attributes.fullName
			bb.imageList.apply($("#users"))
			@

	class MemberDetailsView extends Backbone.View
		template: _.template($("#member_details_template").html())
		el: $("#screen")
		initialize: ->
			@model.on("change", @render, @)
		render: ->
			$(@el).html(@template(@model.toJSON()))
			bb.doLoad($("#screen")[0])




	if token
		localStorage.setItem("trelloToken", token)
				


	if localStorage.getItem("trelloToken")
		Trello.userToken = localStorage.getItem("trelloToken")

		class AppRouter extends Backbone.Router
			routes :
				"organizations": "getMyOrganizations"
				"organizations/:organizationId": "getOrganization"
				"boards": "getMyBoards"
				"boards/:id" : "getBoard"
				"boards/:id/lists/:idList/cards" : "getCardsFromList"
				"boards/:id/lists/:idList/cards/:cardID" : "getCard"
				"member/:id" : "getMember"
				"*actions" : "getMyBoards"
			getMyBoards: ->
				Trello.boardsList = new BoardsList unless Trello.boardsList
				list = new ListView(
					model: Trello.boardsList
					el: $ "#screen"
					template: $("#board")
				)
				Trello.boardsList.fetch()
				tabs = new HomeTabs("boards")
			getMyOrganizations: ->
				Trello.organizationsList = new OrganizationsList unless Trello.organizationsList
				list = new ListView(
					model: Trello.organizationsList
					el: $ "#screen"
					template: $("#organization_item_template")
				)
				Trello.organizationsList.fetch()
				tabs = new HomeTabs("organizations")
			getBoard: (boardId) ->
				board = Trello.boardsList.where(
					id: boardId
				)[0]
				board.lists.fetch
					success: (data) ->
						tabs = new ListsTabView(model: data)
						data.models[0].cards.fetch
							success: (data) ->
								console.log data
								list = new ListView(
									model: data
									el: $ "#screen"
									template: $("#card_on_list_template")
								)
			getOrganization: (organizationId) ->
				organization = Trello.organizationsList.where(id: organizationId)[0]
				console.log organization
				new OrganizationView(model :organization)

			getCardsFromList: (boardId, listId) ->
				board = Trello.boardsList.where(
					id: boardId
				)[0]
				list = board.lists.where(
					id: listId
				)[0]
				cards = list.cards
				view = new ListView(
					model: cards
					el: $ "#screen"
					template: $("#card_on_list_template")
				)
				cards.fetch()

			getCard: (boardId, listId, cardId) ->
				card = Trello.boardsList.where(
					id: boardId
				)[0].lists.where(
					id: listId
				)[0].cards.where(
					id: cardId
				)[0]
				console.log(card)
				cardView = new CardView(model: card)
			getMember: (memberId) ->
				member = new Member(id: memberId)
				member.fetch()
				new MemberDetailsView(model: member)

	
		app_router = new AppRouter
		Backbone.history.start()
