class RecurringPayment < ActiveRecord::Base
    include IceCube
    
  belongs_to :account
  validates_presence_of :account_id
  
  def upcoming_payments
  end
end
