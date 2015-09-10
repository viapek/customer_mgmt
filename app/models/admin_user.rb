class AdminUser < ActiveRecord::Base

  has_secure_password

  REGEX_EMAIL = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  FORBIDDEN_USERNAMES = ['root', 'viapek']
  
  validates :email, :presence => true,
                    :format => REGEX_EMAIL,
                    :length => {:maximum => 100},
                    :confirmation => true,
                    :uniqueness => true
  validates :password, :length => {:minimum => 7}
  
end
