class RecipesController < ApplicationController

  def create
    book = Book.find_by(id: params[:book])
    recipe = Recipe.create!(recipe_params.merge!(book: book))
    recipe.create_recipe_detail!(recipe_detail_params)
    if params[:tags].present?
      tags = Tag.where(id: JSON.parse(params[:tags])) 
      recipe.tags << tags
    end
    render json: recipe
  end

  def random
    entree = Recipe.entrees.sample
    side = Recipe.sides.sample if entree.recipe_detail.size.eql?("medium")
    dessert = Recipe.desserts.sample
    meals = { 
      entree: entree&.serialize,
      dessert: dessert&.serialize,
      side: side&.serialize
    }
    render json: meals
  end

  private

  def recipe_params
    params.permit(:page, :name, :image)
  end

  def recipe_detail_params
    params.permit(:meal_type, :prep_time, :cook_time, :calories, :size)
  end
end
