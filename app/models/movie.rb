class Movie < ApplicationRecord
  self.inheritance_column = :_type_disabled

  has_many :favorites
  has_many :users, through: :favorites

  validates :imdb_id, presence: true, uniqueness: true
  validates :title, presence: true
  validates :year, presence: true
end
