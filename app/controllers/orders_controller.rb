class OrdersController < ApplicationController
  before_action :check_cart, only: :create

  def create
    @order = current_user.orders.build order_params
    if @order.save
      create_order_product
      session[:cart].clear
      flash[:success] = t "order_success"
    else
      flash[:danger] = t "order_failse"
    end
    redirect_to root_url
  end

  private

  def order_params
    params.require(:order).permit Order::ORDER_PARAMS
  end

  def check_cart
    return unless current_cart.empty?
    flash[:danger] = t "cart_empty"
    redirect_to root_url
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
        redirect_to root_url
      end
    end
  end
end
