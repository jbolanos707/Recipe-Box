class RenameRecipeTable < ActiveRecord::Migration
  def change
    drop_table(:recipies)

    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:rating, :integer)

      t.timestamps
    end
  end
end
