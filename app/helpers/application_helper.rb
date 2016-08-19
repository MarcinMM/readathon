module ApplicationHelper

  def mins_to_words mins
    hh, mm = mins.divmod(60)
    "%dh %dm" % [hh, mm]
  end
end
