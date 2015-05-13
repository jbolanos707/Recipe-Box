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
