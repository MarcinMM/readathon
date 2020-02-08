class Challenge < ActiveRecord::Base

  has_and_belongs_to_many :students, -> { uniq }

  # This should really come from config but date math is hard and time is expensive.
  DAYS_IN_CHALLENGE = 12

  scope :daily_challenge, lambda {
    if active_challenge
      return Challenge.find(days_remaining)
    end

    Challenge.new(id: -1)
  }

  def self.days_remaining
    (Rails.configuration.end_date - Time.zone.today).to_i
  end

  def self.active_challenge
    return days_remaining >= 0 && days_remaining < DAYS_IN_CHALLENGE
  end

  def self.allow_minutes
    return days_remaining >=-1 && days_remaining < DAYS_IN_CHALLENGE
  end

end
