define ['backbone', 'models/comment'], (Backbone, Comment) ->
	class CommentsCollection extends Backbone.Collection
		model: Comment
