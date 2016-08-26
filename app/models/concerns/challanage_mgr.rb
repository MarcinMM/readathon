module ChallanageMgr
  extend ActiveSupport::Concern

  module ClassMethods
  end

  def daily_challange_complete
    self.challanges.each do |challange|
        if Challange.daily_challange.id == challange.id
          return true
        end
    end

    false
  end
end