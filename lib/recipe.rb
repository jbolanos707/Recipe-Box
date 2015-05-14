class Recipe < ActiveRecord::Base
  has_many :ingredients
  has_and_belongs_to_many :categories
  validates(:name, presence: true)
  default_scope { order('rating DESC') } #default_scope changes the order of the .all methods
  define_method(:initialize) do

  end
  define_method(:count_calories) do
    all_ingredients = self.ingredients
    total_calories = 0
    all_ingredients.each() do |ingredient|
      ingredient.calories == nil ? calories = 0 : calories = ingredient.calories
      total_calories = calories + total_calories
    end
    total_calories
  end
end
