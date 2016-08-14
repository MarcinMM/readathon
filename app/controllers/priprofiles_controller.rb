class PriprofilesController < ApplicationController
  before_action :require_code

  def index
    @student = current_student
  end

  def add_15_minutes
    current_student.student_minutes_update 15
    redirect_to :priprofile_index
  end

  def subtract_15_minutes
    current_student.student_minutes_update -15
    redirect_to :priprofile_index
  end

end
