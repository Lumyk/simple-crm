class SellingsController < ApplicationController
  before_action :set_selling, only: [:show, :edit, :update, :destroy]
  before_action :get_data, only: [:new,:edit]
  # GET /sellings
  # GET /sellings.json
  def index
    @sellings = Selling.all
  end

  # GET /sellings/1
  # GET /sellings/1.json
  def show
  end

  # GET /sellings/new
  def new
    @selling = Selling.new
  end

  # GET /sellings/1/edit
  def edit
  end

  # POST /sellings
  # POST /sellings.json
  def create
    @selling = Selling.new(selling_params)

    sklad = Sklad.find_by_prodact_id(@selling.prodact_id)
    if @selling.prodact_id == nil || @selling.count == nil
      redirect_to new_selling_path, alert: 'Не удалось сохранить измениния'
    else
      if sklad != nil
        if (sklad.count - @selling.count) >= 0
          sklad.count -= @selling.count
          if sklad.save
            if @selling.save
              at_stores = AtStore.where(prodact_id: @selling.prodact_id).where(store_id: @selling.store_id)
              at_store_ = nil
              if at_stores.length > 0
                at_store_ = at_stores.first
                at_store_.count += @selling.count
              else
                at_store_ = AtStore.new(JSON.parse(@selling.to_json).slice("prodact_id","count","store_id"))
              end
              if at_store_.save
                redirect_to sellings_path, notice: 'Selling was successfully created.'
              else
                @selling.delete
                render :new
              end
            else
              render :new
            end
          else
            redirect_to sellings_path, alert: 'Не удалось сохранить измениния'
          end
        else
          redirect_to sellings_path, alert: 'На сладе не достаточное количество данного товара'
        end
      else
        redirect_to sellings_path, alert: 'На сладе нет данного товара'
      end
    end
  end

  # PATCH/PUT /sellings/1
  # PATCH/PUT /sellings/1.json
  def update
      if @selling.update(selling_params)
        redirect_to @selling, notice: 'Selling was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /sellings/1
  # DELETE /sellings/1.json
  def destroy
    if @selling.destroy
      redirect_to sellings_url, notice: 'Selling was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selling
      @selling = Selling.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selling_params
      params[:selling].permit(:prodact_id,:count,:store_id,:store_price,:my_money)
    end

    def get_data
      @products = Prodact.all
      @stores = Store.all
    end
end
