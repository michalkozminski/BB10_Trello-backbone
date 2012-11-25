// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['backbone', 'models/checklist'], function(Backbone, Checklist) {
    var ChecklistsCollection;
    return ChecklistsCollection = (function(_super) {

      __extends(ChecklistsCollection, _super);

      function ChecklistsCollection() {
        return ChecklistsCollection.__super__.constructor.apply(this, arguments);
      }

      ChecklistsCollection.prototype.model = Checklist;

      return ChecklistsCollection;

    })(Backbone.Collection);
  });

}).call(this);
