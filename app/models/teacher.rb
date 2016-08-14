class Teacher < ActiveRecord::Base

  belongs_to :user
  has_many :students
  has_many :readlogs

  accepts_nested_attributes_for :user
end
