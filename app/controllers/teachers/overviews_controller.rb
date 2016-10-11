class Teachers::OverviewsController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to :denied if current_user.teacher.nil?
  end
  helper_method :current_teacher

  def index
#    @summary = Registration.get_summary
  end

  def log_time
    redirect_to teachers_overviews_path, notice: {title: 'Success', msg: 'Logged classroom reading time for students.'}
  end

  private

  def current_teacher
    RequestStore.store[:current_teacher] ||= Teacher.find_by_user_id current_user.id
  end


end