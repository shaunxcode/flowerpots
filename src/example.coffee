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
    item "quinoa", [
      item "salads", [
        recipe "Tabouleh", 
          "1 1/2 cup uncooked red quinoa"
          "1 cucumber chopped"
          "1 red onion chopped"
          "green onions"
          "2 teaspoons lemon juice"
          "1 tsp salt (add to taste)"
          "a bunch of parsley finely chopped"
          "2 tomatoes chopped"]]
    item "wheat"
    item "corn", [
      item "breads", [
        recipe "tortilla",
          "1 cup corn kernels"
          "place corn on couch"
          "put nice boots on"
          "grind the corn into the couch with heals of boots"
          "fry in a pan"]]]]

foods = 
  fruits: "fruits are delicious and should be eaten with wreckless abandon"
  vegetables: "you are going to be hard pressed to eat too many vegetables"
  grains: "seriously get with it. unprocessed grains are a great source of nutrition"
  soups: "Who doesn't like soup? Are you kidding me?"

myPots.on "selected", (el, item) ->
  document.getElementById("recipe").innerHTML = if item.recipe?.length
      "<h3>#{item.name}</h3><p>#{item.recipe.join "<br />"}</p>"
    else
      if item.children 
        "<h3>#{item.name ? "food!"}</h3><p>#{foods[item.name] ? "yum"}</p>"
      else
        "no recipe"

myPots.el.appendTo document.getElementById "MyFlowerPot"