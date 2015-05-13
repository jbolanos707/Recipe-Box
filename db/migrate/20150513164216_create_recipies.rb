class CreateRecipies < ActiveRecord::Migration
  def change
    create_table(:recipies) do |t|
      t.column(:name, :string)
      t.column(:rating, :integer)

      t.timestamps()
    end
  end
end
