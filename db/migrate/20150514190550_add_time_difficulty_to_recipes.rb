class AddTimeDifficultyToRecipes < ActiveRecord::Migration
  def change
    add_column(:recipes, :cook_time, :integer)
    add_column(:recipes, :difficulty, :string)
  end
end
