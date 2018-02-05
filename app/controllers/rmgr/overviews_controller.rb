class Rmgr::OverviewsController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to :denied unless current_user.admin?
  end

  def index
    @summary_k = get_summary_by_grade 0
    @summary_1 = get_summary_by_grade 1
    @summary_2 = get_summary_by_grade 2
    @summary_3 = get_summary_by_grade 3
    @summary_4 = get_summary_by_grade 4
    @summary_5 = get_summary_by_grade 5

    @summary_t = {
        registered: @summary_k[:registered] + @summary_1[:registered] + @summary_2[:registered] + @summary_3[:registered] + @summary_4[:registered] + @summary_5[:registered],
        minutes: @summary_k[:minutes] + @summary_1[:minutes] + @summary_2[:minutes] + @summary_3[:minutes] + @summary_4[:minutes] + @summary_5[:minutes],
        collected: @summary_k[:collected] + @summary_1[:collected] + @summary_2[:collected] + @summary_3[:collected] + @summary_4[:collected] + @summary_5[:collected]
    }
  end

  def uncollected
    @pledges = Pledge.where("col_amt is null")
    headers['Content-Disposition'] = "attachment; filename=\"uncollected_pledges.csv\""
    headers['Content-Type'] ||= 'text/csv'
  end

  def collected
    @pledges = Pledge.where("col_amt is not null")
    headers['Content-Disposition'] = "attachment; filename=\"collected_pledges.csv\""
    headers['Content-Type'] ||= 'text/csv'
  end

  def pledge_email
    pledge = Pledge.find params[:id]
    GeneralMailer.pledge_payment(pledge).deliver

  end

  private

  def get_summary_by_grade grade

    registered = 0
    minutes = 0
    pledged = 0
    collected = 0
    teachers = Array.new

    Teacher.where("grade=?", grade).each do |teacher|
      tregistered = 0
      tminutes = 0
      tcollected = 0

      teacher.students.each do |student|
        tregistered += 1
        tminutes += student.total_minutes_read

        student.pledges.each do |pledge|
          unless pledge.col_amt.nil?
            tcollected += pledge.col_amt
          end
        end
      end

      registered += tregistered
      minutes += tminutes
      collected += tcollected

      teachers << {id: teacher.id, grade: teacher.grade, last: teacher.name, registered: tregistered, minutes: tminutes, collected: tcollected}
    end

    {registered: registered, minutes: minutes, collected: collected, teachers: teachers}
  end

end