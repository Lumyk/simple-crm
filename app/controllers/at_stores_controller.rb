class AtStoresController < ApplicationController
  before_action :set_at_store, only: [:show, :edit, :update, :destroy]
  before_action :get_data, only: [:new,:edit]

  # GET /at_stores
  # GET /at_stores.json
  def index
    @stores = Store.all
  end

  # GET /at_stores/1
  # GET /at_stores/1.json
  def show
  end

  # GET /at_stores/new
  def new
    @at_store = AtStore.new
  end

  # GET /at_stores/1/edit
  def edit
  end

  # POST /at_stores
  # POST /at_stores.json
  def create

    at_store_ = AtStore.where(prodact_id: at_store_params[:prodact_id]).where(store_id: at_store_params[:store_id])
    puts('____________________________________')
    puts(at_store_)
    puts('1231232213123123123123213213')
    if at_store_.length <= 0
      @at_store = AtStore.new(at_store_params)
      if @at_store.save
        redirect_to at_stores_path, notice: 'At store was successfully created.'
      else
        render :new
      end
    else
      @at_store = at_store_.last
      at_store_params_ = at_store_params
      at_store_params_[:count] = (at_store_params[:count].to_i + @at_store.count).to_s

      if @at_store.update(at_store_params_)
        redirect_to at_stores_path, notice: 'At store was successfully created.'
      else
        render :new
      end
    end
  end

  # PATCH/PUT /at_stores/1
  # PATCH/PUT /at_stores/1.json
  def update
    respond_to do |format|
      if @at_store.update(at_store_params)
        format.html { redirect_to @at_store, notice: 'At store was successfully updated.' }
        format.json { render :show, status: :ok, location: @at_store }
      else
        format.html { render :edit }
        format.json { render json: @at_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /at_stores/1
  # DELETE /at_stores/1.json
  def destroy
    @at_store.destroy
    respond_to do |format|
      format.html { redirect_to at_stores_url, notice: 'At store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_at_store
      @at_store = AtStore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def at_store_params
      params[:at_store].permit(:prodact_id,:store_id,:count,:selling_count)
    end

    def get_data
      @products = Prodact.all
      @stores = Store.all
    end
end
