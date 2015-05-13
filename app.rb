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
  if Recipe.create(name: name)
    redirect('/recipes')
  else 
    erb(:error)
  end
end
