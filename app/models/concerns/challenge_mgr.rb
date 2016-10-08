module ChallengeMgr
  extend ActiveSupport::Concern

  module ClassMethods
  end

  def daily_challenge_complete
    self.challenges.each do |challenge|
        if Challenge.daily_challenge.id == challenge.id
          return true
        end
    end

    false
  end
end