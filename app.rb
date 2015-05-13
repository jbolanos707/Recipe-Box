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
  id = params.fetch('id')
  @recipe = Recipe.find(id)
  erb(:recipe)
end
