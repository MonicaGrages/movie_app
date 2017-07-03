class MovieSearchesController < ApplicationController

  def index
    if params["/movie_search"]
      puts "search_params is: "
      puts search_params.to_h
      search_term = search_params.to_h[:search_term]
      puts search_term
      @movies = MovieSearch.search(search_term)
      puts @movies
      @movies_array = @movies["Search"]
      puts @movies_array.length
      @movie_results = @movies_array.paginate(page: params[:page], per_page: 5)
      puts @movie_results.class
      puts @movie_results
    end
  end

  private
  def search_params
    params.require("/movie_search")
      .permit(:search_term)
  end

end
