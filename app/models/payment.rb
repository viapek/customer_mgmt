class Payment < ActiveRecord::Base
  belongs_to :customer
  
  validates_presence_of :customer_id
  validates_numericality_of :amount, :greater_than => 49999, :message => 'Please check that the amount > 49999'

  scope :byCustomer, lambda {|c|
    where(:customer => c).order('payments.date DESC')
    }
    
  scope :sorted, lambda {
    order('payments.date DESC')
    }

end
