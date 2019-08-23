class StaticPagesController < ApplicationController
  
  def home
    @new = Product.create_desc
    @top = Product.top_sale
  end
end
