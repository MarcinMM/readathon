class Pledge < ActiveRecord::Base

  belongs_to :student

  def total_owed
    if ptype == 'hourly'
      total_minutes = self.student.student_minutes_total
      total = total_minutes * amount
      total = total > max_amt ? max_amt : total
      total = total < min_amt ? min_amt : total
      return total
    end

    amount
  end

end
