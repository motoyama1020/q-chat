class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search_room

  def search
    @results = @p.result.all.order(created_at: :desc)
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def search_room
    @p = Room.ransack(params[:q])
  end
end
