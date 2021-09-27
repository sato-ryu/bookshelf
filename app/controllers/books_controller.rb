class BooksController < ApplicationController
  before_action :load_genres

  def index
  end

  def show
  end

  private
  def load_genres
    @genres = Genre.all
  end
end
