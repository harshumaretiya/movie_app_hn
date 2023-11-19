class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:add_to_favorites]

  def index
    @movies = Movie.all # Fetch all movies from your database
  end

  def show
    imdb_id = params[:id]
    @movie = MovieService.fetch_movie_details_by_imdb_id(imdb_id)

    if @movie.nil?
      redirect_to movies_path, alert: 'Movie not found.'
    end
  end

  def search
    @query = params[:query]
    @year = params[:year]
    @plot = params[:plot]
    @type = params[:type]

    @movies = MovieService.search_movies_by_title(@query, @year, @plot, @type)
    @movies_array = [@movies]

    if @movies.present? && @movies['Response'] == 'True'
      # Movies were found, you can proceed to display them
    else
      redirect_to movies_path, alert: "Movie Not found"
    end
  end

  def add_to_favorites
    imdb_id = params[:id]
    @movie = MovieService.fetch_movie_details_by_imdb_id(imdb_id)

    if @movie.nil?
      redirect_to movies_path, alert: 'Movie not found.'
    else
      @movie_imdb_id = Movie.find_by(imdb_id: @movie["imdbID"])

      if @movie_imdb_id.present?
        @favorite = Favorite.new(user: current_user, movie_id: @movie_imdb_id.id)
      else
        movie_model_hash = transform_to_movie_hash(@movie)

        movie = Movie.create!(movie_model_hash)
        @favorite = Favorite.new(user: current_user, movie_id: movie.id)
      end

      if @favorite.save
        redirect_to movies_path, notice: 'Movie added to favorites successfully.'
      else
        redirect_to movies_path, alert: 'Failed to add the movie to favorites.'
      end
    end
  end

  def transform_to_movie_hash(original_hash)
    movie_hash = {}
    movie_hash["title"] = original_hash["Title"]
    movie_hash["year"] = original_hash["Year"]
    movie_hash["rated"] = original_hash["Rated"]
    movie_hash["released"] = original_hash["Released"]
    movie_hash["runtime"] = original_hash["Runtime"]
    movie_hash["genre"] = original_hash["Genre"]
    movie_hash["director"] = original_hash["Director"]
    movie_hash["writer"] = original_hash["Writer"]
    movie_hash["actors"] = original_hash["Actors"]
    movie_hash["plot"] = original_hash["Plot"]
    movie_hash["language"] = original_hash["Language"]
    movie_hash["country"] = original_hash["Country"]
    movie_hash["awards"] = original_hash["Awards"]
    movie_hash["poster"] = original_hash["Poster"]
    movie_hash["ratings"] = original_hash["Ratings"].to_json
    movie_hash["metascore"] = original_hash["Metascore"]
    movie_hash["imdb_rating"] = original_hash["imdbRating"]
    movie_hash["imdb_votes"] = original_hash["imdbVotes"]
    movie_hash["imdb_id"] = original_hash["imdbID"]
    movie_hash["type"] = original_hash["Type"]
    movie_hash["dvd"] = original_hash["DVD"]
    movie_hash["box_office"] = original_hash["BoxOffice"]
    movie_hash["production"] = original_hash["Production"]
    movie_hash["website"] = original_hash["Website"]
    movie_hash["response"] = original_hash["Response"]
  
    return movie_hash
  end
end
