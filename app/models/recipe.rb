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

  def self.filter(params)
    recipes = self.all.joins(:recipe_detail)

    recipes = recipes.where("recipe_details.cook_time BETWEEN ? and ?", *params[:cook_time].split("-")) if params[:cook_time].present?
    recipes = recipes.where("recipe_details.prep_time BETWEEN ? and ?", *params[:prep_time].split("-")) if params[:prep_time].present?
    recipes = recipes.where("recipe_details.calories BETWEEN ? and ?", *params[:calories].split("-")) if params[:calories].present?
    recipes = recipes.where(book_id: params[:book]) if params[:book].present?
    recipes = recipes.where(recipe_details: { meal_type: params[:meal_type] }) if params[:meal_type].present?
    recipes
  end

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
