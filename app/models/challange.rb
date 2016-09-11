class Challange < ActiveRecord::Base

  has_and_belongs_to_many :students, -> { uniq }

  scope :daily_challange, lambda {
    day_idx = days_remaining
    Challange.find(day_idx < 0 ? 0 : day_idx)
  }

  def self.days_remaining
    (Rails.configuration.end_date - Date.today).to_i
  end

end
