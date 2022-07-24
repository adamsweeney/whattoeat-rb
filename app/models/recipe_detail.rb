class RecipeDetail < ApplicationRecord
  enum meal_type: %i[appetizer entree salad side soup dessert drink]
  enum size: %i[small medium large xl]
  belongs_to :recipe
end
