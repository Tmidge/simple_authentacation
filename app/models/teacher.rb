class Teacher < ActiveRecord::Base
  has_secure_password

  validates :password, :length => { :minimum => 5}

  has_many :parents
end
