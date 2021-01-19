module ReadlogMgr
  extend ActiveSupport::Concern

  module ClassMethods
  end

  def total_minutes_read
    Readlog.where("student_id=?", self.id).sum(:minutes) + teacher_minutes_total
  end

  ########################################
  #  Student Section
  ########################################
  def student_readlog_today
    Readlog.where("teacher_id is null and student_id=? and day=?", self.id, Time.zone.now.to_date).first
  end

  def student_readlog_prev_day
    Readlog.where("teacher_id is null and student_id=? and day=?", self.id, Time.zone.yesterday.to_date).first
  end

  def student_minutes_today
    readlog_today = student_readlog_today
    readlog_today.nil? ? 0 : readlog_today.minutes
  end

  def student_minutes_yesterday
    readlog_today = student_readlog_prev_day
    readlog_today.nil? ? 0 : readlog_today.minutes
  end

  def student_minutes_total
    Readlog.where("teacher_id is null and student_id=?", self.id).sum(:minutes)
  end

  def student_minutes_update minutes, prev_day=False
    if prev_day
      readlog_today = student_readlog_prev_day
    else
      readlog_today = student_readlog_today

    if readlog_today.nil?
      readlog_today = Readlog.create(student_id: self.id, minutes: 0, day: Time.zone.now.to_date)
    end

    # Don't allow minutes to go negative.
    if (readlog_today.minutes + minutes) < 0
      return
    end

    total_minutes = minutes + readlog_today.minutes
    readlog_today.update_attribute :minutes, total_minutes
  end

  ########################################
  #  Teacher Section
  ########################################
  def teacher_readlog_today
    Readlog.where("teacher_id=? and student_id=? and day=?", self.teacher_id, self.id, Time.zone.now.to_date).first
  end

  def teacher_minutes_today
    readlog_today = teacher_readlog_today
    readlog_today.nil? ? 0 : readlog_today.minutes
  end

  def teacher_minutes_total
    days_from_start = (Time.zone.today - Rails.configuration.start_date).to_i
    days_from_start = days_from_start < 0 ? 0 : days_from_start
    self.teacher.minutes * days_from_start
  end

  def teacher_minutes_update minutes
    readlog_today = teacher_readlog_today

    if readlog_today.nil?
      readlog_today = Readlog.create(teacher_id: self.teacher_id, student_id: self.id, minutes: 0, day: Time.zone.now.to_date)
    end

    # Don't allow minutes to go negative.
    if (readlog_today.minutes + minutes) < 0
      return
    end

    readlog_today.update_attribute :minutes, minutes
  end

end