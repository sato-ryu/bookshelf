class BooksController < ApplicationController
  before_action :load_genres
  before_action :load_genre, only: %i[search]
  before_action :load_book, only: %i[show]

  rescue_from StandardError do |exception|
    Rails.logger.error exception.message

    redirect_to books_path
  end

  def index
  end

  def show
  end

  def search
    @books = @genre.books
    @books = @books.where(title: params[:title]) if params[:title]
  end

  private
  def load_genres
    @genres = Genre.all
  end

  def load_genre
    @genre = Genre.find(params[:genre_id])
  end

  def load_book
    @book = Book.find(params[:id])
  end
end
