class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_student
  helper_method :profile_bitly_url
  helper_method :profile_pledge_bitly_url
  helper_method :obscure_id

  private

  def require_code
    if cookies[:code].nil? || current_student.nil?
      redirect_to :login_screen
    end
  end

  def current_student
    RequestStore.store[:current_student] ||= Student.find_by_code cookies[:code]
  end

  def profile_bitly_url id
    if Rails.env.development?
      Bitly.client.shorten("http://readathon.gltech.com/public/profile/#{obscure_id(1)}").short_url
    else
      Bitly.client.shorten(pub_profile_url(obscure_id(id))).short_url
    end
  end

  def profile_pledge_bitly_url id
    if Rails.env.development?
      Bitly.client.shorten("http://readathon.gltech.com/public/pledge/#{obscure_id(1)}").short_url
    else
      Bitly.client.shorten(pub_make_pledge_url(obscure_id(id))).short_url
    end
  end

  def obscure_id id
    padded_id = "#{rand.to_s[2..11]}#{id.to_s}"
    Base64.urlsafe_encode64(padded_id)
  end

  def unobscure_id id
    padded_id = Base64.urlsafe_decode64(id)
    padded_id[10..-1]
  end
end
