class BooksController < ApplicationController
  def index
    @books = Book.all

    render json: { data: @books }
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: { data: @book }
    else
      render json: {
        data: @book.errors
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    render json: {
      data: @book.id
    }, status: :ok
  end

  private

  def book_params
    params.require(:book).permit(:title, :category)
  end
end
