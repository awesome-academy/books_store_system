class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception
  include SessionsHelper
  include CartsHelper

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def load_product
    return if @product = Product.find_by(id: params[:id])
    flash[:danger] = t "not_found_product"
    redirect_to root_url
  end
end
