class MinisController < ApplicationController
  before_action :set_mini, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:create, :edit, :update, :destroy]

  def index
    @minis = Mini.all
  end

  def show
    @mini_film = Film.find_by(imdb_id: @mini.imdb_id)
  end

  def new
    @mini = Mini.new
  end

  def edit
  end

  def create
    @mini = current_user.minis.build(mini_params)

    respond_to do |format|
      if @mini.save
        Film.find_or_create_from_imdb_party(@mini)
        format.html { redirect_to @mini, notice: 'Mini was successfully created.' }
        format.json { render :show, status: :created, location: @mini }
      else
        format.html { render :new }
        format.json { render json: @mini.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mini.update(mini_params)
        format.html { redirect_to @mini, notice: 'Mini was successfully updated.' }
        format.json { render :show, status: :ok, location: @mini }
      else
        format.html { render :edit }
        format.json { render json: @mini.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mini.destroy
    respond_to do |format|
      format.html { redirect_to minis_url, notice: 'Mini was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_mini
      @mini = Mini.find(params[:id])
    end

    def mini_params
      params.require(:mini).permit(:film_title, :imdb_id, :rating, :date_viewed, :user_id)
    end

end
