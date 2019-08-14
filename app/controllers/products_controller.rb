class ProductsController < ApplicationController
  before_action :load_product, only: :show
  def show
    @list_review = @product.reviews.create_desc
  end
end
