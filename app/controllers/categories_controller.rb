class CategoriesController < ApplicationController
  before_action :load_category, only: :show

  def show
    @products = Product.by_category(@category)
                    .page(params[:page]).per Settings.paginate
    store_location
  end

  private

  def load_category
    return if @category = Category.find_by(slug: params[:id])
    flash[:danger] = t "not_found_cate"
    redirect_to root_url
  end
end
