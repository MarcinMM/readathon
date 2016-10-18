class Teachers::OverviewsController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to :denied if current_user.teacher.nil?
  end
  helper_method :current_teacher

  def index
    @switch_teacher = switch_teacher
    @switch = params[:switch]

    teacher = params[:switch] == 'yes' ? switch_teacher : current_teacher
    @students = Student.where("teacher_id=?", teacher.id).order(:last)
  end

  def log_time
    unless params[:student_id].nil?
      params[:student_id].each do |id|
        student = Student.find(id)
        student.teacher_minutes_update params[:minutes].to_i
      end
    end

    redirect_to teachers_overviews_path(switch: params[:switch]), notice: {title: 'Success', msg: 'Logged classroom reading time for students.'}
  end

  private

  def current_teacher
    RequestStore.store[:current_teacher] ||= Teacher.find_by_user_id current_user.id
  end

  def switch_teacher
    Teacher.find current_teacher.id.even? ? current_teacher.id - 1 : current_teacher.id + 1
  end

end