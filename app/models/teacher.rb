class Teacher < ActiveRecord::Base
  include GoldenTicket

  has_many :students
  has_many :readlogs

end
