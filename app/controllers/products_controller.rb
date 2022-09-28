class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

  def is_sold_out
    @product.quantity == 0 ? true : false
  end

end
