// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'backbone', 'underscore', 'collections/lists', 'views/board_cards_tab_view'], function($, Backbone, _, ListsCollection, BoardCardsTabsView) {
    var BoardView;
    BoardView = (function(_super) {

      __extends(BoardView, _super);

      function BoardView() {
        return BoardView.__super__.constructor.apply(this, arguments);
      }

      BoardView.prototype.initialize = function() {
        var lists;
        console.log(this.model);
        lists = new ListsCollection;
        lists.boardId = this.model.id;
        lists.fetch({
          success: function(data) {
            console.log(data);
            return new BoardCardsTabsView({
              model: data
            });
          }
        });
        return console.log(lists);
      };

      return BoardView;

    })(Backbone.View);
    return BoardView;
  });

}).call(this);
