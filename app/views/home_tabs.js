// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'backbone', 'underscore', 'text!templates/home_tabs.html'], function($, Backbone, _, template) {
    var HomeTabs;
    HomeTabs = (function(_super) {

      __extends(HomeTabs, _super);

      function HomeTabs() {
        return HomeTabs.__super__.constructor.apply(this, arguments);
      }

      HomeTabs.prototype.template = _.template(template);

      HomeTabs.prototype.initialize = function(selected) {
        $(this.el).html(this.template({
          "selected": selected
        }));
        return bb.actionBar.apply($(this.el)[0]);
      };

      return HomeTabs;

    })(Backbone.View);
    return HomeTabs;
  });

}).call(this);
