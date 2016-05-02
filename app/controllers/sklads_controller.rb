class SkladsController < ApplicationController
  before_action :set_sklad, only: [:edit, :update, :destroy]
  before_action :get_products, only: [:new,:edit]
  # GET /sklads
  # GET /sklads.json
  def index
    @sklads = Sklad.all
  end

  # GET /sklads/new
  def new
    @sklad = Sklad.new
  end

  # GET /sklads/1/edit
  def edit
  end

  # POST /sklads
  def create
    sklad_ = Sklad.find_by_prodact_id(sklad_params[:prodact_id])
    if !sklad_
      @sklad = Sklad.new(sklad_params)
      if @sklad.save
        redirect_to sklads_path, notice: 'Sklad was successfully created.'
      else
        render :new
      end
    else
      @sklad = sklad_
      sklad_params_ = sklad_params
      sklad_params_[:count] = (sklad_params[:count].to_i + @sklad.count).to_s
      if @sklad.update(sklad_params_)
        redirect_to sklads_path, notice: 'Sklad was successfully created.'
      else
        render :new
      end
    end


  end

  # PATCH/PUT /sklads/1
  # PATCH/PUT /sklads/1.json
  def update
    if @sklad.update(sklad_params)
      redirect_to sklads_path, notice: 'Sklad was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sklads/1
  # DELETE /sklads/1.json
  def destroy
    if @sklad.destroy
      redirect_to sklads_url, notice: 'Sklad was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sklad
      @sklad = Sklad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sklad_params
      params[:sklad].permit(:prodact_id,:count)
    end

    def get_products
      @products = Prodact.all
    end

end
