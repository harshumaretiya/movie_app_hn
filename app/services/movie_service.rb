# app/services/movie_service.rb
class MovieService
  BASE_URL = 'https://www.omdbapi.com'

  def self.search_movies_by_title(title, type, year, plot, format: 'json')
    query_params = {
      t: title,
      type: type,
      y: year,
      plot: plot,
      r: format,
      v: '1',
      apikey: 'f72a5dcb'
    }

    response = HTTParty.get(BASE_URL, query: query_params)

    if response.success?
      JSON.parse(response.body)
    else
      nil
    end
  end

  def self.fetch_movie_details_by_imdb_id(imdb_id, format: 'json')
    query_params = {
      i: imdb_id,
      r: format,
      v: '1',
      apikey: 'f72a5dcb'
    }

    response = HTTParty.get(BASE_URL, query: query_params)

    if response.success?
      JSON.parse(response.body)
    else
      nil
    end
  end
end
