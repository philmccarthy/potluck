require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'
require './lib/potluck'

class PotluckTest < Minitest::Test
  def test_it_exists_and_has_attributes
    potluck = Potluck.new("7-13-18")
    assert_instance_of Potluck, potluck
    assert_equal "7-13-18", potluck.date
    assert_equal [], potluck.dishes
  end

  def test_potluck_can_add_dishes
  potluck = Potluck.new("7-13-18")
  couscous_salad = Dish.new("Couscous Salad", :appetizer)
  cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
  potluck.add_dish(couscous_salad)
  potluck.add_dish(cocktail_meatballs)
  assert_equal [couscous_salad, cocktail_meatballs], potluck.dishes
  assert_equal 2, potluck.dishes.length
  end

  def test_potluck_can_report_dishes_from_category
    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)
    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)
    assert_equal [couscous_salad, summer_pizza], potluck.get_all_from_category(:appetizer)
    assert_equal couscous_salad, potluck.get_all_from_category(:appetizer).first
    assert_equal "Couscous Salad", potluck.get_all_from_category(:appetizer).first.name
  end

  def test_potluck_can_produce_menu_hash
    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)
    bean_dip = Dish.new("Bean Dip", :appetizer)
    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)
    potluck.add_dish(bean_dip)
    expected = {
      :appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"],
      :entres=>["Cocktail Meatballs", "Roast Pork"],
      :desserts=>["Candy Salad"]
    }
    assert_equal expected, potluck.menu
  end

  def test_potluck_can_report_ratio_of_dishes_in_category
    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)
    bean_dip = Dish.new("Bean Dip", :appetizer)
    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)
    potluck.add_dish(bean_dip)
    assert_equal 50.0, potluck.ratio(:appetizer)
  end


end
