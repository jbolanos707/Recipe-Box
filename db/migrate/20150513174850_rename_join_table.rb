class RenameJoinTable < ActiveRecord::Migration
  def change
    drop_table(:categories_recipies)
    
    create_table(:categories_recipes, id: false) do |t|
      t.belongs_to(:category, index: true)
      t.belongs_to(:recipe, index: true)
    end
  end
end
