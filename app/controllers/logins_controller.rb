class LoginsController < ApplicationController

  def autologin
    student = Student.find_by_code params[:id]
    cookies[:code] = student.code
    redirect_to :priprofile_index, notice: "Login Success"
  end

end
