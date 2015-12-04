class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource

  def layout_by_resource
    if devise_controller? && action_name == 'new'
      "application"
    elsif devise_controller? && resource_name == :worker
      "workers"
    elsif devise_controller? && resource_name == :customer
      "customers"
    else
      "application"
    end
  end
end
