(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(['jquery', 'backbone', 'underscore', 'text!templates/board_cards_tab.html', 'text!board_cards_tab_item.html'], function($, Backbone, _, template, item_template) {
    var BoardCardsTabsView;
    return BoardCardsTabsView = (function(_super) {

      __extends(BoardCardsTabsView, _super);

      function BoardCardsTabsView() {
        BoardCardsTabsView.__super__.constructor.apply(this, arguments);
      }

      BoardCardsTabsView.prototype.template = _.template(template);

      BoardCardsTabsView.prototype.initialize = function() {
        $("#menu").html(template);
        return this.render();
      };

      BoardCardsTabsView.prototype.render = function() {
        return _.each(this.model.models, function(singleModel, key) {
          return this.renderOne(singleModel, key);
        }, this);
      };

      BoardCardsTabsView.prototype.renderOne = function(singleModel, key) {
        var jsonModel;
        jsonModel = singleModel.toJSON();
        jsonModel["key"] = key;
        return $("#actionbar").append(this.template(jsonModel));
      };

      return BoardCardsTabsView;

    })(Backbone.BoardView);
  });

}).call(this);
