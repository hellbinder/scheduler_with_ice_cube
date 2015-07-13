class Payment < ActiveRecord::Base
  belongs_to :account, dependent: :destroy
end
