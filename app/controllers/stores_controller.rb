class StoresController < ApplicationController

  before_filter :find_store, only: [:edit,:update,:show,:destroy]

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to stores_path, notice: 'Магазин успешно создан'
    else
      render :new
    end
  end

  def index
    @stores = Store.all
  end

  def update
    if @store.update(store_params)
      redirect_to stores_path, notice: 'Магазин успешно изменен'
    else
      render :edit
    end
  end

  def destroy
    if @store.destroy
      redirect_to stores_path, notice: 'Магазин успешно удален'
    else
      redirect_to stores_path, alert: 'Не удалось удалить магазин'
    end
  end

  private
    def store_params
      params[:store].permit(:name,:description)
    end

  def find_store
    @store = Store.find(params[:id])
  end

end
