require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/recipes') do
  @recipes = Recipe.all
  erb(:recipes)
end

post('/recipes') do
  name = params.fetch("name")
  new_recipe = Recipe.new(name: name)
  if new_recipe.save()
    redirect('/recipes')
  else
    erb(:error)
  end
end

get('/recipes/:id') do
  id = params.fetch('id').to_i # id is being fetched from :id (see get line) that results in the url
  @recipe = Recipe.find(id) # @recipe is being called because it is an instance of Recipe that will be used specifically in the recipe.erb
  @ingredients = @recipe.ingredients()
  @categories = Category.all()
  erb(:recipe)
end

post('/recipes/:id') do
  recipe_id = params.fetch("id").to_i
  description = params.fetch("description")
  new_ingredient = Ingredient.create(description: description)
  recipe = Recipe.find(recipe_id)
  recipe.ingredients().push(new_ingredient)

  redirect('/recipes/'.concat(recipe_id.to_s)) #must be converted to string because "id".to_i was called and concat can't be called on an integer.
end

patch('/recipes/:id') do
  recipe_id = params.fetch('id').to_i
  recipe_rate = params.fetch("rate")
  recipe = Recipe.find(recipe_id)
  recipe.update(rating: recipe_rate)

  redirect('/recipes/'.concat(recipe_id.to_s))
end

delete('/recipes/:id/ingredients') do
  recipe_id = params.fetch("id").to_i
  ingredient_ids = params.fetch("ingredient_ids")
  recipe = Recipe.find(recipe_id)
  ingredient_ids.each() do |id|
    id = id.to_i
    ingredient = Ingredient.find(id)
    recipe.ingredients.destroy(ingredient)
  end

  redirect('/recipes/'.concat(recipe_id.to_s))
end

delete('/recipes/:id') do
  recipe_id = params.fetch('id').to_i
  recipe = Recipe.find(recipe_id)
  recipe.destroy

  redirect('/recipes')
end

get('/categories') do
  @categories = Category.all()
  erb(:categories)
end

post('/categories') do
  name = params.fetch("name")
  new_category = Category.new(name: name)
  if new_category.save()
    redirect('/categories')
  else
    erb(:error)
  end
end

get('/categories/:id') do
  category_id = params.fetch("id").to_i
  @category = Category.find(category_id)
  erb(:category)
end

post('/recipes/:id/categories') do
  recipe_id = params.fetch('id').to_i
  category_ids = params.fetch('category_ids')
  recipe = Recipe.find(recipe_id)
  category_ids.each do |category_id|
    recipe.update({:category_ids => [category_id]}) # :category_ids is referencing the joined table categories_recipes, column category_id. It needs to made plural (category_ids) in order for it to work.
  end                                               # [category_id] is being taken from the params in recipe.erb. It will loop through all the category_ids in the array.
  redirect('/recipes/'.concat(recipe_id.to_s))
end

delete('/categories/:id') do
  category_id = params.fetch('id').to_i
  category = Category.find(category_id)
  category.destroy

  redirect('/categories')
end

get('/ingredients') do
  
end
