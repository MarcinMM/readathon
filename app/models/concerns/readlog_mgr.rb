module ReadlogMgr
  extend ActiveSupport::Concern

  module ClassMethods
  end

  def student_readlog_today
    Readlog.where("student_id=? and day=?", self.id, DateTime.now.to_date).first
  end

  def student_minutes_today
    readlog_today = student_readlog_today
    readlog_today.nil? ? 0 : readlog_today.minutes
  end

  def student_minutes_total
    self.readlogs.sum(:minutes)
  end

  def student_minutes_update minutes
    readlog_today = student_readlog_today

    if readlog_today.nil?
      readlog_today = Readlog.create(student_id: self.id, minutes: 0, day:  DateTime.now.to_date)
    end

    # Don't allow minutes to go negative.
    if (readlog_today.minutes + minutes) < 0
      return
    end

    total_minutes = minutes + readlog_today.minutes
    readlog_today.update_attribute :minutes, total_minutes
  end

  def teacher_readlog_today
  end
end