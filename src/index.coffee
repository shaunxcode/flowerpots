dom = require "dom"
Emitter = require "emitter"

class FlowerPots

	constructor: -> 
		@path = []
		@el = dom "<div/>"
		@el.addClass "FlowerPotContainer"
		@el.on "click", ".FlowerPot", (event) => 
			itemEl = dom event.toElement
			itemIndex = parseInt itemEl.attr "data-index"
			parent = @getParent()

			@el.find(".selected").removeClass "selected"

			if itemEl.hasClass "active"
				itemEl.remove()
				path = itemEl.attr "data-path"
				@el.find(".FlowerPot").forEach (item) -> 
					ipath = dom(item).attr "data-path" 
					if not ipath or ipath.length > path.length 
						item.remove()

				@setPath (parseInt index for index in path.split ":")
				@emit "groupSelected", @getParent()
			else if parent.children[itemIndex].children
				itemEl
					.removeClass("inactive")
					.addClass("active")
					.attr("data-path", @path.join ":")

				@path.push itemIndex
				@render()
				@emit "groupSelected", @getParent()
			else if not itemEl.hasClass "selected"
				itemEl.addClass "selected"
				@emit "selected", itemEl, parent.children[itemIndex]
				
	setPath: (@path) -> 
		@render()
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

	render: -> 
		parent = @getParent()
			
		if parent.children 
			@el.find(".inactive").remove()
			for item, index in parent.children
				@el.append dom("<div/>")
					.addClass("FlowerPot")
					.addClass("inactive")
					.attr("data-index", index)
					.text(item.name)
Emitter FlowerPots::
module.exports = FlowerPots