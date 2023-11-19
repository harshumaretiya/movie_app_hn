# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  actors      :string
#  awards      :string
#  box_office  :string
#  country     :string
#  director    :string
#  dvd         :string
#  genre       :string
#  imdb_rating :string
#  imdb_votes  :string
#  language    :string
#  metascore   :string
#  plot        :text
#  poster      :string
#  production  :string
#  rated       :string
#  ratings     :text
#  released    :string
#  response    :boolean
#  runtime     :string
#  title       :string
#  type        :string
#  website     :string
#  writer      :text
#  year        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  imdb_id     :string
#
class Movie < ApplicationRecord
  self.inheritance_column = :_type_disabled

  has_many :favorites
  has_many :users, through: :favorites

  validates :imdb_id, presence: true, uniqueness: true
  validates :title, presence: true
  validates :year, presence: true
end
