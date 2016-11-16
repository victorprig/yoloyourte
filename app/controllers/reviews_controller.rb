class ReviewsController < ApplicationController
  before_action :load_booking, only: [:create]

  def create
    @booking.review = Review.new(review_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def index
    @reviews = Review.all
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

  def load_booking
    @booking = Booking.find(params[:booking_id])
  end

end
