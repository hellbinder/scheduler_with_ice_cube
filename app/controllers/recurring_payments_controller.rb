class RecurringPaymentsController < ApplicationController
  before_filter :get_account, except: [:destroy]
  def new
    @new_payment_schedule = @account.recurring_payments.new
  end

  def create
    rp = @account.recurring_payments.new(recurring_payments_params)
    respond_to do |r|
      if rp.save
        r.html do
          redirect_to @account, notice: "Recurrent payment saved"
        end
      else
      r.html do
        flash[:error] = "Error when saving recurrency"
        params[:account_id] = rp.account_id
        redirect_to new_account_recurring_payment_path(@account)
      end
      end
    end
  end
  
  def destroy
    rp = RecurringPayment.find(params[:id])
    account_id = rp.account_id
    rp.destroy
    redirect_to account_path(account_id), notice: "Schedule removed"
  end

  def show
  end
  
  private
  def recurring_payments_params
    params.require(:recurring_payment).permit(:schedule, :account_id)
  end
  
  def get_account
    @account = Account.find(params[:account_id])
  end
end
