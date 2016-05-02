class SateTypesController < ApplicationController
  before_action :set_sate_type, only: [:show, :edit, :update, :destroy]

  # GET /sate_types
  # GET /sate_types.json
  def index
    @sate_types = SateType.all
  end

  # GET /sate_types/1
  # GET /sate_types/1.json
  def show
  end

  # GET /sate_types/new
  def new
    @sate_type = SateType.new
  end

  # GET /sate_types/1/edit
  def edit
  end

  # POST /sate_types
  # POST /sate_types.json
  def create
    @sate_type = SateType.new(sate_type_params)

    if @sate_type.save
      redirect_to sate_types_path, notice: 'Sate type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sate_types/1
  # PATCH/PUT /sate_types/1.json
  def update
    if @sate_type.update(sate_type_params)
      redirect_to sate_types_path, notice: 'Sate type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sate_types/1
  # DELETE /sate_types/1.json
  def destroy
    if @sate_type.destroy
      redirect_to sate_types_url, notice: 'Sate type was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sate_type
      @sate_type = SateType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sate_type_params
      params[:sate_type].permit(:name)
    end
end
