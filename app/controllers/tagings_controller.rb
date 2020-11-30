class TagingsController < ApplicationController
  before_action :set_taging, only: [:show, :edit, :update, :destroy]

  # GET /tagings
  # GET /tagings.json
  def index
    @tagings = Taging.all
  end

  # GET /tagings/1
  # GET /tagings/1.json
  def show
  end

  # GET /tagings/new
  def new
    @taging = Taging.new
  end

  # GET /tagings/1/edit
  def edit
  end

  # POST /tagings
  # POST /tagings.json
  def create
    @taging = Taging.new(taging_params)

    respond_to do |format|
      if @taging.save
        format.html { redirect_to @taging, notice: 'Taging was successfully created.' }
        format.json { render :show, status: :created, location: @taging }
      else
        format.html { render :new }
        format.json { render json: @taging.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tagings/1
  # PATCH/PUT /tagings/1.json
  def update
    respond_to do |format|
      if @taging.update(taging_params)
        format.html { redirect_to @taging, notice: 'Taging was successfully updated.' }
        format.json { render :show, status: :ok, location: @taging }
      else
        format.html { render :edit }
        format.json { render json: @taging.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tagings/1
  # DELETE /tagings/1.json
  def destroy
    @taging.destroy
    respond_to do |format|
      format.html { redirect_to tagings_url, notice: 'Taging was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taging
      @taging = Taging.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def taging_params
      params.require(:taging).permit(:tag_id, :tagable_id, :tagable_type)
    end
end
