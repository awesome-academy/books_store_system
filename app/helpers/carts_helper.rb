module CartsHelper
  def find_product id
    product = Product.find_by id: id
    return Product.find_by id: id if product
    flash[:danger] = t "not_found_product"
    redirect_to root_url
  end

  def total_price price, num
    price * num
  end

  def cart_size
    session[:cart].size
  end

  def current_cart
    @curren_cart = session[:cart]
  end

  def current_cart?
    current_cart.present?
  end

  def user_name
    return current_user.name if current_user
  end

  def user_phone
    return current_user.phone if current_user.phone.present?
  end

  def user_address
    return current_user.address if current_user.address.present?
  end
end
