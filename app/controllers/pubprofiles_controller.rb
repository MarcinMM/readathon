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

    if params[:pledge]['min_amt'] != nil
      @pledge.min_amt = params[:pledge]['min_amt'].delete('$ ,')
    end

    if params[:pledge]['max_amt'] != nil
      @pledge.max_amt = params[:pledge]['max_amt'].delete('$ ,')
    end

    if @pledge.save
      if @pledge.ptype == "flat"
        redirect_to pub_pledge_ahrf_path(@pledge.obscure_id)
      else
        redirect_to pub_pledge_thanks_path(@pledge.obscure_id)
      end
    else
      render :action => "pledge"
    end
  end

  def pledge_thanks
    @pledge = Pledge.find_by_obscure_id params[:id]
  end

  def pledge_ahrf
    @pledge = Pledge.find_by_obscure_id params[:id]

    if @pledge.email_click_date.nil?
      @pledge.update_attribute :email_click_date, Time.zone.now
    end
  end

  def pledge_ahrh
    @pledge = Pledge.find_by_obscure_id params[:id]

    if @pledge.email_click_date.nil?
      @pledge.update_attribute :email_click_date, Time.zone.now
    end
  end

  def pledge_email
    @pledge = Pledge.find params[:id]
    render 'general_mailer/pledge_payment'
  end

  private

  def pledge_params params
    params.require(:pledge).permit(:ptype, :name, :email, :amount, :message, :min_amt, :max_amt)
  end

end
