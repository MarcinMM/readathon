class PriprofilesController < ApplicationController
  before_action :require_code

  def index
    @student = current_student
  end

end
