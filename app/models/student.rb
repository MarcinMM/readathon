class Student < ActiveRecord::Base
  include CodeGen, ReadlogMgr, PledgeSummary, LevelMgr, ChallanageMgr

  belongs_to :teacher
  belongs_to :level
  has_many :readlogs
  has_many :pledges, -> { order 'created_at desc' }
  has_and_belongs_to_many :challanges, -> { uniq }

end
