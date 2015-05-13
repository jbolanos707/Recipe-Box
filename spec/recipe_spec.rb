require 'spec_helper'

describe(Recipe) do
  it('has many ingredients') do
    new_recipe = Recipe.create(name: 'meatloaf')
    ingredient1 = Ingredient.create(description: 'turkey', recipe_id: new_recipe.id)
    ingredient2 = Ingredient.create(description: 'ketchup', recipe_id: new_recipe.id)
    expect(new_recipe.ingredients()).to(eq([ingredient1, ingredient2]))
  end

  it('rates a recipe') do
    test_recipe = Recipe.create(name: 'meatloaf', rating: 5)
    test_recipe2 = Recipe.create(name: 'grilled steak', rating: 4)
    test_recipe3 = Recipe.create(name: 'grilled steak', rating: 6)
    expect(Recipe.all()).to(eq([test_recipe3, test_recipe, test_recipe2]))
  end

end
