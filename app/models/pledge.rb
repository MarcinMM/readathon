class Pledge < ActiveRecord::Base
  include Obscure

  belongs_to :student

  scope :find_by_obscure_id, lambda { |obscure_id|
    Pledge.find self.unobscure_id(obscure_id)
  }

  def total_owed
    if ptype == 'hourly'
      total_minutes = self.student.total_minutes_read
      total = (total_minutes.to_f/60.to_f) * amount.to_f
      total = total > max_amt ? max_amt : total
      total = total < min_amt ? min_amt : total
      return total
    end

    amount
  end

end
