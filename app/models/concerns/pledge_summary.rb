module PledgeSummary
  extend ActiveSupport::Concern

  module ClassMethods
  end

  def pledged_flat
    pf = self.pledges.map{ |p| p.amount}.reduce {|sum, n| sum + n}
    pf.nil? ? 0 : pf
  end


  def money_raised
    pledged_flat
  end

end