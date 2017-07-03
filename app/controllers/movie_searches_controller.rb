class MovieSearchesController < ApplicationController

  def index
    if params["/movie_search"]
      search_term = search_params.to_h[:search_term]
      @movies = MovieSearch.search(search_term)
      puts @movies
      if @movies[:Response]
        @movies_array = @movies["Search"]
        @movie_results = @movies_array.paginate(page: params[:page], per_page: 5)
      else
        @no_results_message = "Your search yielded no results"
      end
    end
  end

  private
  def search_params
    params.require("/movie_search")
      .permit(:search_term)
  end

end
