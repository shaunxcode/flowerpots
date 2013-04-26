// Generated by CoffeeScript 1.6.2
(function() {
  var FlowerPots, codeBrowser, codeEditor, item, method;

  FlowerPots = require("flowerpots");

  item = function(name, children) {
    return {
      name: name,
      children: children
    };
  };

  method = function(name, code) {
    return {
      name: name,
      code: code
    };
  };

  codeBrowser = new FlowerPots;

  codeBrowser.setData([item("Some Package"), item("Some Other Package"), item("Backbone", [item("Events", [item("Accessing", [method("on", "(name, callback, context) ->\n  return this  if not eventsApi(this, \"on\", name, [callback, context]) or not callback\n  @_events or (@_events = {})\n  events = @_events[name] or (@_events[name] = [])\n  events.push\n    callback: callback\n    context: context\n    ctx: context or this\n\n  this"), method("off", "(name, callback, context) ->\n  return this  if not @_events or not eventsApi(this, \"off\", name, [callback, context])\n  if not name and not callback and not context\n    @_events = {}\n    return this\n  names = (if name then [name] else _.keys(@_events))\n  i = 0\n  l = names.length\n\n  while i < l\n    name = names[i]\n    if events = @_events[name]\n      @_events[name] = retain = []\n      if callback or context\n        j = 0\n        k = events.length\n\n        while j < k\n          ev = events[j]\n          retain.push ev  if (callback and callback isnt ev.callback and callback isnt ev.callback._callback) or (context and context isnt ev.context)\n          j++\n      delete @_events[name]  unless retain.length\n    i++\n  this")]), item("Actions", [item("trigger"), item("once"), item("listenTo"), item("stopListening"), item("listenToOnce")])]), item("Model", [item("Initialization", [item("extend"), item("constructor"), item("initialize")]), item("Accessing", [item("set"), item("get"), item("has"), item("unset"), item("clear"), item("escape"), item("toJSON"), item("isNew"), item("isValid"), item("hasChanged"), item("changedAttributes"), item("previous"), item("previousAttributes")]), item("Properties", [item("id"), item("cid"), item("attributes"), item("changed")]), item("Configuration", [item("idAttribute"), item("defaults"), item("validationError"), item("url"), item("urlRoot")]), item("Actions", [item("sync"), item("fetch"), item("save"), item("destroy"), item("validate"), item("parse"), item("clone")])]), item("Collection", [item("Initialization", [item("extend"), item("constructor"), item("initialize")]), item("Accessing", [item("add"), item("at"), item("get"), item("set"), item("toJSON"), item("remove"), item("array oriented", [item("push"), item("pop"), item("unshift"), item("shift"), item("slice"), item("length")]), item("search", [item("pluck"), item("where"), item("findWhere")])]), item("Actions", [item("sync"), item("reset"), item("sort"), item("parse"), item("clone"), item("fetch"), item("create")]), item("Properties", [item("models")]), item("Configuration", [item("model"), item("comparator"), item("url")])]), item("Router", [item("Initialization", [item("extend"), item("constructor"), item("initialize")]), item("Actions", [item("route"), item("navigate")])])])]);

  codeEditor = CodeMirror.fromTextArea(document.getElementById("code"), {
    lineNumbers: true,
    lineWrapping: true
  });

  codeBrowser.on("selected", function(el, item) {
    var _ref;

    return codeEditor.setValue((_ref = item.code) != null ? _ref : "");
  });

  codeBrowser.on("opened", function() {
    return codeEditor.setValue("");
  });

  codeBrowser.el.appendTo(document.getElementById("MyFlowerPot"));

}).call(this);
