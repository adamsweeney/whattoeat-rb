class Book < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :recipes

  def serialize
    {
      image: image,
      title: title,
      pages: pages,
      author: author,
      recipes: recipes.count
    }
  end
end
