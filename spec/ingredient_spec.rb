require 'spec_helper'

describe(Ingredient) do
  it("has one recipie") do
    new_recipe = Recipe.create(name: 'meatloaf')
    new_ingredient = Ingredient.create(description: 'turkey')
    new_recipe.ingredients.push(new_ingredient)
    expect(new_ingredient.recipe_id).to(eq(new_recipe.id))
  end
end
