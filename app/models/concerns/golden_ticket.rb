module GoldenTicket
  extend ActiveSupport::Concern

  module ClassMethods
  end

  def gt_percent
    total_minutes = Student.joins(:readlogs).where("students.teacher_id=? and readlogs.teacher_id is null", self.id).sum("readlogs.minutes")
    gt_total_minutes / total_minutes
  end

  def gt_total_minutes
    self.total_students * self.reading_goal
  end

end