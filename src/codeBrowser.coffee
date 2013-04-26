FlowerPots = require "flowerpots"

item = (name, children) -> {name, children}
method = (name, code) -> {name, code}

codeBrowser = new FlowerPots 
codeBrowser.setData [
  item "Some Package"
  item "Some Other Package"
  item "Backbone", [
    item "Events", [
      item "Accessing", [
          method "on", """
(name, callback, context) ->
  return this  if not eventsApi(this, "on", name, [callback, context]) or not callback
  @_events or (@_events = {})
  events = @_events[name] or (@_events[name] = [])
  events.push
    callback: callback
    context: context
    ctx: context or this

  this
"""
          method "off", """
(name, callback, context) ->
  return this  if not @_events or not eventsApi(this, "off", name, [callback, context])
  if not name and not callback and not context
    @_events = {}
    return this
  names = (if name then [name] else _.keys(@_events))
  i = 0
  l = names.length

  while i < l
    name = names[i]
    if events = @_events[name]
      @_events[name] = retain = []
      if callback or context
        j = 0
        k = events.length

        while j < k
          ev = events[j]
          retain.push ev  if (callback and callback isnt ev.callback and callback isnt ev.callback._callback) or (context and context isnt ev.context)
          j++
      delete @_events[name]  unless retain.length
    i++
  this
"""]
      item "Actions", [ 
          item "trigger"
          item "once"
          item "listenTo"
          item "stopListening"
          item "listenToOnce"]]
    item "Model", [
      item "Initialization", [
          item "extend"
          item "constructor"
          item "initialize"]
      item "Accessing", [
          item "set"
          item "get"
          item "has"
          item "unset"
          item "clear"
          item "escape"
          item "toJSON"
          item "isNew"
          item "isValid"
          item "hasChanged"
          item "changedAttributes"
          item "previous"
          item "previousAttributes"]
      item "Properties", [
          item "id"
          item "cid"
          item "attributes"
          item "changed"]
      item "Configuration", [ 
          item "idAttribute"
          item "defaults"
          item "validationError"
          item "url"
          item "urlRoot"]
      item "Actions", [
          item "sync"
          item "fetch"
          item "save"
          item "destroy"
          item "validate"
          item "parse"
          item "clone"]]
    item "Collection", [
    	item "Initialization", [
            item "extend"
            item "constructor"
            item "initialize"]
    	item "Accessing", [
    		item "add"
    		item "at"
            item "get"
            item "set"
            item "toJSON"
            item "remove"
            item "array oriented", [ 
                item "push"
                item "pop"
                item "unshift"
                item "shift"
                item "slice"
                item "length"]
            item "search", [ 
                item "pluck"
                item "where"
                item "findWhere"]]
        item "Actions", [
            item "sync"
            item "reset"
            item "sort"
            item "parse"
            item "clone"
            item "fetch"
            item "create"]
    	item "Properties", [
            item "models"]
        item "Configuration", [
            item "model"
            item "comparator"
            item "url"]]
    item "Router", [
    	item "Initialization", [
    		item "extend"
    		item "constructor"
    		item "initialize"]
    	item "Actions", [
    		item "route"
    		item "navigate"]]]]

codeEditor = CodeMirror.fromTextArea document.getElementById("code"), 
	lineNumbers: true 
	lineWrapping: true 

codeBrowser.on "selected", (el, item) -> 
	codeEditor.setValue item.code ? ""

codeBrowser.on "opened", -> codeEditor.setValue ""


codeBrowser.el.appendTo document.getElementById "MyFlowerPot"