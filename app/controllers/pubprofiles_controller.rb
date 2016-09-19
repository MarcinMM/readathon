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
    @pledge.name = @pledge.name == 'Name or Nickname (optional)' ? 'Anonymous' : @pledge.name
    @pledge.message.delete!('Message (optional)')
    @pledge.amount = params[:pledge]['amount'].delete('$ ,')
    @pledge.min_amt = params[:pledge]['min_amt'].delete('$ ,')
    @pledge.max_amt = params[:pledge]['max_amt'].delete('$ ,')

    if @pledge.save
      if @pledge.ptype == "flat"
        redirect_to pub_pledge_paypal_path(@pledge.id)
      else
        redirect_to pub_pledge_thanks_path(@pledge.id)
      end
    else
      render :action => "pledge"
    end
  end

  def pledge_thanks
    @pledge = Pledge.find params[:id]
  end

  def pledge_paypal
    @pledge = Pledge.find params[:id]
  end

  private

  def pledge_params params
    params.require(:pledge).permit(:ptype, :name, :email, :amount, :message, :min_amt, :max_amt)
  end

end
