class BooksController < ApplicationController

  def create
    book = Book.create!(book_params)
    render json: book
  end

  def index
    render json: Book.all
  end

  private

  def book_params
    params.permit(:title, :author, :pages, :image)
  end
end
