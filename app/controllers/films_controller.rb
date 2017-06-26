class FilmsController < ApplicationController

  def index
    @films = Film.all
  end

  def show
    @film = Film.find(params[:id])
  end

  def new
  end

  def edit
    @film = Film.find(params[:id])
  end

  def create
    @film = Film.create
  end

  def update
    @film = Film.find(params[:id])
    @film.update(title: params["film"]["title"], year: params["film"]["year"], genre: params["film"]["genre"], synopsis: params["film"]["synopsis"], picture: params["film"]["picture"])
    redirect_to film_path(@film)
  end

  def delete
    @film = Find.find(params[:id])
  end

end
