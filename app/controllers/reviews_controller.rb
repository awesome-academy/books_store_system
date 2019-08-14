class ReviewsController < ApplicationController
  def new; end

  def create
    @review = current_user.reviews.build review_params

    if @review.save
      flash[:success] = t "review_success"
    else
      flash[:danger] = t "reviewfails"
    end
    redirect_to product_path(id: @review.product_id)
  end

  private

  def review_params
    params.require(:review).permit Review::REVIEW_PARAMS
  end
end
