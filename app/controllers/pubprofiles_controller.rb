class PubprofilesController < ApplicationController

  def show
    @student = Student.find params[:id]
  end

  def pledge
    @student = Student.find params[:id]
  end

end
