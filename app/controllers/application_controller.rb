class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_student
  helper_method :profile_bitly_url

  private

  def require_code
    if cookies[:code].nil? || current_student.nil?
      redirect_to :login_screen
    end
  end

  def current_student
    return @current_student if defined?(@current_student)
    @current_student = Student.find_by_code cookies[:code]
  end

  def profile_bitly_url
    Bitly.client.shorten(pub_profile_url(current_student.id))
    #Bitly.client.shorten("http://readathon.gltech.com/public/profile/1").short_url
  end
end
