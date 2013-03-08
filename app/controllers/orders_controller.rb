class OrdersController < ApplicationController
  respond_to :html, :json

  def search
    @locations = Location.all
    @terminals = Terminal.all
    @categories = Category.all
    @products = Product.all 
    
  end

  def lookup
    cond = {}

    dateFrom = Date.strptime(params[:dateFrom], '%d/%m/%Y')
    dateTo = Date.strptime(params[:dateTo], '%d/%m/%Y')

    @products = Product.joins(:orders).where("
      orders.date >= ? AND orders.date <= ?",
      dateFrom, dateTo
    )

    unless params[:locations] == 'all' then
      @products = @products.where(
        "orders.location_id = ?", params[:locations])
    end

    unless params[:terminals] == 'all' then
      @products = @products.where(
        "orders.terminal_id = ?", params[:terminals])
    end

    unless params[:categories] == 'all' then
      @products = @products.where(
        "orders.category_id = ?", params[:categories])
    end

    unless params[:products] == 'all' then
      @products = @products.where(
        "orders.product_id = ?", params[:products])
    end

    products = []

    @products.each {  |i|

      sales = i.price * i.orders.sum(:quantity) 

      products << {
        :id => i.id,
        :product => i.name,
        :category => i.category.name,
        :sales => sales
      }
    }

    respond_to do |format|
      format.json { render :json => products }
    end

  end
end
