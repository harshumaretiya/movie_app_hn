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
require "test_helper"

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
