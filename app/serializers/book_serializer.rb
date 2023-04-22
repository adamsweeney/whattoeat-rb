class BookSerializer
  include JSONAPI::Serializer

  attributes :title, :image, :pages, :author

end
