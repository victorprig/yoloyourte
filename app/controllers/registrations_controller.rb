class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    @profile = current_user.build_profile
    @profile.save
    super
  end
end
