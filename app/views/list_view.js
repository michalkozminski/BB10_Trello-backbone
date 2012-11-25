(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(['jquery', 'backbone', 'underscore', 'bb', 'collections/boards', 'views/list_view_item', 'text!templates/list_view.html'], function($, Backbone, _, bb, BoardsCollection, ListViewItem, template) {
    var ListView;
    ListView = (function(_super) {

      __extends(ListView, _super);

      function ListView() {
        ListView.__super__.constructor.apply(this, arguments);
      }

      ListView.prototype.initialize = function() {
        this.template = _.template(this.options.template);
        this.render();
        return this.model.on("reset", this.render, this);
      };

      ListView.prototype.render = function() {
        $(this.el).empty();
        _.each(this.model.models, function(singleModel) {
          return this.renderOne(singleModel);
        }, this);
        return console.log(this.el);
      };

      ListView.prototype.renderOne = function(singleModel) {
        var board;
        board = new ListViewItem({
          model: singleModel,
          template: this.template
        });
        return $(this.el).append(board.render().el);
      };

      return ListView;

    })(Backbone.View);
    return ListView;
  });

}).call(this);
