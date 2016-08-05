class Teachers::OverviewsController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to :denied unless current_user.teacher?
  end

  def index
#    @summary = Registration.get_summary
  end

  def search
#    @results = Registration.search params[:term]
  end


end