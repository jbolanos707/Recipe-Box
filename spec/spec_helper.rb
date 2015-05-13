ENV['RACK_ENV'] = 'test'
require("bundler/setup")
Bundler.require(:default, :test)
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.after(:each) do
    Ingredient.all().each() do |ingredient|
      ingredient.destroy()
    end
    Recipe.all().each() do |recipe|
      recipe.destroy()
    end
  end
end
