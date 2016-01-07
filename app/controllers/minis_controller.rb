class MinisController < ApplicationController
  before_action :set_mini, only: [:show, :edit, :update, :destroy]

  # GET /minis
  # GET /minis.json
  def index
    @minis = Mini.all
  end

  # GET /minis/1
  # GET /minis/1.json
  def show
  end

  # GET /minis/new
  def new
    @mini = Mini.new
  end

  # GET /minis/1/edit
  def edit
  end

  # POST /minis
  # POST /minis.json
  def create
    # require pry; binding.pry
    @mini = Mini.new(mini_params)

    respond_to do |format|
      if @mini.save
        format.html { redirect_to @mini, notice: 'Mini was successfully created.' }
        format.json { render :show, status: :created, location: @mini }
      else
        format.html { render :new }
        format.json { render json: @mini.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minis/1
  # PATCH/PUT /minis/1.json
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

  # DELETE /minis/1
  # DELETE /minis/1.json
  def destroy
    @mini.destroy
    respond_to do |format|
      format.html { redirect_to minis_url, notice: 'Mini was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mini
      @mini = Mini.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mini_params
      params.require(:mini).permit(:film_title, :imdb_id, :rating, :date_viewed)
    end
end
