class Book < ApplicationRecord
  mount_uploader :image, BookImageUploader
  has_many :recipes
end
