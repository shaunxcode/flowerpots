FlowerPots = require "flowerpots"

myPots = new FlowerPots

item = (name, children) -> {name, children}
recipe = (name, recipe...) -> {name, recipe}

myPots.setData [
  item "fruits", [
    item "berries", [
      item "raspberry"
      item "blackberry"
      item "boisenberry", [
        recipe "amazing pie", "mix all ingredients together"
        recipe "incredible jam"]]
    item "stone fruit", [
      item "peach"
      item "apricot"
      item "plum"]]
  item "vegetables", [
    item "zucchini", [
      item "soups", [
        item "vegetable stew"
        item "zucchini broth"]
      item "breads", [
        recipe "zucchini bread", "mix zucchini into a bread recipe..."
        recipe "banana bread", "make bread with bananas!"
        recipe "breakfast muffin", 
          "1 cup zucchini"
          "1/2 cup apple sauce"
          "mix together... bake"]
      item "snacks"]
    item "carrot"
    item "bok choy"]
  item "grains", [
    item "Quinoa"
    item "Wheat"
    item "Corn", [
      item "breads", [
        recipe "tortilla",
          "1 cup corn kernels"
          "place corn on couch"
          "put nice boots on"
          "grind the corn into the couch with heals of boots"
          "fry in a pan"]]]]

myPots.on "selected", (el, item) ->
  document.getElementById("recipe").innerHTML = item.recipe ? "" 

myPots.el.appendTo document.getElementById "MyFlowerPot"