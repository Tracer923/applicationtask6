class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    @book_favorite = current_user.favorites.new(book_id: book.id)
    @book_favorite.save
    redirect_back(fallback_location:root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    @book_favorite = current_user.favorites.find_by(book_id: book.id)
    @book_favorite.destroy
    redirect_back(fallback_location:root_path)
  end
end
