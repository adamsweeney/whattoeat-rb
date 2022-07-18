class Tag < ApplicationRecord
  has_many :recipes, through: :recipe_tags
end
