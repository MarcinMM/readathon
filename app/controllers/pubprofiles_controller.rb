class PubprofilesController < ApplicationController
  layout "mailer", only: [:pledge_email]

  def show
    @student = Student.find_by_obscure_id params[:id]
  end

  def pledge
    @student = Student.find_by_obscure_id params[:id]
  end

  def make_pledge
    @student = Student.find_by_obscure_id params[:id]
    @pledge = Pledge.new(pledge_params(params))
    @pledge.student_id = @student.id
    @pledge.name = @pledge.name == 'Name or Nickname (optional)' ? 'Anonymous' : @pledge.name
    @pledge.message = @pledge.message == 'Message (optional)' ? '' : @pledge.message
    @pledge.amount = params[:pledge]['amount'].delete('$ ,')

    if @pledge.save
      redirect_to pub_pledge_thanks_path(@pledge.obscure_id)
    else
      render :action => "pledge"
    end
  end

  def pledge_thanks
    @pledge = Pledge.find_by_obscure_id params[:id]
  end

  private

  def pledge_params params
    params.require(:pledge).permit(:name, :email, :amount, :message, :min_amt, :max_amt)
  end

end
