class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :book

  has_one :recipe_detail

  has_many :recipe_tags
  has_many :tags, through: :recipe_tags

  scope :entrees, -> { 
    joins(:recipe_detail).
    where(recipe_details: { meal_type: "entree" }).
    where(recipe_details: { size: ["medium", "large", "xl"] }) 
  }

  scope :sides, -> {
    joins(:recipe_detail).
    where(recipe_details: { meal_type: ["side", "salad", "soup"]}).
    where(recipe_details: { size: "small" })
  }

  scope :desserts, -> { joins(:recipe_detail).where(recipe_details: { meal_type: "dessert" }) }

  def serialize
    {
      image: image,
      book: book,
      name: name,
      page: page,
      calories: recipe_detail.calories,
      prep_time: recipe_detail.prep_time,
      cook_time: recipe_detail.cook_time,
      meal_type: recipe_detail.meal_type,
      size: recipe_detail.size,
      tags: tags.map(&:name)
    }
  end
end
