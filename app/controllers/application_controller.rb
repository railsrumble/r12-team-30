class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def clear_stored_location
    session[:return_to] = nil
  end

  def redirect_to_previous_page(resource_or_scope)
    case resource_or_scope
    when :user, User
      store_location = session[:return_to]
      clear_stored_location
      (store_location.nil?) ? "/" : store_location.to_s
    else
      super
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    redirect_to_previous_page(resource_or_scope)
  end

  def after_sign_up_path_for(resource_or_scope)
    redirect_to_previous_page(resource_or_scope)
  end

  def after_sign_out_path_for(resource_or_scope)
    redirect_to_previous_page(resource_or_scope)
  end
end
