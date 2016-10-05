class PriprofilesController < ApplicationController
  before_action :require_code

  def index
    if current_student.earned_level_id > current_student.level_id && current_student.level_id < 13
      current_student.promote_to_next_level
      @levelup = true
      @new_avatars = Avatar.where("level_id = ?", current_student.level_id).order(:category)
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

  def pledge_email1
    PledgeMailer.email1(params[:email], params[:name], params[:message], current_student.bitly_pledge, current_student).deliver
    redirect_to :priprofile_pledge, alert: "true"
  end

  def pledge_email2
    email_list = ""
    params[:emails].split(/\s*[,;]\s*|[\r\n]+/).each do |email|
      email_list += "#{email},"
    end

    PledgeMailer.email2(email_list, params[:name], params[:message], current_student.bitly_pledge, current_student).deliver
    redirect_to :priprofile_pledge, alert: "true"
  end

  def pledge_email3
    email_list = ""
    params[:emails].split(/\s*[,;]\s*|[\r\n]+/).each do |email|
      email_list += "#{email},"
    end

    PledgeMailer.email3(email_list, params[:message], current_student).deliver
    redirect_to :priprofile_pledge, alert: "true"
  end
end
