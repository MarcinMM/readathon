class Pledge < ActiveRecord::Base
  include Obscure

  belongs_to :student

  scope :find_by_obscure_id, lambda { |obscure_id|
    Pledge.find self.unobscure_id(obscure_id)
  }

end
