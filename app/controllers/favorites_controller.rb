class FavoritesController < ApplicationController
  def index
    favorites_ids = current_user.favorites.pluck(:movie_id) # Assuming you have a model named Favorite for storing favorite movies
    if favorites_ids.present?
      @favorites = Movie.where(id: favorites_ids)
    else
      redirect_to movies_path, alert: 'Favorite not found.'
    end
  end

  def remove_from_favorites
    favorite = current_user.favorites.find_by(movie_id: params[:id])

    if favorite.nil?
      redirect_to favorites_path, alert: 'Favorite not found.'
    elsif favorite.user != current_user
      redirect_to favorites_path, alert: 'You do not have permission to remove this favorite.'
    else
      favorite.destroy
      redirect_to favorites_path, notice: 'Favorite removed successfully.'
    end
  end

end
