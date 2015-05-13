require 'spec_helper'

describe(Recipe) do
  it('has many ingredients') do
    new_recipe = Recipe.create(name: 'meatloaf')
    ingredient1 = Ingredient.create(description: 'turkey', recipe_id: new_recipe.id)
    ingredient2 = Ingredient.create(description: 'ketchup', recipe_id: new_recipe.id)
    expect(new_recipe.ingredients()).to(eq([ingredient1, ingredient2]))
  end
end
