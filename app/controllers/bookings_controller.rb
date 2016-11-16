class BookingsController < ApplicationController


  def new
    @yurt = Yurt.find(params[:yurt_id])
    @booking = @yurt.bookings.build(booking_params)
  end

  def create
    @booking = Booking.create(booking_params)
    redirect_to root_path
  end

  def index
    @bookings = Booking.all
  end

  def destroy
    @yurt = Yurt.find(params[:id])
    @yurt.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:yurt_id, :user_id, :start_date, :end_date, :price)
  end
end
