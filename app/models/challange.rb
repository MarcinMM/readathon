class Challange < ActiveRecord::Base

  has_and_belongs_to_many :students

  scope :daily_challange, lambda {
    day_idx = (Rails.configuration.end_date - Date.today).to_i
    Challange.find day_idx
  }

end
