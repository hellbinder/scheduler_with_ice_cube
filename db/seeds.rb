# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#range helper 
def range (min, max)
    rand * (max-min) + min
end

#payment helper for account
def create_payment_for_account(account, n_repeat)
  (1..n_repeat).each do |n|
    account.payments.create(amount: range(50,300))
  end
end

#This will create the accounts with different type of recurring rules
#Destroy all accounts
Account.destroy_all
#Once a month account
new_rule = IceCube::Rule.monthly.day_of_month(1)
Account.create(name: 'Monthly Schecule Account', 
              description: 'Account which holds a schedule for the first day of each month', 
              recurring_schedule: new_rule.to_hash)

create_payment_for_account(Account.last, range(4,13))

#Twice a month account
new_rule = IceCube::Rule.monthly.day_of_month([1,15])
Account.create(name: '2X Monthly Schecule Account', 
              description: 'Account which holds a schedule for the 1st and 15th of each month', 
              recurring_schedule: new_rule.to_hash)

create_payment_for_account(Account.last, range(4,13))

#Twice a month account
Account.create(name: 'No recurring_schedule account', 
              description: 'Account which holds a no recurring schedule', 
              recurring_schedule: nil)
              
create_payment_for_account(Account.last, range(4,6))

#Twice a month account
new_rule = IceCube::Rule.weekly(2).day(:monday, :tuesday)
Account.create(name: 'Custom Schecule Account', 
              description: 'Account which holds a custom weekly schedule', 
              recurring_schedule: new_rule.to_hash)

create_payment_for_account(Account.last, range(4,13))