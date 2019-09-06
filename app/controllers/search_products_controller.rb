class SearchProductsController < ApplicationController
  def search
    @q = Product.ransack(params[:q])
    @products = @q.result.limit Settings.search_result
    respond_to(&:js)
  end
end
