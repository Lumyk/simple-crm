class ProdactsController < ApplicationController
  before_action :set_prodact, only: [:edit, :update, :destroy]

  # GET /prodacts
  # GET /prodacts.json
  def index
    @prodacts = Prodact.all
  end

  # GET /prodacts/1
  # GET /prodacts/1.json

  # GET /prodacts/new
  def new
    @prodact = Prodact.new
    @colors = Color.all
    @models = Model.all
  end

  # GET /prodacts/1/edit
  def edit
  end

  # POST /prodacts
  # POST /prodacts.json
  def create
    @prodact = Prodact.new(prodact_params)

    respond_to do |format|
      if @prodact.save
        format.html { redirect_to prodacts_path, notice: 'Prodact was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /prodacts/1
  # PATCH/PUT /prodacts/1.json
  def update
    respond_to do |format|
      if @prodact.update(prodact_params)
        format.html { redirect_to prodacts_path, notice: 'Prodact was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /prodacts/1
  # DELETE /prodacts/1.json
  def destroy
    @prodact.destroy
    respond_to do |format|
      format.html { redirect_to prodacts_path, notice: 'Prodact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prodact
      @prodact = Prodact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prodact_params
      params[:prodact].permit(:name,:color_id,:model_id)
    end
end
