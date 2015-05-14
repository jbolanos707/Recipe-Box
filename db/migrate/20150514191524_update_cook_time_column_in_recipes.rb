class UpdateCookTimeColumnInRecipes < ActiveRecord::Migration
  def change
    remove_column (:recipes, :cook_time, :integer)
    add_column(:recipes, :cook_time, :string)
  end
end
