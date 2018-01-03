class PubprofilesController < ApplicationController
  layout "mailer", only: [:pledge_email]
  skip_before_action :verify_authenticity_token, :only => [:pledge_receipt, :pledge_thanks]

  def direct
    if current_user.nil?
      render :action => "home"
    else
      redirect_to account_path
    end
  end

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
      redirect_to pub_pledge_paypal_path(@pledge.id)
    else
      render :action => "pledge"
    end
  end

  def pledge_paypal
    @pledge = Pledge.find params[:id]
  end

  def pledge_receipt
    if params[:payment_status] == "Completed"
      pledge_id = params[:invoice].split('-')[0]
      pledge = Pledge.find_by_obscure_id pledge_id
      pledge.col_amt = params[:payment_gross]
      pledge.col_fee = params[:payment_fee]
      pledge.col_date = params[:payment_date]

      if payment.save
        logger.info "Saved Pledge: #{params[:invoice]} #{params[:payment_gross]} #{params[:payment_status]} #{params[:payment_date]}"
      else
        logger.info "Failed to save pledge: #{params[:invoice]} #{params[:payment_gross]} #{params[:payment_status]} #{params[:payment_date]}"
      end
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
