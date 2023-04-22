class RecipeSerializer
  include JSONAPI::Serializer

  attributes :name, :page, :image, :book
  has_many :tags

  attribute :calories do |object|
    object.recipe_detail.calories
  end
  attribute :prep_time do |object| 
    object.recipe_detail.prep_time
  end
  attribute :cook_time do |object|
    object.recipe_detail.cook_time
  end
  attribute :size do |object| 
    object.recipe_detail.size
  end
  attribute :meal_type do |object|
    object.recipe_detail.meal_type
  end
end
