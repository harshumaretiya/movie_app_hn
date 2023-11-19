class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :rated
      t.string :released
      t.string :runtime
      t.string :genre
      t.string :director
      t.text :writer
      t.string :actors
      t.text :plot
      t.string :language
      t.string :country
      t.string :awards
      t.string :poster
      t.text :ratings
      t.string :metascore
      t.string :imdb_rating
      t.string :imdb_votes
      t.string :imdb_id
      t.string :type
      t.string :dvd
      t.string :box_office
      t.string :production
      t.string :website
      t.boolean :response

      t.timestamps
    end
  end
end
