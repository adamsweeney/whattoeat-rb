class Recipe < ApplicationRecord
  belongs_to :book

  has_one :recipe_detail

  has_many :tags, through: :recipe_tags
end
