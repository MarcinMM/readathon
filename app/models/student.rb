class Student < ActiveRecord::Base
  include CodeGen, ReadlogMgr, PledgeSummary

  belongs_to :teacher
  belongs_to :level
  has_many :readlogs
  has_many :pledges

end
