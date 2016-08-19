module PledgeSummary
  extend ActiveSupport::Concern

  module ClassMethods
  end

  def pledged_per_hour
    self.pledges.select{ |p| p.ptype == "hourly"}.map{ |p| p.amount}.reduce {|sum, n| sum + n}
  end

  def pledged_flat
    self.pledges.select{ |p| p.ptype == "flat"}.map{ |p| p.amount}.reduce {|sum, n| sum + n}
  end


  def money_raised
    total = (pledged_per_hour / 60) * student_minutes_total
    total += pledged_flat
  end

end