FlowerPots = require "flowerpots"

item = (name, children) -> {name, children}

codeBrowser = new FlowerPots 
codeBrowser.setData [
  item "Some Package"
  item "Some Other Package"
  item "Backbone", [
    item "Events", [
      item "Accessing", [
          item "on" 
          item "off"]
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

codeBrowser.el.appendTo document.getElementById "MyFlowerPot"