class Student < ActiveRecord::Base
  include CodeGen, ReadlogMgr

  belongs_to :teacher
  has_many :readlogs
  has_many :pledges

end
