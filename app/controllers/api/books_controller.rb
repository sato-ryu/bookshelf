class Api::BooksController < ApplicationController
  before_action :load_genre

  rescue_from StandardError do |exception|
    render json: { status: :error, message: exception.message }, status: 500
  end

  def index
    render json: @genre.books
  end

  private
  def load_genre
    @genre = Genre.find(params[:genre_id])
  end
end
