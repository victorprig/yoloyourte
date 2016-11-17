class YurtsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :destroy, :update, :edit ]

  def create
    @yurt = current_user.yurts.build(yurt_params)
    if @yurt.save
      redirect_to yurts_path
    else
      render :new
    end
  end

  def new
    @yurt = Yurt.new
  end

  def show
    @yurt = Yurt.find(params[:id])
    @booking = Booking.new
  end

def index
  @yurts = Yurt.all
end

  def index_all
    @yurts = Yurt.all
  if params[:searchclimate] && params[:searchshape]
    @yurts = Yurt.searchyurt(params[:searchclimate], params[:searchshape]).order("created_at DESC")
  else
    @yurts = Yurt.all.order('created_at DESC')
  end
  end

  def update
    @yurt = Yurt.find(params[:id])
    @yurt.update(yurt_params)
    redirect_to yurt_path(@yurt)
  end

  def edit
    @yurt = Yurt.find(params[:id])
  end

  def destroy
    @yurt = Yurt.find(params[:id])
    @yurt.destroy
    redirect_to root_path
  end

  private

  def yurt_params
    params.require(:yurt).permit(:name, :description, :location, :daily_rate, :shape, :climate, :user_id, :photo_cache)
  end

end


