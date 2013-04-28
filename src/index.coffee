dom = require "dom"
Emitter = require "emitter"

class FlowerPots

	constructor: -> 
		@path = []
		@el = dom("<div/>").addClass "FlowerPotContainer"
		@topPot = dom("<div />").addClass("TopPot").appendTo @el
		@selectedItems = dom("<div />").addClass("SelectedItems").appendTo @el 
		@childrenItems = dom("<div />").addClass("ChildrenItems").appendTo @el 

		@topPot.on "click", (event) => 
			@selectedItems.empty()
			@setPath [0]
			@emit "opened", @getParent()

		@el.on "click", ".FlowerPot", (event) => 
			itemEl = dom event.toElement
			itemIndex = parseInt itemEl.attr "data-index"
			parent = @getParent()
			hasChildren = parent.children[itemIndex]?.children? or itemEl.attr("data-path")

			if itemEl.hasClass "active"
				itemEl.remove()
				path = itemEl.attr "data-path"
				@selectedItems.find(".FlowerPot").forEach (item) -> 
					ipath = dom(item).attr "data-path" 
					if not ipath or ipath.length > path.length 
						item.remove()

				@setPath (parseInt index for index in path.split ":")
				@emit "opened", @getParent()
			else if hasChildren and itemEl.hasClass "selected"
				itemEl
					.removeClass("inactive")
					.removeClass("selected")
					.addClass("active")
					.attr("data-path", @path.join ":")
					.appendTo @selectedItems 

				@path.push itemIndex
				@renderChildren()
				@emit "opened", @getParent()
			else if not itemEl.hasClass "selected"
				@el.find(".selected").removeClass "selected"
				itemEl.addClass "selected"
				@emit "selected", itemEl, parent.children[itemIndex]
				
	setPath: (@path) -> 
		@renderChildren()
		this

	setData: (children) ->
		if children.length < 0 
			throw new Error "Must provide array of items"

		@data = children: [{children}]
		@setPath [0]

	getParent: -> 
		parent = @data
		parent = parent.children[i] for i in @path 
		parent 

	renderChildren: -> 
		parent = @getParent()
		@childrenItems.empty()

		if parent.children 
			for item, index in parent.children
				@childrenItems.append child = dom("<div/>")
					.addClass("FlowerPot")
					.addClass("inactive")
					.addClass(if item.children then "HasChildren" else "NoChildren")
					.attr("data-index", index)
					.text(item.name) 

				child.append dom("<i />").addClass "icon-list-ul"
		
		@emit "rendered"

Emitter FlowerPots::
module.exports = FlowerPots
