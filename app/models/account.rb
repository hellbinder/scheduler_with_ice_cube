class Account < ActiveRecord::Base
  include IceCube
  serialize :recurring_schedule, Hash
  has_many :payments
  has_many :recurring_payments
  validates_presence_of :name
  validates_presence_of :description
  
  #Below method will override the proprerty so it will store the rule as a hash instead of string.
  
  #https://github.com/GetJobber/recurring_select/issues/6 
  #helped me fix the issue where it was storing rules as a string and needed it as a hash (can also be done in yaml if so desired)
  def recurring_schedule=(new_rule)
    if RecurringSelect.is_valid_rule?(new_rule)
      write_attribute(:recurring_schedule, RecurringSelect.dirty_hash_to_rule(new_rule).to_hash)
    else
      write_attribute(:recurring_schedule, nil)
    end
  end

  #returns the schedule with the recurrent rule saved. This can then be used to query the database for recurring schedules and create background jobs if needed (or anything you can think of)
  def converted_schedule
    if !self.read_attribute(:recurring_schedule).empty?
        the_schedule = IceCube::Schedule.new( self.created_at )
        the_rule    = RecurringSelect.dirty_hash_to_rule( self.read_attribute(:recurring_schedule) )
     if RecurringSelect.is_valid_rule?(the_rule)
        the_schedule.add_recurrence_rule(the_rule)
     end
     the_schedule
    end
  end

  def self.upcoming_payments
    upcoming_payments = all.map do |account|
      account.converted_schedule.occurrences(Date.today + 10.days)
    end
    upcoming_payments
  end
end
