module ApplicationHelper

  def mins_to_words mins
    hh, mm = mins.divmod(60)
    "%dh %dm" % [hh, mm]
  end

  def days_to_end
    days_to_end = (Rails.configuration.end_date - Time.zone.today).to_i
    days_to_end < 0 ? 0 : days_to_end
  end
end
