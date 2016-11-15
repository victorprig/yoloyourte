class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_profile, only: [:edit, :show]
#useless

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :born)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
  #useless, pour l'instant du moins
end




