class StrategicSortingsController < ApplicationController
  before_action :set_strategic_sorting, only: [:show, :edit, :update, :destroy]

  # GET /strategic_sortings
  # GET /strategic_sortings.json
  def index
    @strategic_sortings = StrategicSorting.all
  end

  # GET /strategic_sortings/1
  # GET /strategic_sortings/1.json
  def show
  end

  # GET /strategic_sortings/new
  def new
    @strategic_sorting = StrategicSorting.new
  end

  # GET /strategic_sortings/1/edit
  def edit
  end

  # POST /strategic_sortings
  # POST /strategic_sortings.json
  def create
    @strategic_sorting = StrategicSorting.new(strategic_sorting_params)

    respond_to do |format|
      if @strategic_sorting.save
        format.html { redirect_to @strategic_sorting, notice: 'Strategic sorting was successfully created.' }
        format.json { render :show, status: :created, location: @strategic_sorting }
      else
        format.html { render :new }
        format.json { render json: @strategic_sorting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /strategic_sortings/1
  # PATCH/PUT /strategic_sortings/1.json
  def update
    respond_to do |format|
      if @strategic_sorting.update(strategic_sorting_params)
        format.html { redirect_to @strategic_sorting, notice: 'Strategic sorting was successfully updated.' }
        format.json { render :show, status: :ok, location: @strategic_sorting }
      else
        format.html { render :edit }
        format.json { render json: @strategic_sorting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strategic_sortings/1
  # DELETE /strategic_sortings/1.json
  def destroy
    @strategic_sorting.destroy
    respond_to do |format|
      format.html { redirect_to strategic_sortings_url, notice: 'Strategic sorting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strategic_sorting
      @strategic_sorting = StrategicSorting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def strategic_sorting_params
      params.fetch(:strategic_sorting, {})
    end
end
