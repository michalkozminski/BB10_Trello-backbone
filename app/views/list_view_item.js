(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(['jquery', 'backbone', 'underscore'], function($, Backbone, _) {
    var ListViewItem;
    ListViewItem = (function(_super) {

      __extends(ListViewItem, _super);

      function ListViewItem() {
        ListViewItem.__super__.constructor.apply(this, arguments);
      }

      ListViewItem.prototype.initialize = function() {};

      ListViewItem.prototype.render = function() {
        this.template = this.options.template;
        $(this.el).html(this.template(this.model.toJSON()));
        return this;
      };

      return ListViewItem;

    })(Backbone.View);
    return ListViewItem;
  });

}).call(this);
