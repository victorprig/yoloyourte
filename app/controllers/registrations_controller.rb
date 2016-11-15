class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    # new_profile_path(resource)
    # profiles_path()
    # @profile = Profile.new
    @profile = current_user.build_profile
    @profile.save
    super
  end
end
