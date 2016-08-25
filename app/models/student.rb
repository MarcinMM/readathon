class Student < ActiveRecord::Base
  include CodeGen, ReadlogMgr, PledgeSummary, LevelMgr, ChallanageMgr

  belongs_to :teacher
  belongs_to :level
  has_many :readlogs
  has_many :pledges
  has_and_belongs_to_many :challanges

end
