module LevelMgr
  extend ActiveSupport::Concern

  module ClassMethods
  end

  def mins_to_next_level
    if self.level_id == 13
      return 9999;
    end

    next_level_id = self.level_id + 1
    next_level = Level.find next_level_id
    mins_left = next_level.minutes - self.total_minutes_read
    mins_left < 0 ? 0 : mins_left
  end

  def earned_level_id
    level = Level.where("minutes <= ?", self.total_minutes_read).order(id: :desc).first
    level.id
  end

  def promote_to_next_level
    self.update_attribute :level_id, earned_level_id
  end

  def next_level_id
    self.level_id + 1
  end

end