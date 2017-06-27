class MovieSearchesController < ApplicationController

  def index
    if params["/movie_search"]
      @search_term = params["/movie_search"]["search_term"]
      puts @search_term
      @movies = MovieSearch.search(@search_term)["Search"]
    end
  end

end
