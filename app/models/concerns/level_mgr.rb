module LevelMgr
  extend ActiveSupport::Concern

  module ClassMethods
  end

  def mins_to_next_level
    next_level_id = self.level_id + 1
    next_level = Level.find next_level_id
    next_level.minutes - self.student_minutes_total
  end



end