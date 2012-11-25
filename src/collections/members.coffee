define ['backbone', 'models/member'], (Backbone, Member) ->
	class MembersCollection extends Backbone.Collection
		model: Member
