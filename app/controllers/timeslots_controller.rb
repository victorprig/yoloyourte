class TimeslotsController < ApplicationController
    before_action :authenticate_user!
  def show
  end

  def edit
  end

  def update
  end

  def create
     @yurt = Yurt.find(params[:yurt_id])
       @timeslot = @yurt.timeslots.build(timeslot_params)
    if @timeslot.save
      redirect_to yurt_path(@yurt)
    else
      render :new
    end
  end

  def new
    @yurt = Yurt.find(params[:yurt_id])
    @timeslot = Timeslot.new
  end

  def destroy
  end

  def index
    @timeslots = Timeslot.all
  end

  private

  def timeslot_params
    params.require(:timeslot).permit(:start_date, :end_date, :yurt_id)
  end

end

