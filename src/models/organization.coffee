define ['backbone',
'models/member',
'collections/members'], (Backbone, Member, MembersCollection) ->
	class Organization extends Backbone.RelationalModel
		relations: [{
			type: Backbone.HasMany,
			key: 'memberships',
			relatedModel: Member,
			collectionType: MembersCollection,
			reverseRelation: {
				key: 'organization',
				includeInJSON: 'id'
			}
		}]
