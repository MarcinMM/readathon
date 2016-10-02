class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_student

  private

  def require_code
    if cookies[:code].nil? || current_student.nil?
      redirect_to :login_screen
    end
  end

  def current_student
    RequestStore.store[:current_student] ||= Student.find_by_code cookies[:code]
  end

end
