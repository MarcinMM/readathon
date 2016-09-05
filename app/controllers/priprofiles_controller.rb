class PriprofilesController < ApplicationController
  before_action :require_code

  def index
    if current_student.mins_to_next_level == 0
      current_student.promote_to_next_level
      @levelup = true
    end
  end

  def add_15_minutes
    current_student.student_minutes_update 15
    redirect_to :priprofile_index
  end

  def subtract_15_minutes
    current_student.student_minutes_update -15
    redirect_to :priprofile_index
  end

  def avatar
    @student = current_student
    @avatars = Avatar.where("level_id > 0 and level_id < ?", @student.next_level_id).order(level_id: :desc, category: :asc)
    @nextlevel = Avatar.where("level_id = ?", @student.next_level_id).order(:category)
  end

  def avatar_update
    student = current_student
    student.update_attribute :avatar_id, params[:avatar_id]
    redirect_to :priprofile_index
  end

  def challange
    @challange = Challange.daily_challange
    @student = current_student
    @student.challanges << @challange
    render :index
  end

  def pledge_email

  end
end
