// Generated by CoffeeScript 1.6.1
(function() {
  var FlowerPots, foods, item, myPots, recipe,
    __slice = [].slice;

  FlowerPots = require("flowerpots");

  myPots = new FlowerPots;

  item = function(name, children) {
    return {
      name: name,
      children: children
    };
  };

  recipe = function() {
    var name, recipe;
    name = arguments[0], recipe = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
    return {
      name: name,
      recipe: recipe
    };
  };

  myPots.setData([item("fruits", [item("berries", [item("raspberry"), item("blackberry"), item("boisenberry", [recipe("amazing pie", "mix all ingredients together"), recipe("incredible jam")])]), item("stone fruit", [item("peach"), item("apricot"), item("plum")])]), item("vegetables", [item("zucchini", [item("soups", [item("vegetable stew"), item("zucchini broth")]), item("breads", [recipe("zucchini bread", "mix zucchini into a bread recipe..."), recipe("banana bread", "make bread with bananas!"), recipe("breakfast muffin", "1 cup zucchini", "1/2 cup apple sauce", "mix together... bake")]), item("snacks")]), item("carrot"), item("bok choy")]), item("grains", [item("quinoa", [item("salads", [recipe("Tabouleh", "1 1/2 cup uncooked red quinoa", "1 cucumber chopped", "1 red onion chopped", "green onions", "2 teaspoons lemon juice", "1 tsp salt (add to taste)", "a bunch of parsley finely chopped", "2 tomatoes chopped")])]), item("wheat"), item("corn", [item("breads", [recipe("tortilla", "1 cup corn kernels", "place corn on couch", "put nice boots on", "grind the corn into the couch with heals of boots", "fry in a pan")])])])]);

  foods = {
    fruits: "fruits are delicious and should be eaten with wreckless abandon",
    vegetables: "you are going to be hard pressed to eat too many vegetables",
    grains: "seriously get with it. unprocessed grains are a great source of nutrition",
    soups: "Who doesn't like soup? Are you kidding me?"
  };

  myPots.on("selected", function(el, item) {
    var _ref, _ref1, _ref2;
    return document.getElementById("recipe").innerHTML = ((_ref = item.recipe) != null ? _ref.length : void 0) ? "<h3>" + item.name + "</h3><p>" + (item.recipe.join("<br />")) + "</p>" : item.children ? "<h3>" + ((_ref1 = item.name) != null ? _ref1 : "food!") + "</h3><p>" + ((_ref2 = foods[item.name]) != null ? _ref2 : "yum") + "</p>" : "no recipe";
  });

  myPots.el.appendTo(document.getElementById("MyFlowerPot"));

}).call(this);
