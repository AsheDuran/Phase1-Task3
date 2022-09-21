class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
   # flash[:notice] = "Signed in successfully.←sign_in定義されていたら勝手にコメント入る"
    user_path(resource)#いらんかも
  end

  def after_sign_up_path_for(resource)
    #flash[:notice] = "Welcome! You have signed up successfully.←sign_up定義されていたら勝手にコメント入る"
    user_path(resource)#いらんかも
  end

  def after_sign_out_path_for(resource)
    #flash[:notice] = "Signed out successfully."
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end
end
