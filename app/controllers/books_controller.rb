class BooksController < ApplicationController

  def create
    book = Book.create!(book_params)
    render json: book
  end

  def index
    render json: Book.all.order(:title)
  end

  def show
    book = Book.find_by(id: params[:id])
    return render json: { error: "Book doesn't exist."}, status: :unprocessable_entity if book.nil?
    render json: book.serialize
  end

  private

  def book_params
    params.permit(:title, :author, :pages, :image)
  end
end
