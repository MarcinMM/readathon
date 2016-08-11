class Student < ActiveRecord::Base
  include CodeGen

  belongs_to :teacher
end
