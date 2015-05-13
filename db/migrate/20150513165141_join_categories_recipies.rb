class JoinCategoriesRecipies < ActiveRecord::Migration
  def change
    create_table(:categories_recipies, id: false) do |t|
      t.belongs_to(:category, index: true)
      t.belongs_to(:recipe, index: true)
    end
  end
end
