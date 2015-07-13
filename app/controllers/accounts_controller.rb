class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
    @payments = @account.payments
  end

  def new
    @account = Account.new
  end
  
  def create
    @account = Account.new(account_params)
    respond_to do |r|
      r.html do
        if @account.save
          redirect_to @account, notice: "Account was saved "
        else
          render 'new'
        end
      end
    end
  end
  
  def edit
    @account = Account.find(params[:id])
  end
  
  def update
    @account = Account.find(params[:id])
    respond_to do |r|
      r.html do
        if @account.update(account_params)
          redirect_to @account, notice: "Account payment updated"
        else
          render 'new'
        end
      end
    end
  end

  def destroy
    account = Account.find(params[:id])
    if account.delete
      redirect_to accounts_path, notice: 'Account has been deleted'
    end
  end
  
  private
  def account_params
    params.require(:account).permit(:name, :description, :recurring_schedule)
  end
end
