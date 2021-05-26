class ReviewsController < ApplicationController
  before_action :find_restaurant

  def new
    @review = Review.new
  end

  def create
    @review = Review.find(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurand.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
