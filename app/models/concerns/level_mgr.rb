module LevelMgr
  extend ActiveSupport::Concern

  module ClassMethods
  end

  def mins_to_next_level
    next_level_id = self.level_id + 1
    next_level = Level.find next_level_id
    mins_left = next_level.minutes - self.student_minutes_total
    mins_left < 0 ? 0 : mins_left
  end

  def promote_to_next_level
    self.update_attribute :level_id,  self.level_id + 1
  end

end