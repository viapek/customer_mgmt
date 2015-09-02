class Customer < ActiveRecord::Base
  has_many :appointments
  has_many :payments
  has_many :appointment_logs
  
  REGEX_EMAIL = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  
  validates :name, 
            :presence => true,
            :length => {:maximum => 50}
  validates :email,
            :length => {:maximum => 100},
            :format => REGEX_EMAIL
            
  scope :sorted, lambda {
    order('customers.name ASC')
  }

  
end
