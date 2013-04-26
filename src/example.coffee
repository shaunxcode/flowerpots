FlowerPots = require "flowerpots"

myPots = new FlowerPots

myPots.setData [
  {name: "fruits", children: [
    name: "berries", children: [
      name: "raspberry"
      name: "blackberry"
      name: "boisenberry", children:[
        name: "amazing pie"
        name: "incredible jam"]]
    name: "stone fruit", children: [
      name: "peach"
      name: "apricot"
      name: "plum"]]}
  {name: "vegetables", children: [
    name: "zucchini", children: [
      name: "soups", children: [
        name: "vegetable stew"
        name: "zucchini broth"]
      name: "breads", children: [
        name: "zucchini bread", recipe: "mix zucchini into a bread recipe..."
        name: "banana bread"
        name: "breakfast muffin"]
      name: "snacks"]
    name: "carrot"
    name: "bok choy"]}
  {name: "grains", children: [
    name: "Quinoa"
    name: "Wheat"
    name: "Corn"]}]

myPots.on "selected", (el, item) ->
  document.getElementById("recipe").innerHTML = item.recipe ? "" 

myPots.el.appendTo document.getElementById "MyFlowerPot"