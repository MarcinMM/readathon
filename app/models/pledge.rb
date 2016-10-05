class Pledge < ActiveRecord::Base

  belongs_to :student

  def total_owed
    if ptype == 'hourly'
      total_minutes = self.student.student_minutes_total
      total = total_minutes * amount
p "1 #{total}"
      total = total > max_amt ? max_amt : total
p "2 #{total}"
      total = total < min_amt ? min_amt : total
p "3 #{total}"
      total
    end

    amount
  end

end
