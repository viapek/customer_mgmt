class AppointmentLog < ActiveRecord::Base
  belongs_to :customer
  
  scope :byCustomer, lambda {|c|
    where(:customer_id => c).order('appointment_logs.date DESC')
    }
  
  scope :sorted, lambda {
    order('appointment_logs.date DESC')
  }
end
