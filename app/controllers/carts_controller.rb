class CartsController < ApplicationController
  before_action :set_cart, :check_quantity, :check_num_exist, only: :create
  before_action :load_item, only: :destroy
  before_action :total_cart, only: :index

  def create
    session[:cart][params[:id]] = params[:quantity].to_i
    flash[:success] = t "update_cart"
    redirect_to carts_path
  end

  def index
    @order = current_user.orders.build if logged_in?
  end

  def destroy
    session[:cart].delete params[:id]
    flash[:success] = t "delete_cart"
    redirect_to carts_path
  end

  private

  def set_cart
    return if session[:cart]
    session[:cart] = {}
  end

  def check_num_exist
    quantity = params[:quantity].to_i
    num_exist = params[:num_exist].to_i
    return unless quantity > num_exist
    flash[:danger] = t("quantity_in_stock") << params[:num_exist]
    redirect_to product_path(params[:id])
  end

  def check_quantity
    quantity = params[:quantity].to_i
    return if quantity.positive?
    flash[:danger] = t "please_enter_num"
    redirect_to product_path(params[:id])
  end

  def load_item
    return if session[:cart].include? params[:id]
    flash[:danger] = t "not_found_product"
    redirect_to carts_path
  end

  def total_cart
    return unless current_cart?
    @total = 0
    session[:cart].each do |key, val|
      product = find_product key
      price = product.price * val
      @total += price
    end
    @total
  end
end
