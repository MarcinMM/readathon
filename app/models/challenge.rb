class Challenge < ActiveRecord::Base

  has_and_belongs_to_many :students, -> { uniq }

  scope :daily_challenge, lambda {
    if days_remaining > 0 && days_remaining < 12
      return Challenge.find(days_remaining)
    end

    Challenge.new(id: -1)
  }

  def self.days_remaining
    11
    #(Rails.configuration.end_date - Time.zone.today).to_i
  end

end
