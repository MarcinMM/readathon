class Student < ActiveRecord::Base
  include CodeGen, ReadlogMgr, PledgeSummary, LevelMgr, ChallengeMgr, Obscure

  belongs_to :user
  belongs_to :teacher
  belongs_to :level
  has_many :readlogs
  has_many :pledges, -> { order 'created_at desc' }
  has_and_belongs_to_many :challenges, -> { uniq }

  scope :find_by_obscure_id, lambda { |obscure_id|
    Student.find self.unobscure_id(obscure_id)
  }

end
