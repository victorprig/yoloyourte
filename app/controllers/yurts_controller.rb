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
    @alert_message = "You are viewing #{@yurt.name}"
    @yurt_coordinates = { lat: @yurt.latitude, lng: @yurt.longitude }
  end

def index
  @yurts = Yurt.all
end

  def index_all

    if params[:searchclimate] || params[:searchshape]
      @yurts = Yurt.searchyurt(params[:searchclimate], params[:searchshape]).order("created_at DESC")
      @hash = Gmaps4rails.build_markers(@yurts) do |yurt, marker|
      marker.lat yurt.latitude
      marker.lng yurt.longitude
      # marker.infowindow render_to_string(partial: "/yurts/map_box", locals: { yurt: flat })
    end
    else
      @yurts = Yurt.all.order('created_at DESC')
      @hash = Gmaps4rails.build_markers(@yurts) do |yurt, marker|
      marker.lat yurt.latitude
      marker.lng yurt.longitude
      # marker.infowindow render_to_string(partial: "/yurts/map_box", locals: { yurt: flat })
    end
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
    params.require(:yurt).permit(:name, :description, :location, :daily_rate, :shape, :climate, :user_id, :photo_cache, :photo)
  end

end


