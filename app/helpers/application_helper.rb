module ApplicationHelper

  def mins_to_words mins
    hh, mm = mins.divmod(60)
    "%dh %dm" % [hh, mm]
  end

  def days_to_end
    (Rails.configuration.end_date - Date.today).to_i
  end
end
