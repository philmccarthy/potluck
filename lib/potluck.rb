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

  def group_by_category
    @dishes.group_by do |dish|
      ((dish.category.to_s) + 's').to_sym
    end
  end

def menu
  menu_hash = group_by_category
  menu_hash.each_value do |dishes|
    dishes.map! do |dish|
      dish.name
    end.sort!
  end
end


  def ratio(category)
    sorted_menu = menu
    (get_all_from_category(category).size.to_f / @dishes.size) * 100
  end
end
