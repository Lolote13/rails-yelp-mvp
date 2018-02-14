class ReviewsController < ApplicationController

  before_action :find_restaurant

  def new
    @restaurant = find_restaurant
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = find_restaurant
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def find_restaurant
    Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
