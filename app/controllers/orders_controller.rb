class OrdersController < ApplicationController
  before_action :check_cart, only: :create
  before_action :user_login?, only: :index

  def index
    @orders = current_user.orders.create_desc
  end
  
  def create
    @order = current_user.orders.build order_params
    if @order.save
      create_order_product
      update_product
      session[:cart].clear
      flash[:success] = t "order_success"
    else
      flash[:danger] = t "order_failse"
    end
    redirect_to carts_path
  end

  private

  def order_params
    params.require(:order).permit Order::ORDER_PARAMS
  end

  def check_cart
    return unless current_cart.empty?
    flash[:danger] = t "cart_empty"
    redirect_to carts_path
  end

  def total_price key, val
    product = find_product key
    product.price * val
  end

  def create_order_product
    current_cart.each do |key, val|
      @order_product = @order.order_products.build product_id: key,
        num_product: val, price: total_price(key, val)
      unless @order_product.save
        flash[:danger] = t "order_failse"
        redirect_to carts_path
      end
    end
  end

  def update_product
    current_cart.each do |key, val|
      product = find_product key
      num = product.num_exist - val
      unless product.update num_exist: num
        flash[:danger] = t "order_failse"
        redirect_to root_url
      end
    end
  end
end
