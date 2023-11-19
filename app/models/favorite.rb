# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :integer
#  user_id    :integer
#
class Favorite < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :movie_id, presence: true, uniqueness: { scope: :user_id, message: "has already been added to favorites" }
end
