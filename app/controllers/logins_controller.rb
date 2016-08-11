class LoginsController < ApplicationController
  before_action :require_code

  def login
    student = Student.find_by_code params[:code]

    if student.nil?
      p "!!!!!!!!! Nope didn't find it"
    else
      p "!!!!!!!!! We found one"
    end

    redirect_to :login
  end

  def register

  end
end
