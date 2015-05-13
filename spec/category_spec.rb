require 'spec_helper'

describe(Category) do
  it('has many recipes') do
    new_category = Category.create(name: "Meat")
    recipe1 = Recipe.create(name: 'meatloaf')
    recipe2 = Recipe.create(name: 'brisket')
    new_category.update({:recipe_ids => [recipe1.id(), recipe2.id()]})
    expect(new_category.recipes).to(eq([recipe1, recipe2]))
  end
end
