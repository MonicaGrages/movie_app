class MovieSearch < ApplicationRecord
  include HTTParty
  base_uri "http://www.omdbapi.com/?apikey=36120b99&s="

  def self.search search_term
    response = get("#{search_term}")
  end

end
