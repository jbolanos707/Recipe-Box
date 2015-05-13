class Recipe < ActiveRecord::Base
  has_many :ingredients
  has_and_belongs_to_many :categories
  validates(:name, :presence => true)

  default_scope { order('rating DESC') } #default_scope changes the order of the .all methods
end
