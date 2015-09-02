class Appointment < ActiveRecord::Base
  belongs_to :customer
  
  validates :start_time, 
            :presence => true,
            :uniqueness => { :scope => :day }
  
  scope :byCustomer, lambda {|c|
    where(:customer => c).order('appointments.day, appointments.start_time ASC')
    }
    
  scope :sorted, lambda {
    order('appointments.day, appointments.start_time ASC')
    }
    
end
