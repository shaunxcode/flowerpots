// Generated by CoffeeScript 1.6.1
(function() {
  var FlowerPots, dom;

  dom = require("dom");

  FlowerPots = (function() {

    function FlowerPots() {
      var _this = this;
      this.path = [];
      this.el = dom("<div/>");
      this.el.addClass("FlowerPotContainer");
      this.el.on("click", ".FlowerPot", function(event) {
        var index, itemEl, itemIndex, parent, path;
        itemEl = dom(event.toElement);
        itemIndex = parseInt(itemEl.attr("data-index"));
        parent = _this.getParent();
        _this.el.find(".selected").removeClass("selected");
        if (itemEl.hasClass("active")) {
          itemEl.remove();
          path = itemEl.attr("data-path");
          _this.el.find(".FlowerPot").forEach(function(item) {
            var ipath;
            ipath = dom(item).attr("data-path");
            if (!ipath || ipath.length > path.length) {
              return item.remove();
            }
          });
          return _this.setPath((function() {
            var _i, _len, _ref, _results;
            _ref = path.split(":");
            _results = [];
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
              index = _ref[_i];
              _results.push(parseInt(index));
            }
            return _results;
          })());
        } else if (parent.children[itemIndex].children) {
          itemEl.removeClass("inactive").addClass("active").attr("data-path", _this.path.join(":"));
          _this.path.push(itemIndex);
          return _this.render();
        } else {
          return itemEl.addClass("selected");
        }
      });
    }

    FlowerPots.prototype.setPath = function(path) {
      this.path = path;
      this.render();
      return this;
    };

    FlowerPots.prototype.setData = function(children) {
      if (children.length < 0) {
        throw new Error("Must provide array of items");
      }
      this.data = {
        children: [
          {
            children: children
          }
        ]
      };
      return this.setPath([0]);
    };

    FlowerPots.prototype.getParent = function() {
      var i, parent, _i, _len, _ref;
      parent = this.data;
      _ref = this.path;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        i = _ref[_i];
        parent = parent.children[i];
      }
      return parent;
    };

    FlowerPots.prototype.render = function() {
      var index, item, parent, _i, _len, _ref, _results;
      parent = this.getParent();
      if (parent.children) {
        this.el.find(".inactive").remove();
        _ref = parent.children;
        _results = [];
        for (index = _i = 0, _len = _ref.length; _i < _len; index = ++_i) {
          item = _ref[index];
          _results.push(this.el.append(dom("<div/>").addClass("FlowerPot").addClass("inactive").attr("data-index", index).text(item.name)));
        }
        return _results;
      }
    };

    return FlowerPots;

  })();

  module.exports = FlowerPots;

}).call(this);
