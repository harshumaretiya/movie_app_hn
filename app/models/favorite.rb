class Favorite < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :movie_id, presence: true, uniqueness: { scope: :user_id, message: "has already been added to favorites" }
end
