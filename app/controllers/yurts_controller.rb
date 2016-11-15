class YurtsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :destroy, :update, :edit ]


  def create
    @yurt = current_user.yurts.build(yurt_params)
    if @yurt.save
      redirect_to yurt_path(@yurt)
    else
      render :new
    end
  end

  def new
    @yurt = Yurt.new
  end

  def show
    @yurt = Yurt.find(params[:id])
  end

  def index
    @yurts = Yurt.all
  end

  def update
    @yurt = Yurt.find(params[:id])
    @yurt.update(yurt_params)
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
    params.require(:yurt).permit(:name, :description, :location, :daily_rate, :shape, :climate, :user_id)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

end


