module GoldenTicket
  extend ActiveSupport::Concern

  module ClassMethods
  end

  def percent_boost
    30
  end

  def total_minutes
    Student.joins(:readlogs).where("students.teacher_id=? and readlogs.teacher_id is null", self.id).sum("readlogs.minutes")
  end

  def gt_percent
    if gt_total_minutes > 0
      return ((total_minutes.to_f / gt_total_minutes.to_f) * 100).round(0) + percent_boost
    else
      return 0
    end
  end

  def gt_total_minutes
    if self.total_students
      return self.total_students * self.reading_goal
    else
      return 0
  end

end