class TagsController < ApplicationController

  def index
    render json: Tag.all.order(:name)
  end
end
