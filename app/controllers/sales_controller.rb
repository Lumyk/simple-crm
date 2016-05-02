class SalesController < ApplicationController
  before_action :set_sale, only: [:destroy]
  before_action :get_data, only: [:new]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end


  # GET /sales/new
  def new
    @sale = Sale.new
  end


  # POST /sales
  # POST /sales.json
  def create
    sale_params_ = sale_params
    if sale_params[:type_of_sale].to_i == 1 # our
      sale_params_.delete(:store_id)
    else # store
      sale_params_.delete(:sate_type_id)
    end

    puts '___________________'
    puts sale_params_
    @sale = Sale.new(sale_params_)

    if @sale.type_of_sale == 1
      sklad = Sklad.find_by_prodact_id(@sale.prodact_id)
      if (sklad.count - @sale.count) >= 0
        if @sale.save
          sklad.count -= @sale.count
          if sklad.save
            redirect_to sales_path, notice: 'Sale was successfully created.'
          else
            @sale.destroy
            redirect_to sales_path, alert: 'Не удалось добавить продажу'
          end
        else
          render :new
        end
      else
        redirect_to sales_path, alert: 'Не достаточно товара на складе'
      end
    else
      atstore = AtStore.where(prodact_id:  @sale.prodact_id).where(store_id: @sale.store_id).first
      if atstore
        if (atstore.count - @sale.count) >= 0
          if @sale.save
            atstore.count -= @sale.count
            if atstore.save
              redirect_to sales_path, notice: 'Sale was successfully created.'
            else
              @sale.destroy
              redirect_to sales_path, alert: 'Не удалось добавить продажу'
            end
          else
            render :new
          end
        else
          redirect_to sales_path, alert: 'Не достаточно товара на складе'
        end
      else
        redirect_to sales_path, alert: 'Товара нет на складе'
      end
    end


  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    def sale_params
      params[:sale].permit(:prodact_id,:count,:type_of_sale,:store_id,:sate_type_id,:price)
    end

  def get_data
    @products = Prodact.all
    @stores = Store.all
    @sate_types = SateType.all
  end

end
