class ProductionsController < ApplicationController
  before_action :set_production, only: [:show, :edit, :update, :destroy]
  before_action :get_products, only: [:new,:edit]

  # GET /productions
  # GET /productions.json
  def index
    @productions = Production.all
  end

  # GET /productions/1
  # GET /productions/1.json
  def show
  end

  # GET /productions/new
  def new
    @production = Production.new
  end

  # GET /productions/1/edit
  def edit
    if @production.status == 3
      redirect_to productions_path
    end
  end

  # POST /productions
  # POST /productions.json
  def create
    @production = Production.new(production_params)
      if @production.save
        redirect_to productions_path, notice: 'Товар успешно создан'
      else
        render :new
      end
  end

  # PATCH/PUT /productions/1
  # PATCH/PUT /productions/1.json
  def update
    if @production.update(production_params)
      if @production.status == 3
        sklad = Sklad.find_by_prodact_id(@production.prodact_id)
        if sklad
          sklad.count = sklad.count + @production.count
          if sklad.save
            redirect_to productions_path, notice: 'Статус товара успешно изменен, и товар добавлен в склад'
          end
        else
          sklad = Sklad.new({:prodact_id => @production.prodact_id, :count => @production.count})
          if sklad.save
            redirect_to productions_path, notice: 'Статус товара успешно изменен, и товар создан на складе'
          end
        end
      else
        redirect_to productions_path, notice: 'Статус товара успешно изменен'
      end

    else
      render :edit
    end
  end

  # DELETE /productions/1
  def destroy
    if @production.destroy
      redirect_to productions_url, notice: 'Товар успешно удален из производства'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production
      @production = Production.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def production_params
      params[:production].permit(:prodact_id,:count,:status,:master)
    end

    def get_products
      @products = Prodact.all
    end
end
