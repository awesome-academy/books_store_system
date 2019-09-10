class ReviewsController < ApplicationController
  load_and_authorize_resource
  before_action :load_review, only: %i(edit update destroy)

  def new; end

  def create
    @review = current_user.reviews.build review_params

    if @review.save
      update_view
      respond_to do |f|
        f.html{redirect_to @review.product}
        f.js
      end
    else
      flash[:danger] = t "review_fails"
      redirect_to @review.product
    end
  end

  def edit
    respond_to(&:js)
  end

  def update
    if @review.update_attributes review_params
      update_view
      respond_to(&:js)
    else
      flash[:danger] = t "update_fail"
      redirect_to @review.product
    end
  end

  def destroy
    @review.destroy
    update_view
    respond_to(&:js)
  end

  private

  def review_params
    params.require(:review).permit Review::REVIEW_PARAMS
  end

  def load_review
    return if @review = current_user.reviews.find_by(id: params[:id])
    flash[:danger] = t "not_found_review"
    redirect_to root_url
  end

  def update_view
    @reviews = @review.product.reviews
    @review_size = @reviews.size
    @review_rate = average_star
  end
end
