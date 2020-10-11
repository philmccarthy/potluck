class Potluck
  attr_reader :date, :dishes
  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.select do |dish|
      dish.category == category
    end
  end

  def menu
    menu_by_category = Hash.new {|hash, key| hash[key] = []}
    @dishes.each do |dish|
      menu_by_category[(dish.category.to_s + "s").to_sym] << dish.name
    end
    menu = {}
    menu_by_category.each do |category, dish_name|
      menu[category] = dish_name.sort
    end
    menu
  end

  def ratio(category)
    (menu[(category.to_s + "s").to_sym].size.to_f) / (@dishes.size) * 100
  end
end
