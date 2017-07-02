class FilmsController < ApplicationController
before_action :authenticate_user!
load_and_authorize_resource  only: [:edit, :update, :destroy, :read]

  def index
    @user = current_user
    @films = @user.films
  end

  def show
    @user = current_user
    @film = @user.films.find(params[:id])
  end

  def new
    @film = Film.new
  end

  def edit
    @film = Film.find(params[:id])
  end

  def create
    puts "create a favorite film here"
    @user = current_user
    @film = @user.films.create(user_id: @user.id, title: params["film"]["title"], year: params["film"]["year"], genre: params["film"]["genre"], synopsis: params["film"]["synopsis"], picture: params["film"]["picture"])

    respond_to do |format|
      if @film.save
        format.html { redirect_to film_path(@film), notice: 'Film was successfully created.' }
        format.json { render :show, status: :created, location: @film }
      else
        format.html { render :new }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = current_user
    @film = @user.films.find(params[:id])
    @film.update(title: params["film"]["title"], year: params["film"]["year"], genre: params["film"]["genre"], synopsis: params["film"]["synopsis"], picture: params["film"]["picture"])
    redirect_to film_path(@film)
  end

  def delete
    @film = Film.find(params[:id])
    @film.delete
    redirect_to films_path
  end

end
