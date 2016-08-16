class PubprofilesController < ApplicationController

  def show
    @student = Student.find params[:id]
  end

  def pledge
    @student = Student.find params[:id]
  end

  def make_pledge
    @student = Student.find params[:id]
    @pledge = Pledge.new(pledge_params(params))
    @pledge.student_id = params[:id]

    if @pledge.save
      if @pledge.ptype == "flat"
        redirect_to pub_pledge_paypal_path
      else
        redirect_to pub_pledge_thanks_path(@student.id)
      end
    else
      render :action => "pledge"
    end
  end

  def pledge_thanks
    @student = Student.find params[:id]
  end

  def pledge_paypal
    @student = Student.find params[:id]
  end

  private

  def pledge_params params
    params.require(:pledge).permit(:ptype, :name, :email, :amount, :message, :min_amt, :max_amt)
  end

end
