define ['backbone', 'models/checklist'], (Backbone, Checklist) ->
	class ChecklistsCollection extends Backbone.Collection
		model: Checklist
